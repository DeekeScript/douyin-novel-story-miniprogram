<?php

namespace App\Listeners;

use App\Events\myEvent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class myListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param \App\Events\myEvent $event
     * @return void
     */
    public function handle(myEvent $event)
    {
        echo 'myListener' . "\n";
        exit;
    }
}
