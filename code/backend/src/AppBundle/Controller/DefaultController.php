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
     * @Route("/app/users", name="homepage")
     */
    public function userAction()
    {
        $job = new Job('fos:elastica:populate');
        $em = $this->getDoctrine()->getManager();
        $em->persist($job);
        $em->flush();
        return $this->render('default/index.html.twig');
    }
}
