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
     * @Route("/app/users/index", name="app_users_index")
     */
    public function userAction()
    {
        $job = new Job('fos:elastica:populate');
        $em = $this->getDoctrine()->getManager();
        $em->persist($job);
        $em->flush();
        return $this->render('default/index.html.twig');
    }

    /**
     * @Route("/app/assets", name="app_assets")
     */
    public function assetsAction()
    {
        $job = new Job('assets:install');
        $em = $this->getDoctrine()->getManager();
        $em->persist($job);
        $em->flush();
        return $this->render('default/index.html.twig');
    }

    /**
     * @Route("/app/assetic/{env}", name="app_assetic")
     */
    public function asseticAction($env)
    {
        $job = new Job('assetic:dump', ["--env=$env"]);
        $em = $this->getDoctrine()->getManager();
        $em->persist($job);
        $em->flush();
        return $this->render('default/index.html.twig');
    }

    /**
     * @Route("/app/users/create", name="app_users_create")
     */
    public function createUsersAction()
    {
        for ($i = 0; $i < 200; $i++) {
            $job = new Job('command:user:create:default');
            $em = $this->getDoctrine()->getManager();
            $em->persist($job);
            $em->flush();
        }

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
