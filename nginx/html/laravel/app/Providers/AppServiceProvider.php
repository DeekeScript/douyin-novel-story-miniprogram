<?php

namespace App\Providers;

use App\Lib\Pagination;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // 分页服务注册
        app()->bind('Illuminate\Pagination\LengthAwarePaginator', function ($app, $options) {
            return (new Pagination($options['items'], $options['total'], $options['perPage'], $options['currentPage'], $options['options']));
        });
    }
}
