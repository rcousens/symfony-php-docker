<?php

namespace AppBundle\Controller;

use JMS\JobQueueBundle\Entity\Job;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

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
     * @Route("/app/users", name="users")
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
     * @Route("/app/assets", name="assets")
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
     * @Route("/app/assetic/{env}", name="assetic")
     */
    public function asseticAction($env)
    {
        $job = new Job('assetic:dump', ["--env=$env"]);
        $em = $this->getDoctrine()->getManager();
        $em->persist($job);
        $em->flush();
        return $this->render('default/index.html.twig');
    }

}
