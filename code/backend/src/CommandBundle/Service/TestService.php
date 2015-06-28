<?php
/**
 * Created by IntelliJ IDEA.
 * User: ross
 * Date: 27/06/15
 * Time: 6:58 PM
 */

namespace CommandBundle\Service;


use Doctrine\DBAL\DBALException;

class TestService
{
    public function test()
    {
       throw new DBALException("I made a DBAL exception");
    }
}