<?php
/*   __________________________________________________
    |  Obfuscated by YAK Pro - Php Obfuscator  2.0.14  |
    |              on 2024-01-07 11:08:56              |
    |    GitHub: https://github.com/pk-fr/yakpro-po    |
    |__________________________________________________|
*/
 namespace App\Repository; use App\Models\Cate; use App\Models\UsersBooksComment; use Illuminate\Contracts\Pagination\LengthAwarePaginator; use Illuminate\Http\Request; use Illuminate\Support\Facades\Validator; class CommentRepository extends Repository { public function getList(Request $QiZOc) : LengthAwarePaginator { return UsersBooksComment::where("\144\145\154\x65\164\145\144", "\x3d", 0)->when($QiZOc->get("\142\x6f\x6f\x6b\137\x69\x64"), function ($SkUGn) use($QiZOc) { return $SkUGn->where("\x62\x6f\157\153\x5f\151\x64", "\75", $QiZOc->get("\142\157\157\153\x5f\x69\x64")); })->when($QiZOc->get("\165\163\145\162\x5f\151\144"), function ($SkUGn) use($QiZOc) { return $SkUGn->where("\165\x73\145\162\x5f\151\x64", "\75", $QiZOc->get("\x75\x73\145\x72\137\x69\x64")); })->when($QiZOc->get("\163\x74\141\164\x75\163"), function ($SkUGn) use($QiZOc) { return $SkUGn->where("\x73\164\x61\x74\x75\x73", "\x3d", $QiZOc->get("\163\x74\141\x74\x75\163")); })->with("\x75\163\x65\162")->with("\142\157\157\153")->paginate($this->FfaKn, ["\x2a"]); } public function examineComment(Request $QiZOc) : array { goto i4H9u; ZDCew: Zzr2J: goto ReSdx; cls1K: return ["\x63\x6f\x64\145" => 1, "\x6d\163\147" => $UGmxt->errors()->first()]; goto ZDCew; ReSdx: try { UsersBooksComment::updateOrCreate(["\x69\x64" => $QiZOc->post("\151\144")], ["\163\x74\x61\x74\x75\163" => $QiZOc->post("\x73\x74\x61\164\165\163")]); return ["\143\157\144\x65" => 0, "\x64\141\164\141" => [], "\x6d\163\x67" => "\xe6\x88\x90\xe5\x8a\237"]; } catch (\Exception $FBi7X) { return ["\x63\157\x64\x65" => 1, "\155\x73\x67" => $FBi7X->getMessage()]; } goto k5gMJ; i4H9u: $UGmxt = Validator::make($QiZOc->all(), ["\x69\x64" => "\162\x65\161\165\151\x72\145\144", "\163\164\141\164\x75\x73" => "\162\x65\161\165\151\162\x65\144\174\x69\156\72\61\x2c\62"], ["\151\144\56\162\x65\x71\x75\x69\162\x65\x64" => "\x49\x44\345\xbf\205\351\xa1\273", "\163\x74\141\164\x75\x73\x2e\x72\x65\161\x75\151\162\x65\x64" => "\347\212\266\346\x80\201\xe5\xbf\x85\xe9\xa1\xbb"]); goto GJxcQ; GJxcQ: if (!$UGmxt->fails()) { goto Zzr2J; } goto cls1K; k5gMJ: } public function removeComment(Request $QiZOc) : array { goto H9Cuy; mBgcq: return ["\x63\x6f\144\145" => 1, "\155\163\x67" => $UGmxt->errors()->first()]; goto PUnb3; T8Q4P: try { UsersBooksComment::updateOrCreate(["\151\x64" => $QiZOc->post("\x69\144")], ["\x64\145\154\145\164\145\144" => 1]); return ["\x63\x6f\x64\x65" => 0, "\x64\x61\x74\x61" => [], "\x6d\163\x67" => "\346\210\x90\345\212\237"]; } catch (\Exception $FBi7X) { return ["\143\x6f\x64\145" => 1, "\155\x73\x67" => $FBi7X->getMessage()]; } goto hA5Uu; gdQMN: if (!$UGmxt->fails()) { goto T_qz3; } goto mBgcq; H9Cuy: $UGmxt = Validator::make($QiZOc->all(), ["\x69\144" => "\x72\145\161\x75\151\162\x65\144"], ["\x69\x64\56\162\145\161\x75\x69\x72\x65\144" => "\x49\x44\345\xbf\x85\xe9\241\273"]); goto gdQMN; PUnb3: T_qz3: goto T8Q4P; hA5Uu: } }