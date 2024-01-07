<?php

namespace App\Http\Middleware;

use App\Repository\AdminRepository;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{

    protected function authenticate($request, array $guards)
    {
        if (empty($guards)) {
            $guards = [null];
        }

        foreach ($guards as $guard) {
            if ($this->auth->guard($guard)->check()) {
                if (!AdminRepository::check($request)) {
                    exit(json_encode(['code' => 1, 'msg' => '无权限']));
                }
                return $this->auth->shouldUse($guard);
            }
        }

        $this->unauthenticated($request, $guards);
    }

    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param \Illuminate\Http\Request $request
     * @return string|null
     */
    protected function redirectTo(Request $request)
    {
        if (!$request->expectsJson()) {
            return route('login');
        }
    }

    /**
     * @throws \Exception
     */
    protected function unauthenticated($request, array $guards)
    {
        exit(json_encode(['code' => 3, 'msg' => '登录失效']));
    }
}
