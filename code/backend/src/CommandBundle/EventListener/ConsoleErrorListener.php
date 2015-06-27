<?php
namespace CommandBundle\EventListener;

use Symfony\Component\Console\Event\ConsoleExceptionEvent;
use Symfony\Component\Console\Event\ConsoleTerminateEvent;
use Psr\Log\LoggerInterface;

class ConsoleErrorListener
{
    private $logger;

    public function __construct(LoggerInterface $logger)
    {
        $this->logger = $logger;
    }

    public function onConsoleException(ConsoleExceptionEvent $event)
    {
        $command = $event->getCommand();
        $exception = $event->getException();

        $message = sprintf(
            '%s: %s (uncaught exception) at %s line %s while running console command `%s`',
            get_class($exception),
            $exception->getMessage(),
            $exception->getFile(),
            $exception->getLine(),
            $command->getName()
        );

        $this->logger->error($message, array('exception' => $exception));
    }

    public function onConsoleTerminate(ConsoleTerminateEvent $event)
    {
        $statusCode = $event->getExitCode();
        $command = $event->getCommand();

        if ($statusCode === 0) {
            return;
        }

        if ($statusCode > 255) {
            $statusCode = 255;
            $event->setExitCode($statusCode);
        }

        $this->logger->warning(sprintf(
            'Command `%s` exited with status code %d',
            $command->getName(),
            $statusCode
        ));
    }
}