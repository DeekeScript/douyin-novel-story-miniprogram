<?php

namespace App\Broadcasting;

use App\Models\Admin;

class myChannel
{
    /**
     * Create a new channel instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Authenticate the user's access to the channel.
     *
     * @param  \App\Models\Admin  $user
     * @return array|bool
     */
    public function join(Admin $user)
    {
        //
    }
}
