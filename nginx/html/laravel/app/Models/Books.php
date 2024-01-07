<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * App\Models\Admin
 *
 * @property int $id
 * @property string $username
 * @property string $password
 * @property string $remember_token
 * @property string $name
 * @property string $mobile
 * @property int $salt
 * @property int $role_id
 * @property int $deleted
 * @property \Illuminate\Support\Carbon $email_verified_at
 * @property \Illuminate\Support\Carbon $created_at
 * @property-read \Illuminate\Notifications\DatabaseNotificationCollection<int, \Illuminate\Notifications\DatabaseNotification> $notifications
 * @property-read int|null $notifications_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \Laravel\Sanctum\PersonalAccessToken> $tokens
 * @property-read int|null $tokens_count
 * @method static \Illuminate\Database\Eloquent\Builder|Admin newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Admin newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Admin query()
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereDeleted($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereEmailVerifiedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereMobile($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin wherePassword($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereRememberToken($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereRoleId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereSalt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereUsername($value)
 * @property string $token
 * @property int $token_expire_at
 * @property \Illuminate\Support\Carbon $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereToken($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereTokenExpireAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Admin whereUpdatedAt($value)
 * @property string $title 分类名称
 * @method static \Illuminate\Database\Eloquent\Builder|Cate whereTitle($value)
 * @mixin \Eloquent
 */
class Books extends Model
{
    protected $dateFormat = 'U';

    public static function getMiniProgramPage(int $page): string
    {
        return $page;
    }

    public function cate(): BelongsToMany
    {
        return $this->belongsToMany(Cate::class, 'books_cates', 'book_id', 'cate_id');
    }

    public function tag(): BelongsToMany
    {
        return $this->belongsToMany(Tag::class, 'books_tags', 'book_id', 'tag_id');
    }

    public function decPage(string $page): string
    {
        return $page;
    }

    protected $fillable = [
        'author',
        'book_num',
        'novel_pic',
        'is_end',
        'free_num',
        'update_time',
        'novel_name',
        'total_chapter_num',
        'thousand_words_price',
        'classify_name',
        'desc',
        'number_of_words',
        'novel_id',
        'sort',
        'good_detail',
        'deleted',
        'created_at',
        'updated_at',
        'online',
    ];
}
