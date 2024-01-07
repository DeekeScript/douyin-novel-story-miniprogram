<?php

namespace App\Console\Commands;

use App\Models\Ad;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;

class AdUpload extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'my:ad-upload';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '上报广告';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    protected function upload(string $clickId, string $updatedAt, string $eventType)
    {
        $response = Http::get("https://ad.toutiao.com/track/activate/?callback=" . $clickId . "&conv_time=" . $updatedAt . "&event_type=" . $eventType);
        return $response->json();
    }

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle()
    {
        Ad::where('deleted', '=', 0)->each(function ($item) {
            if ($item->status === 0) {
                $res = $this->upload($item->clickid, time(), $item->event_type);
                if ($res['code'] === 0) {
                    $item->status = 1;
                } else {
                    $item->status = 2;
                }
                $item->save();
            }
        });
    }
}
