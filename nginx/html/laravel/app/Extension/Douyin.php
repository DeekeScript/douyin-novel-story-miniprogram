<?php

namespace App\Extension;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Psr\SimpleCache\InvalidArgumentException;

class Douyin
{
    /**
     * @throws InvalidArgumentException
     */
    public static function accessToken(): string
    {
        if ($cache = Cache::get('douyin_access_token')) {
            return $cache;
        }

        $url = 'https://open.douyin.com/oauth/client_token/';
        $response = Http::contentType('application/json')->post($url, [
            'appid' => env('MINI_PROGRAM_APP_ID'),
            'secret' => env('MINI_PROGRAM_APP_SECRET'),
            'grant_type' => 'client_credential',
        ])->json();

        if (isset($response['message']) && $response['message'] === 'success') {
            Cache::set('douyin_access_token', $response['data']['access_token'], 7200);
            return $response['data']['access_token'];
        }
        return '';
    }

    /**
     * @throws InvalidArgumentException
     */
    public static function qrcode(string $path): array
    {
        $token = self::accessToken();
        if (!$token) {
            return ['code' => 1, 'msg' => 'accessToken获取失败'];
        }

        $url = 'https://open.douyin.com/api/apps/v1/qrcode/create/';
        $response = Http::contentType('application/json')->withHeaders([
            'access-token' => $token,
        ])->post($url, [
            'app_name' => 'douyin',
            'appid' => env('MINI_PROGRAM_APP_ID'),
            'background' => ['b' => 255, 'g' => 255, 'r' => 255],
            'line_color' => ['b' => 0, 'g' => 0, 'r' => 0],
            'path' => $path,
            'set_icon' => false,
            'width' => 430,
            'is_circle_code' => false,
        ])->json();

        if (env('APP_ENV') === 'local') {
            return ['code' => 0, 'data' => 'data:image/jpeg;base64,' . base64_encode(file_get_contents('https://milu-story.oss-cn-hangzhou.aliyuncs.com/images/1703678491622.jpg'))];
        }

        if (!isset($response['err_no']) || $response['err_no'] > 0) {
            return ['code' => 1, 'msg' => $response['err_msg'] ?? '二维码获取失败'];
        }
        return ['code' => 0, 'data' => 'data:image/jpeg;base64,' . $response['data']['img']];
    }

    /**
     * @throws InvalidArgumentException
     */
    public static function urlLink(string $path, array $query = []): array
    {
        $token = self::accessToken();
        if (!$token) {
            return ['code' => 1, 'msg' => 'accessToken获取失败'];
        }

        $url = 'https://open.douyin.com/api/apps/v1/url_link/generate/';
        if (env('APP_ENV') === 'local') {
            $url = 'https://open-sandbox.douyin.com/api/apps/v1/url_link/generate/';
        }
        $response = Http::contentType('application/json')->withHeaders([
            'access-token' => $token,
        ])->post($url, [
            'app_name' => 'douyin',
            'appid' => env('MINI_PROGRAM_APP_ID'),
            'path' => $path,
            'query' => json_encode($query),
        ])->json();

        if (env('APP_ENV') === 'local') {
            return ['code' => 0, 'data' => 'https://baidu.com'];
        }

        if (!isset($response['err_no']) || $response['err_no'] > 0) {
            return ['code' => 1, 'msg' => $response['err_msg'] ?? '二维码获取失败'];
        }
        return ['code' => 0, 'data' => $response['data']['url_link']];
    }
}
