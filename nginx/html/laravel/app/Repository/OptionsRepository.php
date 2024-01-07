<?php
/*   __________________________________________________
    |  Obfuscated by YAK Pro - Php Obfuscator  2.0.14  |
    |              on 2024-01-07 11:08:56              |
    |    GitHub: https://github.com/pk-fr/yakpro-po    |
    |__________________________________________________|
*/
 namespace App\Repository; use App\Models\Options; class OptionsRepository extends Repository { public const mn4kN = "\x6d\151\156\x69\137\160\x72\x6f\147\162\x61\x6d\x5f\163\145\x74\164\151\x6e\x67"; public function get(string $Z7r23) { goto SvGr8; S30no: return json_decode($C78ax, true); goto asxI5; E26nw: $C78ax = $IQwTv ? $IQwTv->VvV3u : "\173\175"; goto S30no; SvGr8: $IQwTv = Options::where("\x64\x65\x6c\145\x74\x65\144", 0)->where("\x6b\x65\x79", $Z7r23)->first(); goto E26nw; asxI5: } public function set(string $Z7r23, array $yO1Bb) { return Options::updateOrCreate(["\x6b\x65\171" => $Z7r23, "\x64\145\154\145\x74\x65\x64" => 0], ["\153\x65\x79" => $Z7r23, "\166\x61\154\x75\145\x73" => json_encode($yO1Bb)]); } }
