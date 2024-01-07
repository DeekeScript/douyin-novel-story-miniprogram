<?php

namespace App\Console\Commands;

use App\Extension\Douyin;
use App\Models\Admin;
use Illuminate\Console\Command;

class TestCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:test';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '测试';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
//        Admin::insert([
//            'name' => '江桥',
//            'username' => 'jiangqiao',
//            'password' => bcrypt('jiangqiao'),
//        ]);

        var_dump(Douyin::accessToken());exit;
    }
}
