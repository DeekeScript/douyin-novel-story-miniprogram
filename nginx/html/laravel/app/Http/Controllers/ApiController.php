<?php

namespace App\Http\Controllers;

use App\Extension\AliOss;
use App\Extension\Douyin;
use App\Models\UsersBooksComment;
use App\Repository\ActionRepository;
use App\Repository\AdminRepository;
use App\Repository\AdRepository;
use App\Repository\BookRepository;
use App\Repository\BooksChapterRepository;
use App\Repository\CateRepository;
use App\Repository\CommentRepository;
use App\Repository\IndexBannerRepository;
use App\Repository\IndexPageRepository;
use App\Repository\NoticeRepository;
use App\Repository\OptionsRepository;
use App\Repository\PayRepository;
use App\Repository\RechargeRepository;
use App\Repository\RechargeTypeRepository;
use App\Repository\RoleActionRepository;
use App\Repository\RoleRepository;
use App\Repository\TagRepository;
use App\Repository\UsersBooksChapterRepository;
use App\Repository\UsersRepository;
use App\Repository\UsersStatisticsRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ApiController extends Controller
{
    public function verifyCode(): string
    {
        $image = app('captcha')->create('flat', true);
        return $this->success(['captcha' => $image['img'], 'key' => $image['key']]);
    }

    public function login(Request $request): string
    {
        if (!captcha_api_check($request->post('captcha'), $request->post('key'), 'flat')) {
            return $this->fail('验证码不正确');
        }

        $credentials = $request->only('username', 'password');
        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            return $this->success();
        }
        return $this->fail('账号或者密码错误');
    }

    public function currentUser(): string
    {
        $data = Auth::user()->toArray();
        $data['actions'] = RoleActionRepository::findByRoleId(Auth::user()->role_id);
        return $this->success($data, '成功');
    }

    public function outLogin(Request $request): string
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return $this->success();
    }

    public function resetPassword(Request $request): string
    {
        return $this->api((new UsersRepository())->resetPassword($request));
    }

    public function cateList(Request $request): string
    {
        return $this->successList((new CateRepository())->getList($request)->toArray());
    }

    public function addCate(Request $request): string
    {
        $res = (new CateRepository())->addCate($request);
        return $this->api($res);
    }

    public function updateCate(Request $request): string
    {
        $res = (new CateRepository())->updateCate($request);
        return $this->api($res);
    }

    public function removeCate(Request $request): string
    {
        $res = (new CateRepository())->removeCate($request);
        return $this->api($res);
    }

    public function tagList(Request $request): string
    {
        return $this->successList((new TagRepository())->getList($request)->toArray());
    }

    public function addTag(Request $request): string
    {
        $res = (new TagRepository())->addTag($request);
        return $this->api($res);
    }

    public function updateTag(Request $request): string
    {
        $res = (new TagRepository())->updateTag($request);
        return $this->api($res);
    }

    public function removeTag(Request $request): string
    {
        $res = (new TagRepository())->removeTag($request);
        return $this->api($res);
    }

    public function bookList(Request $request): string
    {
        return $this->successList((new BookRepository())->getList($request));
    }

