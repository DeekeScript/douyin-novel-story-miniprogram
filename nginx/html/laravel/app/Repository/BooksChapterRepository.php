<?php
/*   __________________________________________________
    |  Obfuscated by YAK Pro - Php Obfuscator  2.0.14  |
    |              on 2024-01-07 11:08:56              |
    |    GitHub: https://github.com/pk-fr/yakpro-po    |
    |__________________________________________________|
*/
 namespace App\Repository; use App\Models\BooksChapters; use Illuminate\Http\Request; class BooksChapterRepository extends Repository { public function getList(Request $QiZOc) : array { return BooksChapters::where("\144\145\154\x65\x74\145\144", "\x3d", 0)->when($QiZOc->get("\x62\x6f\157\153\137\151\x64") !== '', function ($SkUGn) use($QiZOc) { return $SkUGn->where("\x62\157\157\153\137\151\x64", "\x3d", $QiZOc->get("\x62\x6f\x6f\153\x5f\x69\x64")); })->paginate($this->FfaKn, ["\x2a"])->toArray(); } public function setShare(array $Z_HfV) : bool { BooksChapters::updateOrCreate(["\x62\x6f\157\153\x5f\151\144" => $Z_HfV["\x62\x6f\x6f\153\137\x69\144"], "\151\156\144\x65\x78" => $Z_HfV["\151\x6e\x64\x65\x78"]], ["\x69\163\x5f\163\150\x61\x72\145" => 1]); return true; } }
