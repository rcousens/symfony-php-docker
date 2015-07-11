<?php

namespace AppBundle\Controller;

use JMS\JobQueueBundle\Entity\Job;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/app/example", name="homepage")
     */
    public function indexAction()
    {
        return $this->render('default/index.html.twig');
    }

    /**
     * @Route("/app/mail/spool", name="app_mail_spool")
     */
    public function spoolAction()
    {
        $job = new Job('swiftmailer:spool:send');
        $em = $this->getDoctrine()->getManager();
        $em->persist($job);
        $em->flush();
        return $this->render('default/index.html.twig');
    }

    /**
     * @Route("/app/mail/send", name="app_mail_send")
     */
    public function sendAction()
    {
        $message = \Swift_Message::newInstance()
            ->setSubject('Hello Email')
            ->setFrom('send@example.com')
            ->setTo('recipient@example.com')
            ->setBody(
                "<h1>This is an email</h1><p>This is some text</p><h4>Bye</h4>"
                ,
                'text/html'
            );
        $this->get('mailer')->send($message);

        return new Response("Sent mail!");
    }


    /**
     * @Route("/app/users/create/{number}", name="app_users_create", defaults={"number": 100}, requirements={"number": "\d+"})
     */
    public function createUsersAction($number)
    {
        $em = $this->getDoctrine()->getManager();

        for ($i = 0; $i < $number; $i++) {
            $job = new Job('command:user:create:default');
            $em->persist($job);
        }

        $em->flush();

        return $this->render('default/index.html.twig');
    }

    /**
     * @Route("/app/users/list", name="app_users_list")
     */
    public function listUsersAction()
    {
        $finder = $this->container->get('fos_elastica.finder.app.user');

        $query = new \Elastica\Query();
        $matchAll = new \Elastica\Query\MatchAll();

        $query->setQuery($matchAll);
        $query->setSize(1000);

        $results = $finder->findHybrid($query);

        $elasticaResults = [];

        foreach ($results as $result) {
            $elasticaResults[] = [$result->getResult()->getId() => $result->getResult()->getSource()];
        }

        return new Response(json_encode($elasticaResults));
    }

    /**
     * @Route("/app/exception", name="app_exception")
     */
    public function exceptionAction()
    {
        $user = $this->getDoctrine()->getManager()->getRepository('UserBundle:User')->findOneById(200);

        $user->getEmail();
        throw new \RuntimeException("test");
    }

}