//    public function addBook(Request $request): string
//    {
//        $res = (new BookRepository())->addBook($request);
//        return $this->api($res);
//    }
//
//    public function updateBook(Request $request): string
//    {
//        $res = (new BookRepository())->updateBook($request);
//        return $this->api($res);
//    }

    public function onlineBook(Request $request): string
    {
        $res = (new BookRepository())->onlineBook($request);
        return $this->api($res);
    }

    public function removeBook(Request $request): string
    {
        $res = (new BookRepository())->removeBook($request);
        return $this->api($res);
    }

    public function updateBookCate(Request $request): string
    {
        $res = (new BookRepository())->updateBookCate($request);
        return $this->api($res);
    }

    public function booksChapter(Request $request): string
    {
        $res = (new BooksChapterRepository())->getList($request);
        return $this->successList($res);
    }

    public function generateLink(Request $request): string
    {
        //带is_share，并且章节的is_share参数为True的，则本章节不收费
        $res = Douyin::urlLink("/pages/bookDetail/bookDetail", ['id' => $request->get('book_id'), 'index' => $request->get('index'), 'is_share' => 1]);
        if ($res['code'] === 0) {
            (new BooksChapterRepository())->setShare(['book_id' => $request->get('book_id'), 'index' => $request->get('index')]);
        }
        return $this->successList($res);
    }

    public function generatePaperWork(Request $request): string
    {
        //带is_share，并且章节的is_share参数为True的，则本章节不收费
        $res = Douyin::qrcode("/pages/bookDetail/bookDetail?id=" . $request->get('book_id') . '&index=' . $request->get('index') . '&is_share=1');
        (new BooksChapterRepository())->setShare(['book_id' => $request->get('book_id'), 'index' => $request->get('index')]);
        return $this->successList($res);
    }

    public function examineComment(Request $request): string
    {
        $res = (new CommentRepository())->examineComment($request);
        return $this->api($res);
    }

    public function removeComment(Request $request): string
    {
        $res = (new CommentRepository())->removeComment($request);
        return $this->api($res);
    }

    public function commentList(Request $request): string
    {
        return $this->successList((new CommentRepository())->getList($request)->toArray());
    }

    public function roleList(Request $request): string
    {
        return $this->successList((new RoleRepository())->getList($request)->toArray());
    }

    public function addRole(Request $request): string
    {
        $res = (new RoleRepository())->add($request);
        return $this->api($res);
    }

    public function updateRole(Request $request): string
    {
        $res = (new RoleRepository())->update($request);
        return $this->api($res);
    }

    public function removeRole(Request $request): string
    {
        $res = (new RoleRepository())->remove($request);
        return $this->api($res);
    }

    public function idName(Request $request): string
    {
        $res = (new RoleRepository())->idName();
        return $this->success($res);
    }

    public function adminList(Request $request): string
    {
        $data = (new AdminRepository())->getList($request)->toArray();
        return $this->successList($data);
    }

    public function addAdmin(Request $request): string
    {
        $res = (new AdminRepository())->add($request);
        return $this->api($res);
    }

    public function updateAdmin(Request $request): string
    {
        $res = (new AdminRepository())->update($request);
        return $this->api($res);
    }

    public function removeAdmin(Request $request): string
    {
        $res = (new AdminRepository())->remove($request);
        return $this->api($res);
    }

    public function actionList(Request $request): string
    {
        return $this->success((new ActionRepository())->getList($request));
    }

    public function addAction(Request $request): string
    {
        $res = (new ActionRepository())->add($request);
        return $this->api($res);
    }

    public function updateAction(Request $request): string
    {
        $res = (new ActionRepository())->update($request);
        return $this->api($res);
    }

    public function removeAction(Request $request): string
    {
        $res = (new ActionRepository())->remove($request);
        return $this->api($res);
    }

    public function memberList(Request $request): string
    {
        return $this->successList((new UsersRepository())->getList($request)->toArray());
    }

//    public function addMember(Request $request): string
//    {
//        $res = (new UsersRepository())->add($request);
//        return $this->api($res);
//    }
//
//    public function updateMember(Request $request): string
//    {
//        $res = (new UsersRepository())->update($request);
//        return $this->api($res);
//    }

    public function removeMember(Request $request): string
    {
        $res = (new UsersRepository())->remove($request);
        return $this->api($res);
    }

    public function payList(Request $request): string
    {
        return $this->successList((new PayRepository())->getList($request)->toArray());
    }

    public function removePay(Request $request): string
    {
        $res = (new PayRepository())->remove($request);
        return $this->api($res);
    }

    public function consumeList(Request $request): string
    {
        return $this->successList((new UsersBooksChapterRepository())->getList($request)->toArray());
    }

    public function removeConsume(Request $request): string
    {
        $res = (new UsersBooksChapterRepository())->remove($request);
        return $this->api($res);
    }

    public function rechargeList(Request $request): string
    {
        return $this->successList((new RechargeRepository())->getList($request)->toArray());
    }

