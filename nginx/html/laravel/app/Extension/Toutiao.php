<?php

namespace App\Extension;

use App\Models\Ad;
use Illuminate\Support\Facades\Http;

class Toutiao
{
    protected function upload(string $clickId, string $updatedAt, string $eventType)
    {
        $response = Http::get("https://ad.toutiao.com/track/activate/?callback=" . $clickId . "&conv_time=" . $updatedAt . "&event_type=" . $eventType);
        return $response->json();
    }

    public function uploadAd(Ad $ad)
    {
        $res = $this->upload($ad->clickid, $ad->updated_at, $ad->event_type);
        if ($res['code'] === 0) {
            $ad->status = 1;
        } else {
            $ad->status = 2;
        }
        $ad->save();
        return $res;
    }
}
