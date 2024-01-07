<?php

namespace App\Console\Commands;

use App\Models\Pay;
use App\Models\Users;
use App\Models\UsersBook;
use App\Models\UsersStatistic;
use Illuminate\Console\Command;

class Statistics extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'my:statistics';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '统计用户和支付等数据 ';

    protected int $day;
    protected UsersStatistic $model;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    public function user(): self
    {
        $userCount = Users::where('deleted', '=', 0)->count();
        $incUserCount = Users::where('deleted', '=', 0)->where('created_at', '>=', $this->day - 86400)
            ->where('created_at', '<', $this->day)->count();
        $this->model->user_count = $userCount;
        $this->model->user_inc_count = $incUserCount;
        return $this;
    }

    public function pay(): self
    {
        $pay = Pay::where('status', '=', 1)->where('deleted', '=', 0)
            ->where('created_at', '>=', $this->day - 86400)
            ->where('created_at', '<', $this->day)->sum('pay');
        $this->model->pay = $pay;
        return $this;
    }

    public function book(): self
    {
        $readBookCount = UsersBook::where('deleted', '=', 0)->where('is_viewing', '=', 1)
            ->where('created_at', '>=', $this->day - 86400)
            ->where('created_at', '<', $this->day)->count();

        $readUserCount = UsersBook::where('deleted', '=', 0)->where('is_viewing', '=', 1)
            ->where('created_at', '>=', $this->day - 86400)
            ->where('created_at', '<', $this->day)->selectRaw('count(distinct(user_id)) as userCount')->first();

        $this->model->read_book_count = $readBookCount;
        $this->model->read_user_count = $readUserCount->userCount ?? 0;
        return $this;
    }

    public function save(): bool
    {
        return $this->model->save();
    }

    /**
     * Execute the console command.
     *
     * @return bool
     */
    public function handle(): bool
    {
        $this->day = strtotime(date('Y-m-d', time()));
        $count = UsersStatistic::where('day', '=', $this->day - 86400)->where('deleted', '=', 0)->count();
        if ($count) {
            $this->info('已经创建');
            return false;
        }

        $this->model = new UsersStatistic();
        $this->model->day = $this->day - 86400;
        try {
            $this->user()->pay()->book()->save();
        } catch (\Exception $e) {
            $this->info($e->getMessage());
        }
        return true;
    }
}
