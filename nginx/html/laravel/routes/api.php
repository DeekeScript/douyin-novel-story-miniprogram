<?php

use App\Http\Controllers\ApiController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::namespace('api')->group(function () {
    Route::get('/login/verifyCode', [ApiController::class, 'verifyCode']);
    Route::post('/login/account', [ApiController::class, 'login']);

    Route::get('/role/idName', [ApiController::class, 'idName']);
    Route::get('/book/cateIdName', [ApiController::class, 'cateIdName']);
    Route::get('/book/tagIdName', [ApiController::class, 'tagIdName']);
    Route::get('/aliyun-oss-appserver-php/callback', [ApiController::class, 'aliOssCallback']);

    Route::middleware('auth')->group(function () {
        Route::get('/ali/ossConfig', [ApiController::class, 'aliOssConfig']);
    });

    //需要检测登录状态的
    Route::middleware('auth')->group(function () {
        Route::get('/currentUser', [ApiController::class, 'currentUser']);
        Route::post('/login/outLogin', [ApiController::class, 'outLogin']);
        Route::post('/user/resetPassword', [ApiController::class, 'resetPassword']);
    });

    Route::prefix('book')->middleware('auth')->group(function () {
        Route::get('/bookList', [ApiController::class, 'bookList']);
//        Route::post('/addBook', [ApiController::class, 'addBook']);
//        Route::post('/updateBook', [ApiController::class, 'updateBook']);
        Route::post('/onlineBook', [ApiController::class, 'onlineBook']);
        Route::get('/removeBook', [ApiController::class, 'removeBook']);
        Route::post('/updateBookCate', [ApiController::class, 'updateBookCate']);

        Route::get('/chapter', [ApiController::class, 'booksChapter']);
        Route::get('/generateLink', [ApiController::class, 'generateLink']);
        Route::get('/generatePaperWork', [ApiController::class, 'generatePaperWork']);

        Route::get('/cateList', [ApiController::class, 'cateList']);
        Route::post('/addCate', [ApiController::class, 'addCate']);
        Route::post('/updateCate', [ApiController::class, 'updateCate']);
        Route::get('/removeCate', [ApiController::class, 'removeCate']);

        Route::get('/tagList', [ApiController::class, 'tagList']);
        Route::post('/addTag', [ApiController::class, 'addTag']);
        Route::post('/updateTag', [ApiController::class, 'updateTag']);
        Route::get('/removeTag', [ApiController::class, 'removeTag']);

        Route::get('/commentList', [ApiController::class, 'commentList']);
        Route::post('/examineComment', [ApiController::class, 'examineComment']);
        Route::get('/removeComment', [ApiController::class, 'removeComment']);
    });

    Route::prefix('member')->middleware('auth')->group(function () {
        Route::get('/list', [ApiController::class, 'memberList']);
        //Route::post('/add', [ApiController::class, 'addMember']);
        //Route::post('/update', [ApiController::class, 'updateMember']);
        Route::get('/remove', [ApiController::class, 'removeMember']);
    });

    Route::prefix('pay')->middleware('auth')->group(function () {
        Route::get('/list', [ApiController::class, 'payList']);
        Route::get('/remove', [ApiController::class, 'removePay']);

        Route::get('/consumeList', [ApiController::class, 'consumeList']);
        Route::get('/removeConsume', [ApiController::class, 'removeConsume']);
    });

    Route::prefix('recharge')->middleware('auth')->group(function () {
        Route::get('/list', [ApiController::class, 'rechargeList']);
//        Route::post('/add', [ApiController::class, 'addRecharge']);
        Route::post('/update', [ApiController::class, 'updateRecharge']);
        Route::get('/remove', [ApiController::class, 'removeRecharge']);
    });

    Route::prefix('setting')->middleware('auth')->group(function () {
        Route::get('/setting', [ApiController::class, 'settingDetail']);
        Route::post('/update', [ApiController::class, 'updateSetting']);

        Route::get('/rechargeType', [ApiController::class, 'rechargeType']);
        Route::post('/addRechargeType', [ApiController::class, 'addRechargeType']);
        Route::post('/updateRechargeType', [ApiController::class, 'updateRechargeType']);
        Route::get('/removeRechargeType', [ApiController::class, 'removeRechargeType']);
    });

    Route::prefix('miniProgram')->middleware('auth')->group(function () {
        Route::get('/list', [ApiController::class, 'miniProgramList']);
        Route::post('/add', [ApiController::class, 'addMiniProgram']);
        Route::post('/update', [ApiController::class, 'updateMiniProgram']);
        Route::get('/remove', [ApiController::class, 'removeMiniProgram']);

        Route::get('/indexPageList', [ApiController::class, 'indexPageList']);
        Route::post('/addIndexPage', [ApiController::class, 'addIndexPage']);
        Route::post('/updateIndexPage', [ApiController::class, 'updateIndexPage']);
        Route::get('/removeIndexPage', [ApiController::class, 'removeIndexPage']);

        Route::get('/setting', [ApiController::class, 'miniProgramSetting']);
        Route::post('/updateSetting', [ApiController::class, 'miniProgramUpdateSetting']);
    });

    Route::prefix('ad')->group(function () {
        Route::get('/list', [ApiController::class, 'adList']);
        Route::post('/remove', [ApiController::class, 'removeAd']);
        Route::post('/upload', [ApiController::class, 'uploadAd']);
    });

    Route::prefix('statistic')->middleware('auth')->group(function () {
        Route::get('/userList', [ApiController::class, 'statisticUserList']);
        Route::get('/payList', [ApiController::class, 'statisticPayList']);
        Route::get('/readBookList', [ApiController::class, 'statisticReadBookList']);
    });

    Route::prefix('notice')->middleware('auth')->group(function () {
        Route::get('/list', [ApiController::class, 'noticeList']);
        Route::post('/add', [ApiController::class, 'addNotice']);
        Route::post('/update', [ApiController::class, 'updateNotice']);
        Route::get('/remove', [ApiController::class, 'removeNotice']);
    });

    Route::prefix('role')->middleware('auth')->group(function () {
        Route::get('/roleList', [ApiController::class, 'roleList']);
        Route::post('/addRole', [ApiController::class, 'addRole']);
        Route::post('/updateRole', [ApiController::class, 'updateRole']);
        Route::get('/removeRole', [ApiController::class, 'removeRole']);

        Route::get('/adminList', [ApiController::class, 'adminList']);
        Route::post('/addAdmin', [ApiController::class, 'addAdmin']);
        Route::post('/updateAdmin', [ApiController::class, 'updateAdmin']);
        Route::get('/removeAdmin', [ApiController::class, 'removeAdmin']);

        Route::get('/actionList', [ApiController::class, 'actionList']);
        Route::post('/addAction', [ApiController::class, 'addAction']);
        Route::post('/updateAction', [ApiController::class, 'updateAction']);
        Route::get('/removeAction', [ApiController::class, 'removeAction']);
    });
});
