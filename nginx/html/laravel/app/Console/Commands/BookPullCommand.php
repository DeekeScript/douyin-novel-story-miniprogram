<?php

namespace App\Console\Commands;

use App\Extension\AliOss;
use App\Models\Books;
use App\Models\BooksChapters;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Throwable;

class BookPullCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'my:book:pull';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '书籍数据获取';
    protected string $domain = '需要采集小说，或者正版小说，请联系作者本人';
    protected string $appId = '需要采集小说，或者正版小说，请联系作者本人';
    protected string $appSecret = '需要采集小说，或者正版小说，请联系作者本人';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    public function getBooks(int $page, int $pageSize = 50)
    {
        $response = Http::get($this->domain . '/api/novel', [
            'appId' => $this->appId,
            'appSecret' => $this->appSecret,
            'pageNum' => $page,
            'pageSize' => $pageSize,
        ]);

        if (!$response->ok()) {
            Log::error($response->body());
            return false;
        }

        $res = $response->json();
        if ($res['status'] !== "200") {
            return false;
        }
        return $res['page'];
    }

    public function getBooksDetail(string $id, int $page, int $pageSize = 20)
    {
        $response = Http::get($this->domain . '/api/chapter', [
            'appId' => $this->appId,
            'appSecret' => $this->appSecret,
            'pageNum' => $page,
            'pageSize' => $pageSize,
            'id' => $id,
        ]);

        if (!$response->ok()) {
            Log::error($response->body());
            return false;
        }

        $res = $response->json();
        if ($res['status'] !== "200") {
            return false;
        }
        return $res['page'];
    }

    /**
     * Execute the console command.
     *
     * @throws Throwable
     */
    public function handle()
    {
        $page = 1;
        $aliOss = new AliOss();
        while (true) {
            $books = $this->getBooks($page);
            $this->info('当前页码：' . $page . '  ' . '总页码：' . $books['totalPage']);
            if (!$books) {
                echo "没有书籍了";
                break;//没有书籍
            }

            //图书入库
            foreach ($books['list'] as $book) {
                if (Books::where('novel_id', '=', $book['id'])
                    ->where('update_time', '=', strtotime($book['updateTime']))->count()) {
                    $this->info('重复：' . $book['id']);
                    continue;
                }

                $pic = $aliOss->uploadFile(file_get_contents($book['novelPic']), $book['id'] . '.' . pathinfo($book['novelPic'], PATHINFO_EXTENSION), env("BOOK_IMAGE_DIR"));
                if (!$pic) {
                    $this->info('图片上传失败：' . $book['id']);
                    continue;
                }
                try {
                    $bookModel = Books::where('novel_id', '=', $book['id'])->where('deleted', '=', 0)->first();
                    if (!$bookModel) {
                        $bookId = Books::create([
                            'novel_id' => $book['id'],
                            'author' => $book['author'],
                            'book_num' => $book['bookNum'],
                            'novel_pic' => $pic,
                            'number_of_words' => $book['numberOfWords'],
                            'is_end' => $book['isEnd'] ? 1 : 0,
                            'free_num' => $book['freeNum'],
                            'update_time' => strtotime($book['updateTime']),
                            'novel_name' => $book['novelName'],
                            'total_chapter_num' => $book['totalChapterNum'],
                            'classify_name' => $book['classifyName'],
                            'desc' => $book['desc'],
                            'created_at' => time(),
                        ])->id;
                    } else {
                        $bookModel->novel_name = $book['novelName'];
                        $bookModel->book_num = $book['bookNum'];
                        $bookModel->total_chapter_num = $book['totalChapterNum'];
                        $bookModel->novel_pic = $pic;
                        $bookModel->number_of_words = $book['numberOfWords'];
                        $bookModel->is_end = $book['isEnd'] ? 1 : 0;
                        $bookModel->free_num = $book['freeNum'];
                        $bookModel->update_time = strtotime($book['updateTime']);
                        $bookModel->desc = $book['desc'];
                        $bookModel->save();
                        $bookId = $bookModel->id;
                    }

                    $detailPage = 1;
                    while (true) {
                        $details = $this->getBooksDetail($book['id'], $detailPage);
                        foreach ($details['list'] as $detail) {
                            if (!$url = $aliOss->uploadFile($detail['content'], $detail['novelId'] . '_' . $detail['chapterNum'], env('BOOK_DIR'))) {
                                $this->info('文件上传失败');
                                continue;
                            }

                            BooksChapters::updateOrCreate(['index' => $detail['chapterNum'], 'novel_id' => $book['id']], [
                                'time' => strtotime($detail['time']),
                                'title' => $detail['title'],
                                'price' => $detail['price'],
                                'novel_id' => $book['id'],
                                'index' => $detail['chapterNum'],
                                'created_at' => time(),
                                'src' => $url,
                                'book_id' => $bookId,
                                'number_of_words' => $detail['numberOfWords'],
                            ]);
                        }
                        $this->info('当前执行详情：' . $detailPage . '   总页码：' . $details['totalPage']);
                        $detailPage++;
                        if ($detailPage > $details['totalPage']) {
                            break;
                        }
                    }
                } catch (\Exception $e) {
                    $this->info($e->getMessage());
                    Log::error($e->getMessage());
                }
            }

            $page++;
            if ($page > $books['totalPage']) {
                echo "执行完所有记录";
                break;
            }
        }
    }
}