//    public function addRecharge(Request $request): string
//    {
//        $res = (new RechargeRepository())->add($request);
//        return $this->api($res);
//    }
//
    public function updateRecharge(Request $request): string
    {
        $res = (new RechargeRepository())->update($request);
        return $this->api($res);
    }

    public function removeRecharge(Request $request): string
    {
        $res = (new RechargeRepository())->remove($request);
        return $this->api($res);
    }

    public function rechargeType(Request $request): string
    {
        return $this->successList((new RechargeTypeRepository())->getList($request)->toArray());
    }

    public function addRechargeType(Request $request): string
    {
        $res = (new RechargeTypeRepository())->add($request);
        return $this->api($res);
    }

    public function updateRechargeType(Request $request): string
    {
        $res = (new RechargeTypeRepository())->update($request);
        return $this->api($res);
    }

    public function removeRechargeType(Request $request): string
    {
        $res = (new RechargeTypeRepository())->remove($request);
        return $this->api($res);
    }

    public function noticeList(Request $request): string
    {
        return $this->successList((new NoticeRepository())->getList($request)->toArray());
    }

    public function addNotice(Request $request): string
    {
        $res = (new NoticeRepository())->add($request);
        return $this->api($res);
    }

    public function updateNotice(Request $request): string
    {
        $res = (new NoticeRepository())->update($request);
        return $this->api($res);
    }

    public function removeNotice(Request $request): string
    {
        $res = (new NoticeRepository())->remove($request);
        return $this->api($res);
    }

    public function updateSetting(Request $request): string
    {
        $res = (new OptionsRepository())->set('setting', [
            'type' => $request->post('type'),
            'value' => $request->post('value'),
        ]);
        if ($res) {
            return $this->success();
        }
        return $this->fail();
    }

    public function settingDetail(): string
    {
        $res = (new OptionsRepository())->get('setting');
        return $this->success($res);
    }

    public function miniProgramList(Request $request): string
    {
        return $this->success((new IndexBannerRepository())->getList($request));
    }

    public function addMiniProgram(Request $request): string
    {
        $res = (new IndexBannerRepository())->add($request);
        return $this->api($res);
    }

    public function updateMiniProgram(Request $request): string
    {
        $res = (new IndexBannerRepository())->update($request);
        return $this->api($res);
    }

    public function removeMiniProgram(Request $request): string
    {
        $res = (new IndexBannerRepository())->remove($request);
        return $this->api($res);
    }

    /**
     * @throws \Exception
     */
    public function aliOssConfig(): string
    {
        $signData = (new AliOss())->config();
        $signData['url'] = 'https://' . env('BUCKET') . '.cos.' . env('REGION') . '.myqcloud.com';
        $signData['bucket'] = env('BUCKET');
        $signData['region'] = env('REGION');
        $signData['path'] = env('ALI_IMAGES');
        return $this->success($signData);
    }

    public function aliOssCallback()
    {
        return (new AliOss())->check();
    }

    public function IndexPageList(Request $request): string
    {
        return $this->success((new IndexPageRepository())->getList($request));
    }

    public function addIndexPage(Request $request): string
    {
        $res = (new IndexPageRepository())->add($request);
        return $this->api($res);
    }

    public function updateIndexPage(Request $request): string
    {
        $res = (new IndexPageRepository())->update($request);
        return $this->api($res);
    }

    public function removeIndexPage(Request $request): string
    {
        $res = (new IndexPageRepository())->remove($request);
        return $this->api($res);
    }

    public function cateIdName(): string
    {
        $res = (new CateRepository())->idName();
        return $this->success($res);
    }

    public function tagIdName(): string
    {
        $res = (new TagRepository())->idName();
        return $this->success($res);
    }

    public function miniProgramSetting(): string
    {
        $res = (new OptionsRepository())->get(OptionsRepository::MINI_PROGRAM_SETTING);
        if ($res && isset($res['url'])) {
            $res['remote_url'] = isset($res['open_member_url']) ? (new AliOss())->getAbsoluteUrl($res['url']) : '';
            $res['remote_avatar'] = isset($res['open_member_url']) ? (new AliOss())->getAbsoluteUrl($res['avatar']) : '';
            $res['remote_kouling_url'] = isset($res['open_member_url']) ? (new AliOss())->getAbsoluteUrl($res['kouling_url']) : '';
            $res['remote_open_member_url'] = isset($res['open_member_url']) ? (new AliOss())->getAbsoluteUrl($res['open_member_url']) : '';
            $res['remote_shuku_background_url'] = isset($res['shuku_background_url']) ? (new AliOss())->getAbsoluteUrl($res['shuku_background_url']) : '';
        }
        return $this->success($res);
    }

    public function miniProgramUpdateSetting(Request $request): string
    {
        $res = (new OptionsRepository())->set(OptionsRepository::MINI_PROGRAM_SETTING, [
            'mobile' => $request->post('mobile'),
            'url' => (new AliOss())->decBaseUrl($request->post('url')),
            'weixin' => $request->post('weixin'),
            'avatar' => $request->post('avatar'),
            'kouling_url' => $request->post('kouling_url'),
            'open_member_url' => $request->post('open_member_url'),
            'shuku_background_url' => $request->post('shuku_background_url'),
        ]);
        if ($res) {
            return $this->success();
        }
        return $this->fail();
    }

    public function statisticUserList(Request $request): string
    {
        return $this->success((new UsersStatisticsRepository())->statisticUserList($request));
    }

    public function statisticPayList(Request $request): string
    {
        return $this->success((new UsersStatisticsRepository())->statisticPayList($request));
    }

    public function statisticReadBookList(Request $request): string
    {
        return $this->success((new UsersStatisticsRepository())->statisticBookList($request));
    }

    public function adList(Request $request): string
    {
        return $this->successList((new AdRepository())->getList($request)->toArray());
    }

    public function removeAd(Request $request): string
    {
        $res = (new AdRepository())->remove($request);
        return $this->api($res);
    }

    public function uploadAd(Request $request): string
    {
        $res = (new AdRepository())->upload($request);
        return $this->api($res);
    }
}
