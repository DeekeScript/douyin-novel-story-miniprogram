<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function success(array $data = [], string $msg = '成功', array $ext = []): string
    {
        $data = ['code' => 0, 'data' => $data, 'msg' => $msg, 'status' => 'ok'];
        if ($ext) {
            $data = array_merge($data, $ext);
        }
        return json_encode($data);
    }

    public function fail(string $msg = '失败'): string
    {
        return json_encode(['code' => 1, 'data' => [], 'msg' => $msg, 'status' => 'fail']);
    }

    public function api(array $res): string
    {
        if ($res['code'] === 0) {
            return $this->success($res['data'] ?? [], $res['msg'] ?? null);
        }
        return $this->fail($res['msg'] ?? null);
    }

    public function successList(array $data)
    {
        return json_encode($data);
    }
}
