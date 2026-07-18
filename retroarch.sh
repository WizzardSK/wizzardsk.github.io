#!/bin/bash
arg="$1"
[[ "$arg" == play://* ]] && arg="${arg#play://}"
arg=$(printf '%b' "${arg//%/\\x}")
[[ -e "$arg" ]] || arg="$HOME/share/roms$arg"
set -- "$arg" "${@:2}"
head "$1"
adresar=$(dirname "$1")
adresar2="${adresar##*/}"
case "$adresar/" in
*"TIC-80/"*) core="tic80_libretro";;
*"LowresNX/"*) core="lowresnx_libretro";;
*"/wasm4/"*) core="wasm4_libretro";;
*"PICO-8/"*) core="pico8 -run";;
*"Voxatron/"*) core="vox";;
*"/arduboy/NoIntro/"*) core="arduous_libretro"; src="https://archive.org/download/ni-roms/roms/Arduboy%20Inc%20-%20Arduboy.zip/";;
*"/arduboy/TOSEC/"*) core="arduous_libretro"; src="https://archive.org/download/tosec-main/Arduboy/Arduboy/Games/%5BARDUBOY%5D/Arduboy%20Arduboy%20-%20Games%20-%20%5BARDUBOY%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/arduboy/Demo/"*) core="arduous_libretro"; src="https://archive.org/download/tosec-main/Arduboy/Arduboy/Demos/Arduboy%20Arduboy%20-%20Demos%20%28TOSEC-v2024-01-15%29.zip/";;
*"/uzebox/MAME/"*) core="mame_libretro uzebox -cart"; src="https://archive.org/download/mame-sl/mame-sl/uzebox.zip/uzebox/";;
*"/commanderx16/Games/"*) core="x16emu"; ext="img"; src="https://archive.org/download/tosec-main/8-Bit%20Productions/Commander%20X16/Games/%5BIMG%5D/8-Bit%20Productions%20Commander%20X16%20-%20Games%20-%20%5BIMG%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/commanderx16/Demo/"*) core="x16emu"; ext="img"; src="https://archive.org/download/tosec-main/8-Bit%20Productions/Commander%20X16/Demos/8-Bit%20Productions%20Commander%20X16%20-%20Demos%20%28TOSEC-v2023-08-29%29.zip/";;
*"/vircon32/Vircon32/"*) core="vircon32_libretro"; src="https://archive.org/download/all_vircon32_roms_and_media/all_vircon32_roms_and_media/";;
*"/chip8/MAME/"*) core="mame_libretro d6800 -quik"; src="https://archive.org/download/mame-sl/mame-sl/chip8_quik.zip/chip8_quik/";;
*"/atari2600/ROMS/"*) core="tia_libretro"; src="https://archive.org/download/atari-2600-vcs-roms/ROMS/";;
*"/atari2600/NoIntro/"*) core="tia_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%202600.zip/";;
*"/atari2600/TOSEC/"*) core="tia_libretro"; src="https://archive.org/download/tosec-main/Atari/2600%20%26%20VCS/Games/Atari%202600%20%26%20VCS%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari2600/Homebrew/"*) core="tia_libretro"; src="https://archive.org/download/tosec-main/Atari/2600%20%26%20VCS/Homebrew/Games/AtariAge%20Design%20Contest/Atari%202600%20%26%20VCS%20-%20Homebrew%20-%20Games%20-%20AtariAge%20Design%20Contest%20%28TOSEC-v2024-07-03%29.zip/";;
*"/atari2600/Applications/"*) core="tia_libretro"; src="https://archive.org/download/tosec-main/Atari/2600%20%26%20VCS/Applications/Atari%202600%20%26%20VCS%20-%20Applications%20%28TOSEC-v2024-07-03%29.zip/";;
*"/atari2600/Educational/"*) core="tia_libretro"; src="https://archive.org/download/tosec-main/Atari/2600%20%26%20VCS/Educational/Atari%202600%20%26%20VCS%20-%20Educational%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari2600/Demo [A26]/"*) core="tia_libretro"; src="https://archive.org/download/tosec-main/Atari/2600%20%26%20VCS/Demos/%5BA26%5D/Atari%202600%20%26%20VCS%20-%20Demos%20-%20%5BA26%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/atari2600/Demo [BIN]/"*) core="tia_libretro"; src="https://archive.org/download/tosec-main/Atari/2600%20%26%20VCS/Demos/%5BBIN%5D/Atari%202600%20%26%20VCS%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari2600/Demo [MP3]/"*) core="tia_libretro"; src="https://archive.org/download/tosec-main/Atari/2600%20%26%20VCS/Demos/%5BMP3%5D/Atari%202600%20%26%20VCS%20-%20Demos%20-%20%5BMP3%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/atari2600/MAME/"*) core="mame_libretro a2600 -cart"; src="https://archive.org/download/mame-sl/mame-sl/a2600.zip/a2600/";;
*"/atari2600/Cass MAME/"*) core="mame_libretro a2600 scharger -cass"; src="https://archive.org/download/mame-sl/mame-sl/a2600_cass.zip/a2600_cass/";;
*"/atari5200/NoIntro/"*) core="a5200_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%205200.zip/";;
*"/atari5200/TOSEC/"*) core="a5200_libretro"; src="https://archive.org/download/tosec-main/Atari/5200/Games/Atari%205200%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari5200/Homebrew/"*) core="a5200_libretro"; src="https://archive.org/download/tosec-main/Atari/5200/Homebrew/Games/Atari%205200%20-%20Homebrew%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari5200/App/"*) core="a5200_libretro"; src="https://archive.org/download/tosec-main/Atari/5200/Applications/Atari%205200%20-%20Applications%20%28TOSEC-v2022-12-21%29.zip/";;
*"/atari5200/Demo/"*) core="a5200_libretro"; src="https://archive.org/download/tosec-main/Atari/5200/Demos/Atari%205200%20-%20Demos%20%28TOSEC-v2021-07-25%29.zip/";;
*"/atari5200/MAME/"*) core="mame_libretro a5200 -cart"; src="https://archive.org/download/mame-sl/mame-sl/a5200.zip/a5200/";;
*"/atari7800/NoIntro/"*) core="prosystem_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%207800%20%28BIN%29.zip/";;
*"/atari7800/TOSEC/"*) core="prosystem_libretro"; src="https://archive.org/download/tosec-main/Atari/7800/Games/Atari%207800%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari7800/Homebrew/"*) core="prosystem_libretro"; src="https://archive.org/download/tosec-main/Atari/7800/Homebrew/Games/Atari%207800%20-%20Homebrew%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari7800/App/"*) core="prosystem_libretro"; src="https://archive.org/download/tosec-main/Atari/7800/Applications/Atari%207800%20-%20Applications%20%28TOSEC-v2024-07-03%29.zip/";;
*"/atari7800/MAME/"*) core="mame_libretro a7800 -cart"; src="https://archive.org/download/mame-sl/mame-sl/a7800.zip/a7800/";;
*"/atari7800/NoIntro A78/"*) core="prosystem_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%207800%20%28A78%29.zip/";;
*"/jaguar/NoIntro/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%20Jaguar%20%28J64%29.zip/";;
*"/jaguar/Games J64/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/tosec-main/Atari/Jaguar/Games/%5BJ64%5D/Atari%20Jaguar%20-%20Games%20-%20%5BJ64%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/jaguar/Games ROM/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/tosec-main/Atari/Jaguar/Games/%5BROM%5D/Atari%20Jaguar%20-%20Games%20-%20%5BROM%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/jaguar/Demo [BIN]/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/tosec-main/Atari/Jaguar/Demos/%5BBIN%5D/Atari%20Jaguar%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/jaguar/Demo [COF]/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/tosec-main/Atari/Jaguar/Demos/%5BCOF%5D/Atari%20Jaguar%20-%20Demos%20-%20%5BCOF%5D%20%28TOSEC-v2018-07-01%29.zip/";;
*"/jaguar/Demo [J64]/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/tosec-main/Atari/Jaguar/Demos/%5BJ64%5D/Atari%20Jaguar%20-%20Demos%20-%20%5BJ64%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/jaguar/Demo [JAG]/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/tosec-main/Atari/Jaguar/Demos/%5BJAG%5D/Atari%20Jaguar%20-%20Demos%20-%20%5BJAG%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/jaguar/Demo [ROM]/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/tosec-main/Atari/Jaguar/Demos/%5BROM%5D/Atari%20Jaguar%20-%20Demos%20-%20%5BROM%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/jaguar/MAME/"*) core="mame_libretro jaguar -cart"; src="https://archive.org/download/mame-sl/mame-sl/jaguar.zip/jaguar/";;
*"/jaguar/NoIntro ABS/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%20Jaguar%20%28ABS%29.zip/";;
*"/jaguar/NoIntro COF/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%20Jaguar%20%28COF%29.zip/";;
*"/jaguar/NoIntro JAG/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%20Jaguar%20%28JAG%29.zip/";;
*"/jaguar/NoIntro ROM/"*) core="virtualjaguar_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%20Jaguar%20%28ROM%29.zip/";;
*"/jaguarcd/Redump/"*) core="bigpemu"; ext="cue"; src="https://archive.org/download/atari-jaguarcd-redump/";;
*"/jaguarcd/NonRedump/"*) core="bigpemu"; ext="cdi"; src="https://archive.org/download/non-redump_atari-jaguar-cd/";;
*"/lynx/NoIntro/"*) core="mednafen_lynx_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%20Lynx%20%28LYX%29.zip/";;
*"/lynx/TOSEC/"*) core="mednafen_lynx_libretro"; src="https://archive.org/download/tosec-main/Atari/Lynx/Compilations/Games/%5BLNX%5D/Atari%20Lynx%20-%20Compilations%20-%20Games%20-%20%5BLNX%5D%20%28TOSEC-v2022-06-08%29.zip/";;
*"/lynx/Demo [LNX]/"*) core="mednafen_lynx_libretro"; src="https://archive.org/download/tosec-main/Atari/Lynx/Demos/%5BLNX%5D/Atari%20Lynx%20-%20Demos%20-%20%5BLNX%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/lynx/Demo [Multipart]/"*) core="mednafen_lynx_libretro"; src="https://archive.org/download/tosec-main/Atari/Lynx/Demos/%5BMultipart%5D/Atari%20Lynx%20-%20Demos%20-%20%5BMultipart%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/lynx/MAME/"*) core="mame_libretro lynx -cart"; ext="bin"; src="https://archive.org/download/mame-sl/mame-sl/lynx.zip/lynx/";;
*"/lynx/NoIntro LNX/"*) core="mednafen_lynx_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%20Lynx%20%28LNX%29.zip/";;
*"/atari800/NoIntro/"*) core="atari800_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%208-bit%20Family.zip/";;
*"/atari800/Games ATR/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Games/%5BATR%5D/Atari%208bit%20-%20Games%20-%20%5BATR%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari800/Games XEX/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Games/%5BXEX%5D/Atari%208bit%20-%20Games%20-%20%5BXEX%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari800/Games CAR/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Games/%5BCAR%5D/Atari%208bit%20-%20Games%20-%20%5BCAR%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari800/Games ATX/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Games/%5BATX%5D/Atari%208bit%20-%20Games%20-%20%5BATX%5D%20%28TOSEC-v2022-06-12%29.zip/";;
*"/atari800/Games CAS/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Games/%5BCAS%5D/Atari%208bit%20-%20Games%20-%20%5BCAS%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/atari800/Compilations/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Compilations/Games/%5BATR%5D/Atari%208bit%20-%20Compilations%20-%20Games%20-%20%5BATR%5D%20%28TOSEC-v2023-08-29%29.zip/";;
*"/atari800/Applications/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Applications/%5BATR%5D/Atari%208bit%20-%20Applications%20-%20%5BATR%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/atari800/Educational/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Compilations/Educational/%5BATR%5D/Atari%208bit%20-%20Compilations%20-%20Educational%20-%20%5BATR%5D%20%28TOSEC-v2013-12-13%29.zip/";;
*"/atari800/Edu Comp [CAS]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Compilations/Educational/%5BCAS%5D/Atari%208bit%20-%20Compilations%20-%20Educational%20-%20%5BCAS%5D%20%28TOSEC-v2012-07-18%29.zip/";;
*"/atari800/Demo Graphics/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Demos/Graphics/Atari%208bit%20-%20Demos%20-%20Graphics%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari800/Demo Music/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Demos/Music/Atari%208bit%20-%20Demos%20-%20Music%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari800/Demo [ATR]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Demos/%5BATR%5D/Atari%208bit%20-%20Demos%20-%20%5BATR%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari800/Demo [XEX]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Demos/%5BXEX%5D/Atari%208bit%20-%20Demos%20-%20%5BXEX%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atari800/Edu [ATR]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Educational/%5BATR%5D/Atari%208bit%20-%20Educational%20-%20%5BATR%5D%20%28TOSEC-v2022-06-12%29.zip/";;
*"/atari800/Edu [ATX]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Educational/%5BATX%5D/Atari%208bit%20-%20Educational%20-%20%5BATX%5D%20%28TOSEC-v2021-12-10%29.zip/";;
*"/atari800/Edu [BAS]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Educational/%5BBAS%5D/Atari%208bit%20-%20Educational%20-%20%5BBAS%5D%20%28TOSEC-v2022-06-12%29.zip/";;
*"/atari800/Edu [BIN]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Educational/%5BBIN%5D/Atari%208bit%20-%20Educational%20-%20%5BBIN%5D%20%28TOSEC-v2022-06-12%29.zip/";;
*"/atari800/Edu [CAS]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Educational/%5BCAS%5D/Atari%208bit%20-%20Educational%20-%20%5BCAS%5D%20%28TOSEC-v2021-12-10%29.zip/";;
*"/atari800/Edu [XEX]/"*) core="atari800_libretro"; src="https://archive.org/download/tosec-main/Atari/8bit/Educational/%5BXEX%5D/Atari%208bit%20-%20Educational%20-%20%5BXEX%5D%20%28TOSEC-v2022-06-12%29.zip/";;
*"/atari800/MAME/"*) core="mame_libretro a800 -cart1"; src="https://archive.org/download/mame-sl/mame-sl/a800.zip/a800/";;
*"/atari800/Flop MAME/"*) core="mame_libretro a800 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/a800_flop.zip/a800_flop/";;
*"/xegs/MAME/"*) core="mame_libretro xegs -cart"; src="https://archive.org/download/mame-sl/mame-sl/xegs.zip/xegs/";;
*"/atarist/NoIntro/"*) core="hatari_libretro"; src="https://archive.org/download/ni-roms/roms/Atari%20-%20ST.zip/";;
*"/atarist/Games ST/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Games/%5BST%5D/Atari%20ST%20-%20Games%20-%20%5BST%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atarist/Games STX/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Games/%5BSTX%5D/Atari%20ST%20-%20Games%20-%20%5BSTX%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/atarist/Compilations/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Compilations/Games/%5BSTX%5D/Atari%20ST%20-%20Compilations%20-%20Games%20-%20%5BSTX%5D%20%28TOSEC-v2015-05-07%29.zip/";;
*"/atarist/Applications/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Applications/%5BIMG%5D/Atari%20ST%20-%20Applications%20-%20%5BIMG%5D%20%28TOSEC-v2023-06-14%29.zip/";;
*"/atarist/Educational/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Compilations/Educational/Atari%20ST%20-%20Compilations%20-%20Educational%20%28TOSEC-v2013-12-13%29.zip/";;
*"/atarist/Demo [Multipart]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Demos/%5BMultipart%5D/Atari%20ST%20-%20Demos%20-%20%5BMultipart%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/atarist/Demo [PRG]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Demos/%5BPRG%5D/Atari%20ST%20-%20Demos%20-%20%5BPRG%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atarist/Demo [STX]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Demos/%5BSTX%5D/Atari%20ST%20-%20Demos%20-%20%5BSTX%5D%20%28TOSEC-v2023-11-07%29.zip/";;
*"/atarist/Demo [ST]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Demos/%5BST%5D/Atari%20ST%20-%20Demos%20-%20%5BST%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atarist/Demo [TOS]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Demos/%5BTOS%5D/Atari%20ST%20-%20Demos%20-%20%5BTOS%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/atarist/Edu [SCP]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Educational/%5BSCP%5D/Atari%20ST%20-%20Educational%20-%20%5BSCP%5D%20%28TOSEC-v2023-11-07%29.zip/";;
*"/atarist/Edu [STT]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Educational/%5BSTT%5D/Atari%20ST%20-%20Educational%20-%20%5BSTT%5D%20%28TOSEC-v2023-11-07%29.zip/";;
*"/atarist/Edu [STX]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Educational/%5BSTX%5D/Atari%20ST%20-%20Educational%20-%20%5BSTX%5D%20%28TOSEC-v2023-11-07%29.zip/";;
*"/atarist/Edu [ST]/"*) core="hatari_libretro"; src="https://archive.org/download/tosec-main/Atari/ST/Educational/%5BST%5D/Atari%20ST%20-%20Educational%20-%20%5BST%5D%20%28TOSEC-v2023-11-07%29.zip/";;
*"/atarist/MAME/"*) core="mame_libretro st -flop"; src="https://archive.org/download/mame-sl/mame-sl/st_flop.zip/st_flop/";;
*"/atarist/Cart MAME/"*) core="mame_libretro st -rom"; src="https://archive.org/download/mame-sl/mame-sl/st_cart.zip/st_cart/";;
*"/apple1/TOSEC/"*) core="mame_libretro apple1 -cass"; src="https://archive.org/download/tosec-main/Apple/1/Games/Apple%201%20-%20Games%20%28TOSEC-v2023-08-29%29.zip/";;
*"/apple1/App/"*) core="mame_libretro apple1 -cass"; src="https://archive.org/download/tosec-main/Apple/1/Applications/Apple%201%20-%20Applications%20%28TOSEC-v2023-08-29%29.zip/";;
*"/apple1/Demo/"*) core="mame_libretro apple1 -cass"; src="https://archive.org/download/tosec-main/Apple/1/Demos/Apple%201%20-%20Demos%20%28TOSEC-v2023-08-29%29.zip/";;
*"/apple1/MAME/"*) core="mame_libretro apple1 -cass"; src="https://archive.org/download/mame-sl/mame-sl/apple1.zip/apple1/";;
*"/apple2/Compilations/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Compilations/Games/Homemade/Apple%20II%20-%20Compilations%20-%20Games%20-%20Homemade%20%28TOSEC-v2024-07-03%29.zip/";;
*"/apple2/Educational/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Compilations/Educational/%5BA2R%5D/Apple%20II%20-%20Compilations%20-%20Educational%20-%20%5BA2R%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/apple2/Applications/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Applications/%5B2MG%5D/Apple%20II%20-%20Applications%20-%20%5B2MG%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/apple2/Edu Comp [DSK]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Compilations/Educational/%5BDSK%5D/Apple%20II%20-%20Compilations%20-%20Educational%20-%20%5BDSK%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/apple2/Edu Comp [EDD]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Compilations/Educational/%5BEDD%5D/Apple%20II%20-%20Compilations%20-%20Educational%20-%20%5BEDD%5D%20%28TOSEC-v2023-06-14%29.zip/";;
*"/apple2/Edu Comp [WOZ]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Compilations/Educational/%5BWOZ%5D/Apple%20II%20-%20Compilations%20-%20Educational%20-%20%5BWOZ%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/apple2/Demo [AIF]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Demos/%5BAIF%5D/Apple%20II%20-%20Demos%20-%20%5BAIF%5D%20%28TOSEC-v2023-06-14%29.zip/";;
*"/apple2/Demo [DSK]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Demos/%5BDSK%5D/Apple%20II%20-%20Demos%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/apple2/Demo [NIB]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Demos/%5BNIB%5D/Apple%20II%20-%20Demos%20-%20%5BNIB%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/apple2/Demo [PO]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Demos/%5BPO%5D/Apple%20II%20-%20Demos%20-%20%5BPO%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/apple2/Demo [WAV]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Demos/%5BWAV%5D/Apple%20II%20-%20Demos%20-%20%5BWAV%5D%20%28TOSEC-v2023-06-14%29.zip/";;
*"/apple2/Demo [WOZ]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Demos/%5BWOZ%5D/Apple%20II%20-%20Demos%20-%20%5BWOZ%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/apple2/Edu [2MG]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Educational/%5B2MG%5D/Apple%20II%20-%20Educational%20-%20%5B2MG%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/apple2/Edu [A2R]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Educational/%5BA2R%5D/Apple%20II%20-%20Educational%20-%20%5BA2R%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/apple2/Edu [DSK]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Educational/%5BDSK%5D/Apple%20II%20-%20Educational%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/apple2/Edu [EDD]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Educational/%5BEDD%5D/Apple%20II%20-%20Educational%20-%20%5BEDD%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/apple2/Edu [NIB]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Educational/%5BNIB%5D/Apple%20II%20-%20Educational%20-%20%5BNIB%5D%20%28TOSEC-v2023-08-29%29.zip/";;
*"/apple2/Edu [WAV]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Educational/%5BWAV%5D/Apple%20II%20-%20Educational%20-%20%5BWAV%5D%20%28TOSEC-v2023-10-03%29.zip/";;
*"/apple2/Edu [WOZ]/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/tosec-main/Apple/II/Educational/%5BWOZ%5D/Apple%20II%20-%20Educational%20-%20%5BWOZ%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/apple2/Cracked MAME/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/mame-sl/mame-sl/apple2_flop_clcracked.zip/apple2_flop_clcracked/";;
*"/apple2/Misc MAME/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/mame-sl/mame-sl/apple2_flop_misc.zip/apple2_flop_misc/";;
*"/apple2/Orig MAME/"*) core="mame_libretro apple2ee -flop1"; src="https://archive.org/download/mame-sl/mame-sl/apple2_flop_orig.zip/apple2_flop_orig/";;
*"/apple2/Cass MAME/"*) core="mame_libretro apple2ee -cass"; src="https://archive.org/download/mame-sl/mame-sl/apple2_cass.zip/apple2_cass/";;
*"/apple2gs/2MG/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/tosec-main/Apple/IIGS/Compilations/Games/Apple%20IIGS%20-%20Compilations%20-%20Games%20%28TOSEC-v2023-06-14%29.zip/";;
*"/apple2gs/Edu/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/tosec-main/Apple/IIGS/Educational/%5B2MG%5D/Apple%20IIGS%20-%20Educational%20-%20%5B2MG%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/apple2gs/App/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/tosec-main/Apple/IIGS/Applications/%5B2MG%5D/Apple%20IIGS%20-%20Applications%20-%20%5B2MG%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/apple2gs/Demo [2MG]/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/tosec-main/Apple/IIGS/Demos/%5B2MG%5D/Apple%20IIGS%20-%20Demos%20-%20%5B2MG%5D%20%28TOSEC-v2023-06-14%29.zip/";;
*"/apple2gs/Demo [PO]/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/tosec-main/Apple/IIGS/Demos/%5BPO%5D/Apple%20IIGS%20-%20Demos%20-%20%5BPO%5D%20%28TOSEC-v2023-08-29%29.zip/";;
*"/apple2gs/Edu [A2R]/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/tosec-main/Apple/IIGS/Educational/%5BA2R%5D/Apple%20IIGS%20-%20Educational%20-%20%5BA2R%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/apple2gs/Edu [PO]/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/tosec-main/Apple/IIGS/Educational/%5BPO%5D/Apple%20IIGS%20-%20Educational%20-%20%5BPO%5D%20%28TOSEC-v2023-06-14%29.zip/";;
*"/apple2gs/Edu [WOZ]/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/tosec-main/Apple/IIGS/Educational/%5BWOZ%5D/Apple%20IIGS%20-%20Educational%20-%20%5BWOZ%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/apple2gs/Cracked MAME/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/mame-sl/mame-sl/apple2gs_flop_clcracked.zip/apple2gs_flop_clcracked/";;
*"/apple2gs/Misc MAME/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/mame-sl/mame-sl/apple2gs_flop_misc.zip/apple2gs_flop_misc/";;
*"/apple2gs/Orig MAME/"*) core="mame_libretro apple2gs -flop3"; src="https://archive.org/download/mame-sl/mame-sl/apple2gs_flop_orig.zip/apple2gs_flop_orig/";;
*"/apple3/TOSEC/"*) core="mame_libretro apple3 -flop1"; src="https://archive.org/download/tosec-main/Apple/III/Games/Apple%20III%20-%20Games%20%28TOSEC-v2023-08-29%29.zip/";;
*"/apple3/Applications/"*) core="mame_libretro apple3 -flop1"; src="https://archive.org/download/tosec-main/Apple/III/Applications/%5BDSK%5D/Apple%20III%20-%20Applications%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/apple3/WAP PD/"*) core="mame_libretro apple3 -flop1"; src="https://archive.org/download/tosec-main/Apple/III/Collections/WAP%20III%20SIG%20Public%20Domain%20Library/Apple%20III%20-%20Collections%20-%20WAP%20III%20SIG%20Public%20Domain%20Library%20%28TOSEC-v2012-08-27%29.zip/";;
*"/apple3/Demo/"*) core="mame_libretro apple3 -flop1"; src="https://archive.org/download/tosec-main/Apple/III/Demos/Apple%20III%20-%20Demos%20%28TOSEC-v2023-08-29%29.zip/";;
*"/apple3/Edu/"*) core="mame_libretro apple3 -flop1"; src="https://archive.org/download/tosec-main/Apple/III/Educational/Apple%20III%20-%20Educational%20%28TOSEC-v2025-01-15%29.zip/";;
*"/apple3/MAME/"*) core="mame_libretro apple3 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/apple3.zip/apple3/";;
*"/lisa/Applications/"*) core="mame_libretro lisa -flop1"; src="https://archive.org/download/tosec-main/Apple/Lisa/Applications/%5BA2R%5D/Apple%20Lisa%20-%20Applications%20-%20%5BA2R%5D%20%28TOSEC-v2022-12-21%29.zip/";;
*"/lisa/MAME/"*) core="mame_libretro lisa -flop1"; src="https://archive.org/download/mame-sl/mame-sl/lisa.zip/lisa/";;
*"/macintosh/Flop MAME/"*) core="mame_libretro macse -flop1"; src="https://archive.org/download/mame-sl/mame-sl/mac_flop.zip/mac_flop/";;
*"/macintosh/Orig MAME/"*) core="mame_libretro macse -flop1"; src="https://archive.org/download/mame-sl/mame-sl/mac_flop_orig.zip/mac_flop_orig/";;
*"/macintosh/Cracked MAME/"*) core="mame_libretro macse -flop1"; src="https://archive.org/download/mame-sl/mame-sl/mac_flop_clcracked.zip/mac_flop_clcracked/";;
*"/macintosh/HDflop MAME/"*) core="mame_libretro macse -flop1"; src="https://archive.org/download/mame-sl/mame-sl/mac_hdflop.zip/mac_hdflop/";;
*"/macintosh/HDD CHD/"*) core="mame_libretro macse -hard"; src="https://archive.org/download/mame-software-list-chds-2/mac_hdd/";;
*"/macintosh/Games/"*) core="mame_libretro macse -flop1"; src="https://archive.org/download/tosec-main/Apple/Macintosh/Games/%5BDSK%5D/Apple%20Macintosh%20-%20Games%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/zx80/MAME/"*) core="mame_libretro zx80 -autoboot_command 'W\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/zx80_cass.zip/zx80_cass/";;
*"/zx81/TOSEC/"*) core="81_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX81/Games/%5BMultipart%5D/Sinclair%20ZX81%20-%20Games%20-%20%5BMultipart%5D%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zx81/App/"*) core="81_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX81/Applications/%5BMultipart%5D/Sinclair%20ZX81%20-%20Applications%20-%20%5BMultipart%5D%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zx81/Demo [P]/"*) core="81_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX81/Demos/%5BP%5D/Sinclair%20ZX81%20-%20Demos%20-%20%5BP%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/zx81/Edu/"*) core="81_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX81/Educational/Sinclair%20ZX81%20-%20Educational%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zx81/MAME/"*) core="mame_libretro zx81 -autoboot_command 'J\"\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/zx81_cass.zip/zx81_cass/";;
*"/zxspectrum/Compilations/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Compilations/Games/%5B%24B%5D/Sinclair%20ZX%20Spectrum%20-%20Compilations%20-%20Games%20-%20%5B%24B%5D%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zxspectrum/Educational/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Compilations/Educational/%5BTAP%5D/Sinclair%20ZX%20Spectrum%20-%20Compilations%20-%20Educational%20-%20%5BTAP%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Applications/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Applications/%5B%24B%5D/Sinclair%20ZX%20Spectrum%20-%20Applications%20-%20%5B%24B%5D%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zxspectrum/Edu Comp [TRD]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Compilations/Educational/%5BTRD%5D/Sinclair%20ZX%20Spectrum%20-%20Compilations%20-%20Educational%20-%20%5BTRD%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu Comp [TZX]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Compilations/Educational/%5BTZX%5D/Sinclair%20ZX%20Spectrum%20-%20Compilations%20-%20Educational%20-%20%5BTZX%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu Comp [Z80]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Compilations/Educational/%5BZ80%5D/Sinclair%20ZX%20Spectrum%20-%20Compilations%20-%20Educational%20-%20%5BZ80%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [$B]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5B%24B%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5B%24B%5D%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zxspectrum/Demo [$C]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5B%24C%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5B%24C%5D%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zxspectrum/Demo [$M]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5B%24M%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5B%24M%5D%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zxspectrum/Demo [BIN]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BBIN%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/zxspectrum/Demo [DSK]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BDSK%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BDSK%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [FDI]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BFDI%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BFDI%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [Multipart]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BMultipart%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BMultipart%5D%20%28TOSEC-v2011-09-24%29.zip/";;
*"/zxspectrum/Demo [SCL]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BSCL%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BSCL%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [SNA]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BSNA%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BSNA%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [SPG]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BSPG%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BSPG%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [SP]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BSP%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BSP%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [TAP]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BTAP%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BTAP%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/zxspectrum/Demo [TRD]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BTRD%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BTRD%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [TZX]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BTZX%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BTZX%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Demo [Z80]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Demos/%5BZ80%5D/Sinclair%20ZX%20Spectrum%20-%20Demos%20-%20%5BZ80%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [D40]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BD40%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BD40%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [D80]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BD80%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BD80%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [DSK]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BDSK%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BDSK%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [SCL]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BSCL%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BSCL%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [SZX]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BSZX%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BSZX%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [TAP]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BTAP%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BTAP%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [TRD]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BTRD%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BTRD%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [TZX]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BTZX%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BTZX%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/Edu [Z80]/"*) core="fuse_libretro"; src="https://archive.org/download/tosec-main/Sinclair/ZX%20Spectrum/Educational/%5BZ80%5D/Sinclair%20ZX%20Spectrum%20-%20Educational%20-%20%5BZ80%5D%20%28TOSEC-v2023-06-10%29.zip/";;
*"/zxspectrum/MAME/"*) core="mame_libretro spectrum -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/spectrum_cass.zip/spectrum_cass/";;
*"/zxspectrum/Cass MAME/"*) core="mame_libretro tc2068 -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/timex_cass.zip/timex_cass/";;
*"/zxspectrum/Beta Disc MAME/"*) core="mame_libretro pentagon -flop"; src="https://archive.org/download/mame-sl/mame-sl/spectrum_betadisc_flop.zip/spectrum_betadisc_flop/";;
*"/zxspectrum/Opus Flop MAME/"*) core="mame_libretro spec128 -flop"; src="https://archive.org/download/mame-sl/mame-sl/spectrum_flop_opus.zip/spectrum_flop_opus/";;
*"/zxspectrum/Cart MAME/"*) core="mame_libretro specpls3 -cart"; src="https://archive.org/download/mame-sl/mame-sl/spectrum_cart.zip/spectrum_cart/";;
*"/zxspectrum/MGT Flop MAME/"*) core="mame_libretro spec128 -flop"; src="https://archive.org/download/mame-sl/mame-sl/spectrum_mgt_flop.zip/spectrum_mgt_flop/";;
*"/specpls3/MAME/"*) core="mame_libretro specpls3 -flop"; src="https://archive.org/download/mame-sl/mame-sl/specpls3_flop.zip/specpls3_flop/";;
*"/ql/Demos MDV/"*) core="mame_libretro ql -autoboot_command 'BOOT\n' -autoboot_delay 5 -utap1"; ext="mdv"; src="https://archive.org/download/tosec-main/Sinclair/QL/Demos/%5BBAS%5D/Sinclair%20QL%20-%20Demos%20-%20%5BBAS%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/ql/Demo [MDV]/"*) core="mame_libretro ql -autoboot_command 'BOOT\n' -autoboot_delay 5 -utap1"; ext="mdv"; src="https://archive.org/download/tosec-main/Sinclair/QL/Demos/%5BMDV%5D/Sinclair%20QL%20-%20Demos%20-%20%5BMDV%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/ql/Cass MAME/"*) core="mame_libretro ql -autoboot_command 'BOOT\n' -autoboot_delay 5 -utap1"; src="https://archive.org/download/mame-sl/mame-sl/ql_cass.zip/ql_cass/";;
*"/ql/Cart MAME/"*) core="mame_libretro ql -cart"; src="https://archive.org/download/mame-sl/mame-sl/ql_cart.zip/ql_cart/";;
*"/ql/Flop MAME/"*) core="mame_libretro ql -exp trump -flop"; src="https://archive.org/download/mame-sl/mame-sl/ql_flop.zip/ql_flop/";;
*"/z88/MAME/"*) core="mame_libretro z88 -cart1"; src="https://archive.org/download/mame-sl/mame-sl/z88_cart.zip/z88_cart/";;
*"/amstradcpc/Games DSK/"*) core="cap32_libretro"; src="https://archive.org/download/tosec-main/Amstrad/CPC/Games/%5BDSK%5D/Amstrad%20CPC%20-%20Games%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/amstradcpc/Compilations DSK/"*) core="cap32_libretro"; src="https://archive.org/download/tosec-main/Amstrad/CPC/Compilations/Games/%5BDSK%5D/Amstrad%20CPC%20-%20Compilations%20-%20Games%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/amstradcpc/App/"*) core="cap32_libretro"; src="https://archive.org/download/tosec-main/Amstrad/CPC/Applications/%5BBIN%5D/Amstrad%20CPC%20-%20Applications%20-%20%5BBIN%5D%20%28TOSEC-v2014-10-28%29.zip/";;
*"/amstradcpc/Demo [CDT]/"*) core="cap32_libretro"; src="https://archive.org/download/tosec-main/Amstrad/CPC/Demos/%5BCDT%5D/Amstrad%20CPC%20-%20Demos%20-%20%5BCDT%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/amstradcpc/Demo [DSK]/"*) core="cap32_libretro"; src="https://archive.org/download/tosec-main/Amstrad/CPC/Demos/%5BDSK%5D/Amstrad%20CPC%20-%20Demos%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/amstradcpc/Edu/"*) core="cap32_libretro"; src="https://archive.org/download/tosec-main/Amstrad/CPC/Educational/Amstrad%20CPC%20-%20Educational%20%28TOSEC-v2025-01-15%29.zip/";;
*"/amstradcpc/Cass MAME/"*) core="mame_libretro cpc464 -autoboot_command 'RUN\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/cpc_cass.zip/cpc_cass/";;
*"/amstradcpc/Flop MAME/"*) core="mame_libretro cpc6128 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/cpc_flop.zip/cpc_flop/";;
*"/gx4000/TOSEC/"*) core="cap32_libretro"; src="https://archive.org/download/tosec-main/Amstrad/GX4000/Games/Amstrad%20GX4000%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/gx4000/Demo/"*) core="cap32_libretro"; src="https://archive.org/download/tosec-main/Amstrad/GX4000/Demos/Amstrad%20GX4000%20-%20Demos%20%28TOSEC-v2022-06-08%29.zip/";;
*"/gx4000/MAME/"*) core="mame_libretro gx4000 -cart"; src="https://archive.org/download/mame-sl/mame-sl/gx4000.zip/gx4000/";;
*"/pcw/MAME/"*) core="mame_libretro pcw8256 -flop"; src="https://archive.org/download/mame-sl/mame-sl/pcw.zip/pcw/";;
*"/pet/TOSEC/"*) core="vice_xpet_libretro"; src="https://archive.org/download/tosec-main/Commodore/PET/Compilations/Games/Commodore%20PET%20-%20Compilations%20-%20Games%20%28TOSEC-v2011-10-06%29.zip/";;
*"/pet/MAME/"*) core="mame_libretro pet2001n -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/pet_cass.zip/pet_cass/";;
*"/pet/Flop MAME/"*) core="mame_libretro pet2001n -flop1"; src="https://archive.org/download/mame-sl/mame-sl/pet_flop.zip/pet_flop/";;
*"/pet/ROM MAME/"*) core="mame_libretro pet2001n -rom"; src="https://archive.org/download/mame-sl/mame-sl/pet_rom.zip/pet_rom/";;
*"/pet/Quik MAME/"*) core="mame_libretro pet2001n -quik"; src="https://archive.org/download/mame-sl/mame-sl/pet_quik.zip/pet_quik/";;
*"/cplus4/NoIntro/"*) core="vice_xplus4_libretro"; src="https://archive.org/download/ni-roms/roms/Commodore%20-%20Plus-4.zip/";;
*"/cplus4/PRG/"*) core="vice_xplus4_libretro"; src="https://archive.org/download/tosec-main/Commodore/C16%2C%20C116%20%26%20Plus-4/Games/%5BPRG%5D/Commodore%20C16%2C%20C116%20%26%20Plus-4%20-%20Games%20-%20%5BPRG%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/cplus4/TAP/"*) core="vice_xplus4_libretro"; src="https://archive.org/download/tosec-main/Commodore/C16%2C%20C116%20%26%20Plus-4/Games/%5BTAP%5D/Commodore%20C16%2C%20C116%20%26%20Plus-4%20-%20Games%20-%20%5BTAP%5D%20%28TOSEC-v2014-02-01%29.zip/";;
*"/cplus4/Utils/"*) core="vice_xplus4_libretro"; src="https://archive.org/download/tosec-main/Commodore/C16%2C%20C116%20%26%20Plus-4/Utilities/%5BPRG%5D/Commodore%20C16%2C%20C116%20%26%20Plus-4%20-%20Utilities%20-%20%5BPRG%5D%20%28TOSEC-v2023-03-18%29.zip/";;
*"/cplus4/MAME/"*) core="mame_libretro c16 -cart"; src="https://archive.org/download/mame-sl/mame-sl/plus4_cart.zip/plus4_cart/";;
*"/cplus4/Flop MAME/"*) core="mame_libretro c16 -flop"; src="https://archive.org/download/mame-sl/mame-sl/plus4_flop.zip/plus4_flop/";;
*"/cplus4/Cass MAME/"*) core="mame_libretro c16 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/plus4_cass.zip/plus4_cass/";;
*"/vic10/MAME/"*) core="mame_libretro vic10"; src="https://archive.org/download/mame-sl/mame-sl/vic10.zip/vic10/";;
*"/c20/NoIntro/"*) core="vice_xvic_libretro"; src="https://archive.org/download/ni-roms/roms/Commodore%20-%20VIC-20.zip/";;
*"/c20/Compilations/"*) core="vice_xvic_libretro"; src="https://archive.org/download/tosec-main/Commodore/VIC20/Compilations/Games/Commodore%20VIC20%20-%20Compilations%20-%20Games%20%28TOSEC-v2011-11-07%29.zip/";;
*"/c20/App/"*) core="vice_xvic_libretro"; src="https://archive.org/download/tosec-main/Commodore/VIC20/Applications/Source/Commodore%20VIC20%20-%20Applications%20-%20Source%20%28TOSEC-v2017-10-23%29.zip/";;
*"/c20/Demo Source/"*) core="vice_xvic_libretro"; src="https://archive.org/download/tosec-main/Commodore/VIC20/Demos/Source/Commodore%20VIC20%20-%20Demos%20-%20Source%20%28TOSEC-v2017-10-23%29.zip/";;
*"/c20/Demo [CRT]/"*) core="vice_xvic_libretro"; src="https://archive.org/download/tosec-main/Commodore/VIC20/Demos/%5BCRT%5D/Commodore%20VIC20%20-%20Demos%20-%20%5BCRT%5D%20%28TOSEC-v2011-11-07%29.zip/";;
*"/c20/Demo [D64]/"*) core="vice_xvic_libretro"; src="https://archive.org/download/tosec-main/Commodore/VIC20/Demos/%5BD64%5D/Commodore%20VIC20%20-%20Demos%20-%20%5BD64%5D%20%28TOSEC-v2017-10-23%29.zip/";;
*"/c20/Demo [PRG]/"*) core="vice_xvic_libretro"; src="https://archive.org/download/tosec-main/Commodore/VIC20/Demos/%5BPRG%5D/Multipart/Commodore%20VIC20%20-%20Demos%20-%20%5BPRG%5D%20-%20Multipart%20%28TOSEC-v2017-10-23%29.zip/";;
*"/c20/Demo [PRG]/"*) core="vice_xvic_libretro"; src="https://archive.org/download/tosec-main/Commodore/VIC20/Demos/%5BPRG%5D/Singlepart/Commodore%20VIC20%20-%20Demos%20-%20%5BPRG%5D%20-%20Singlepart%20%28TOSEC-v2017-10-23%29.zip/";;
*"/c20/Edu [TAP]/"*) core="vice_xvic_libretro"; src="https://archive.org/download/tosec-main/Commodore/VIC20/Educational/%5BTAP%5D/Commodore%20VIC20%20-%20Educational%20-%20%5BTAP%5D%20%28TOSEC-v2018-03-24%29.zip/";;
*"/c20/MAME/"*) core="mame_libretro vic20 -cart"; src="https://archive.org/download/mame-sl/mame-sl/vic1001_cart.zip/vic1001_cart/";;
*"/c20/Cass MAME/"*) core="mame_libretro vic20 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/vic1001_cass.zip/vic1001_cass/";;
*"/cbm2/Cart MAME/"*) core="mame_libretro cbm610 -cart"; src="https://archive.org/download/mame-sl/mame-sl/cbm2_cart.zip/cbm2_cart/";;
*"/cbm2/Flop MAME/"*) core="mame_libretro cbm610 -autoboot_command 'DLOAD\"\"*\"\"\nRUN\n' -autoboot_delay 5 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/cbm2_flop.zip/cbm2_flop/";;
*"/c64/NoIntro/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/ni-roms/roms/Commodore%20-%20Commodore%2064.zip/";;
*"/c64/PP/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/ni-roms/roms/Commodore%20-%20Commodore%2064%20%28PP%29.zip/";;
*"/c64/Tapes/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/ni-roms/roms/Commodore%20-%20Commodore%2064%20%28Tapes%29.zip/";;
*"/c64/Arcade/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Arcade/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Arcade%20-%20%5BD64%5D%20%28TOSEC-v2025-02-16%29.zip/";;
*"/c64/Adventure/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Adventure/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Adventure%20-%20%5BD64%5D%20%28TOSEC-v2025-02-16%29.zip/";;
*"/c64/Shoot'em Up/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Shoot%27em%20Up/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Shoot%27em%20Up%20-%20%5BD64%5D%20%28TOSEC-v2025-01-10%29.zip/";;
*"/c64/Sports/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Sports/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Sports%20-%20%5BD64%5D%20%28TOSEC-v2025-01-03%29.zip/";;
*"/c64/Racing/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Racing/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Racing%20-%20%5BD64%5D%20%28TOSEC-v2025-01-03%29.zip/";;
*"/c64/Strategy/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Strategy/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Strategy%20-%20%5BD64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Simulation/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Simulation/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Simulation%20-%20%5BD64%5D%20%28TOSEC-v2025-01-03%29.zip/";;
*"/c64/Misc/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Misc/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Misc%20-%20%5BD64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Boulder Dash/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Boulder%20Dash/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Boulder%20Dash%20-%20%5BD64%5D%20%28TOSEC-v2025-02-16%29.zip/";;
*"/c64/Board/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Board/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Board%20-%20%5BD64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Gambling/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Gambling/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Gambling%20-%20%5BD64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Cards/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Games/Cards/%5BD64%5D/Commodore%20C64%20-%20Games%20-%20Cards%20-%20%5BD64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Educational/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Compilations/Educational/Commodore%20C64%20-%20Compilations%20-%20Educational%20%28TOSEC-v2018-12-16%29.zip/";;
*"/c64/Applications/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Applications/Test%20Disks/%5BD64%5D/Commodore%20C64%20-%20Applications%20-%20Test%20Disks%20-%20%5BD64%5D%20%28TOSEC-v2023-06-14%29.zip/";;
*"/c64/Demo [ARC]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BARC%5D/Commodore%20C64%20-%20Demos%20-%20%5BARC%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Demo [ARK]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BARK%5D/Commodore%20C64%20-%20Demos%20-%20%5BARK%5D%20%28TOSEC-v2022-03-18%29.zip/";;
*"/c64/Demo [BIN]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BBIN%5D/Commodore%20C64%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2021-08-10%29.zip/";;
*"/c64/Demo [CRT]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BCRT%5D/Commodore%20C64%20-%20Demos%20-%20%5BCRT%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Demo [D64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BD64%5D/Commodore%20C64%20-%20Demos%20-%20%5BD64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Demo [D81]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BD81%5D/Commodore%20C64%20-%20Demos%20-%20%5BD81%5D%20%28TOSEC-v2021-07-25%29.zip/";;
*"/c64/Demo [DFI]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BDFI%5D/Commodore%20C64%20-%20Demos%20-%20%5BDFI%5D%20%28TOSEC-v2021-06-16%29.zip/";;
*"/c64/Demo [G64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BG64%5D/Commodore%20C64%20-%20Demos%20-%20%5BG64%5D%20%28TOSEC-v2023-05-19%29.zip/";;
*"/c64/Demo [LNX]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BLNX%5D/Commodore%20C64%20-%20Demos%20-%20%5BLNX%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Demo [N64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BN64%5D/Commodore%20C64%20-%20Demos%20-%20%5BN64%5D%20%28TOSEC-v2019-04-20%29.zip/";;
*"/c64/Demo [NIB]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BNIB%5D/Commodore%20C64%20-%20Demos%20-%20%5BNIB%5D%20%28TOSEC-v2021-12-08%29.zip/";;
*"/c64/Demo [P00]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BP00%5D/Commodore%20C64%20-%20Demos%20-%20%5BP00%5D%20%28TOSEC-v2024-06-16%29.zip/";;
*"/c64/Demo [PRG]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BPRG%5D/Commodore%20C64%20-%20Demos%20-%20%5BPRG%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Demo [SDA]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BSDA%5D/Commodore%20C64%20-%20Demos%20-%20%5BSDA%5D%20%28TOSEC-v2023-05-19%29.zip/";;
*"/c64/Demo [SFX]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BSFX%5D/Commodore%20C64%20-%20Demos%20-%20%5BSFX%5D%20%28TOSEC-v2023-05-19%29.zip/";;
*"/c64/Demo [T64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BT64%5D/Commodore%20C64%20-%20Demos%20-%20%5BT64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Demo [TAP]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BTAP%5D/Commodore%20C64%20-%20Demos%20-%20%5BTAP%5D%20%28TOSEC-v2025-01-05%29.zip/";;
*"/c64/Demo [Z64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Demos/%5BZ64%5D/Commodore%20C64%20-%20Demos%20-%20%5BZ64%5D%20%28TOSEC-v2024-07-12%29.zip/";;
*"/c64/Edu [ARC]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BARC%5D/Commodore%20C64%20-%20Educational%20-%20%5BARC%5D%20%28TOSEC-v2024-01-10%29.zip/";;
*"/c64/Edu [ARK]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BARK%5D/Commodore%20C64%20-%20Educational%20-%20%5BARK%5D%20%28TOSEC-v2022-04-18%29.zip/";;
*"/c64/Edu [BIN]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BBIN%5D/Commodore%20C64%20-%20Educational%20-%20%5BBIN%5D%20%28TOSEC-v2024-01-10%29.zip/";;
*"/c64/Edu [CRT]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BCRT%5D/Commodore%20C64%20-%20Educational%20-%20%5BCRT%5D%20%28TOSEC-v2024-01-10%29.zip/";;
*"/c64/Edu [D64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BD64%5D/Commodore%20C64%20-%20Educational%20-%20%5BD64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Edu [D81]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BD81%5D/Commodore%20C64%20-%20Educational%20-%20%5BD81%5D%20%28TOSEC-v2022-04-18%29.zip/";;
*"/c64/Edu [DFI]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BDFI%5D/Commodore%20C64%20-%20Educational%20-%20%5BDFI%5D%20%28TOSEC-v2022-06-06%29.zip/";;
*"/c64/Edu [DMP]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BDMP%5D/Commodore%20C64%20-%20Educational%20-%20%5BDMP%5D%20%28TOSEC-v2023-10-14%29.zip/";;
*"/c64/Edu [G64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BG64%5D/Commodore%20C64%20-%20Educational%20-%20%5BG64%5D%20%28TOSEC-v2024-06-29%29.zip/";;
*"/c64/Edu [LNX]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BLNX%5D/Commodore%20C64%20-%20Educational%20-%20%5BLNX%5D%20%28TOSEC-v2025-01-05%29.zip/";;
*"/c64/Edu [NBZ]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BNBZ%5D/Commodore%20C64%20-%20Educational%20-%20%5BNBZ%5D%20%28TOSEC-v2024-05-27%29.zip/";;
*"/c64/Edu [NIB]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BNIB%5D/Commodore%20C64%20-%20Educational%20-%20%5BNIB%5D%20%28TOSEC-v2024-06-29%29.zip/";;
*"/c64/Edu [P00]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BP00%5D/Commodore%20C64%20-%20Educational%20-%20%5BP00%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Edu [PRG]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BPRG%5D/Commodore%20C64%20-%20Educational%20-%20%5BPRG%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Edu [SDA]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BSDA%5D/Commodore%20C64%20-%20Educational%20-%20%5BSDA%5D%20%28TOSEC-v2023-05-19%29.zip/";;
*"/c64/Edu [T64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BT64%5D/Commodore%20C64%20-%20Educational%20-%20%5BT64%5D%20%28TOSEC-v2025-01-07%29.zip/";;
*"/c64/Edu [TAP]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BTAP%5D/Commodore%20C64%20-%20Educational%20-%20%5BTAP%5D%20%28TOSEC-v2025-01-03%29.zip/";;
*"/c64/Edu [Z64]/"*) core="vice_x64sc_libretro"; src="https://archive.org/download/tosec-main/Commodore/C64/Educational/%5BZ64%5D/Commodore%20C64%20-%20Educational%20-%20%5BZ64%5D%20%28TOSEC-v2024-06-29%29.zip/";;
*"/c64/Cart MAME/"*) core="mame_libretro c64 -cart"; src="https://archive.org/download/mame-sl/mame-sl/c64_cart.zip/c64_cart/";;
*"/c64/Cass MAME/"*) core="mame_libretro c64 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/c64_cass.zip/c64_cass/";;
*"/c64/Flop Orig MAME/"*) core="mame_libretro c64 -flop"; src="https://archive.org/download/mame-sl/mame-sl/c64_flop_orig.zip/c64_flop_orig/";;
*"/c64/Flop Misc MAME/"*) core="mame_libretro c64 -flop"; src="https://archive.org/download/mame-sl/mame-sl/c64_flop_misc.zip/c64_flop_misc/";;
*"/c128/Games/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Games/CPM/%5BD71%5D/Commodore%20C128%20-%20Games%20-%20CPM%20-%20%5BD71%5D%20%28TOSEC-v2018-03-25%29.zip/";;
*"/c128/App/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Applications/CPM/%5BD64%5D/Commodore%20C128%20-%20Applications%20-%20CPM%20-%20%5BD64%5D%20%28TOSEC-v2018-03-25%29.zip/";;
*"/c128/Demo [D64]/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Demos/%5BD64%5D/Commodore%20C128%20-%20Demos%20-%20%5BD64%5D%20%28TOSEC-v2021-07-23%29.zip/";;
*"/c128/Demo [PRG]/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Demos/%5BPRG%5D/Commodore%20C128%20-%20Demos%20-%20%5BPRG%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/c128/Demo [SFX]/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Demos/%5BSFX%5D/Commodore%20C128%20-%20Demos%20-%20%5BSFX%5D%20%28TOSEC-v2018-10-26%29.zip/";;
*"/c128/Demo [T64]/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Demos/%5BT64%5D/Commodore%20C128%20-%20Demos%20-%20%5BT64%5D%20%28TOSEC-v2020-04-19%29.zip/";;
*"/c128/Edu [D64]/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Educational/%5BD64%5D/Commodore%20C128%20-%20Educational%20-%20%5BD64%5D%20%28TOSEC-v2018-12-05%29.zip/";;
*"/c128/Edu [G64]/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Educational/%5BG64%5D/Commodore%20C128%20-%20Educational%20-%20%5BG64%5D%20%28TOSEC-v2021-07-14%29.zip/";;
*"/c128/Edu [NIB]/"*) core="vice_x128_libretro"; src="https://archive.org/download/tosec-main/Commodore/C128/Educational/%5BNIB%5D/Commodore%20C128%20-%20Educational%20-%20%5BNIB%5D%20%28TOSEC-v2021-07-14%29.zip/";;
*"/c128/Cart MAME/"*) core="mame_libretro c128 -cart"; src="https://archive.org/download/mame-sl/mame-sl/c128_cart.zip/c128_cart/";;
*"/c128/Flop MAME/"*) core="mame_libretro c128 -flop"; src="https://archive.org/download/mame-sl/mame-sl/c128_flop.zip/c128_flop/";;
*"/c128/Rom MAME/"*) core="mame_libretro c128 -rom"; src="https://archive.org/download/mame-sl/mame-sl/c128_rom.zip/c128_rom/";;
*"/amiga500/NoIntro/"*) core="puae_libretro"; src="https://archive.org/download/ni-roms/roms/Commodore%20-%20Amiga.zip/";;
*"/amiga500/Games ADF/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Games/%5BADF%5D/Commodore%20Amiga%20-%20Games%20-%20%5BADF%5D%20%28TOSEC-v2025-01-30%29.zip/";;
*"/amiga500/Games SPS/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Games/SPS/Commodore%20Amiga%20-%20Games%20-%20SPS%20%28TOSEC-v2025-01-13%29.zip/";;
*"/amiga500/Games EXE/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Games/%5BEXE%5D/Commodore%20Amiga%20-%20Games%20-%20%5BEXE%5D%20%28TOSEC-v2011-11-01%29.zip/";;
*"/amiga500/Compilations/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Compilations/Games/Commodore%20Amiga%20-%20Compilations%20-%20Games%20%28TOSEC-v2023-01-13%29.zip/";;
*"/amiga500/Edu/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Educational/SPS/Commodore%20Amiga%20-%20Educational%20-%20SPS%20%28TOSEC-v2024-12-08%29.zip/";;
*"/amiga500/Applications/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Applications/Data/Commodore%20Amiga%20-%20Applications%20-%20Data%20%28TOSEC-v2025-01-08%29.zip/";;
*"/amiga500/Demo Animations and Videos/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Demos/Animations%20and%20Videos/Commodore%20Amiga%20-%20Demos%20-%20Animations%20and%20Videos%20%28TOSEC-v2025-01-12%29.zip/";;
*"/amiga500/Demo Music/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Demos/Music/Commodore%20Amiga%20-%20Demos%20-%20Music%20%28TOSEC-v2025-01-09%29.zip/";;
*"/amiga500/Demo Packs/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Demos/Packs/Commodore%20Amiga%20-%20Demos%20-%20Packs%20%28TOSEC-v2024-09-29%29.zip/";;
*"/amiga500/Demo Slideshows/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Demos/Slideshows/Commodore%20Amiga%20-%20Demos%20-%20Slideshows%20%28TOSEC-v2025-01-16%29.zip/";;
*"/amiga500/Demo Various/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Demos/Various/%5BADF%5D/Commodore%20Amiga%20-%20Demos%20-%20Various%20-%20%5BADF%5D%20%28TOSEC-v2025-01-18%29.zip/";;
*"/amiga500/Demo Various/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Demos/Various/%5BEXE%5D/Commodore%20Amiga%20-%20Demos%20-%20Various%20-%20%5BEXE%5D%20%28TOSEC-v2016-12-20%29.zip/";;
*"/amiga500/Edu [ADF]/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Educational/%5BADF%5D/Commodore%20Amiga%20-%20Educational%20-%20%5BADF%5D%20%28TOSEC-v2025-01-11%29.zip/";;
*"/amiga500/Edu [Unofficial IPF]/"*) core="puae_libretro"; src="https://archive.org/download/tosec-main/Commodore/Amiga/Educational/%5BUnofficial%20IPF%5D/Commodore%20Amiga%20-%20Educational%20-%20%5BUnofficial%20IPF%5D%20%28TOSEC-v2025-01-11%29.zip/";;
*"/amiga500/Flop MAME/"*) core="mame_libretro a500 -flop"; src="https://archive.org/download/mame-sl/mame-sl/amiga_flop.zip/amiga_flop/";;
*"/amiga500/ECS Flop MAME/"*) core="mame_libretro a600 -flop"; src="https://archive.org/download/mame-sl/mame-sl/amigaecs_flop.zip/amigaecs_flop/";;
*"/amiga500/OCS Flop MAME/"*) core="mame_libretro a500 -flop"; src="https://archive.org/download/mame-sl/mame-sl/amigaocs_flop.zip/amigaocs_flop/";;
*"/amiga500/AGA Flop MAME/"*) core="mame_libretro a1200 -flop"; src="https://archive.org/download/mame-sl/mame-sl/amigaaga_flop.zip/amigaaga_flop/";;
*"/amiga500/Apps MAME/"*) core="mame_libretro a500 -flop"; src="https://archive.org/download/mame-sl/mame-sl/amiga_apps.zip/amiga_apps/";;
*"/amiga500/Demos MAME/"*) core="mame_libretro a500 -flop"; src="https://archive.org/download/mame-sl/mame-sl/amiga_demos.zip/amiga_demos/";;
*"/amiga500/Workbench MAME/"*) core="mame_libretro a500 -flop"; src="https://archive.org/download/mame-sl/mame-sl/amiga_workbench.zip/amiga_workbench/";;
*"/amiga500/Hardware MAME/"*) core="mame_libretro a500 -flop"; src="https://archive.org/download/mame-sl/mame-sl/amiga_hardware.zip/amiga_hardware/";;
*"/amiga1200/Redump/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/noaen-redump-commodore-amiga-cd/";;
*"/amiga1200/ISO/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga/CD/Games/%5BISO%5D/";;
*"/amiga1200/App/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga/CD/Applications/%5BISO%5D/";;
*"/amiga1200/Multimedia/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga/CD/Multimedia/%5BISO%5D/";;
*"/amigacd32/Redump/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/noaen-redump-commodore-amiga-cd32/";;
*"/amigacd32/ISO/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga%20CD32/Games/%5BISO%5D/";;
*"/amigacd32/App/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga%20CD32/Applications/";;
*"/amigacd32/Edu/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga%20CD32/Educational/%5BISO%5D/";;
*"/amigacd32/Multimedia/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga%20CD32/Multimedia/%5BISO%5D/";;
*"/amigacd32/CHD/"*) core="mame_libretro cd32 -cdrm"; src="https://archive.org/download/mame-software-list-chds-2/cd32/";;
*"/nes/NoIntro/"*) core="nestopia_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Nintendo%20Entertainment%20System%20%28Headered%29.zip/";;
*"/nes/Games NES/"*) core="nestopia_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Famicom%20%26%20Entertainment%20System/Games/%5BNES%5D/Nintendo%20Famicom%20%26%20Entertainment%20System%20-%20Games%20-%20%5BNES%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/nes/Games UNF/"*) core="nestopia_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Famicom%20%26%20Entertainment%20System/Games/%5BUNF%5D/Nintendo%20Famicom%20%26%20Entertainment%20System%20-%20Games%20-%20%5BUNF%5D%20%28TOSEC-v2011-02-22%29.zip/";;
*"/nes/Demo [NES]/"*) core="nestopia_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Famicom%20%26%20Entertainment%20System/Demos/%5BNES%5D/Nintendo%20Famicom%20%26%20Entertainment%20System%20-%20Demos%20-%20%5BNES%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/nes/Demo [UNF]/"*) core="nestopia_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Famicom%20%26%20Entertainment%20System/Demos/%5BUNF%5D/Nintendo%20Famicom%20%26%20Entertainment%20System%20-%20Demos%20-%20%5BUNF%5D%20%28TOSEC-v2011-02-22%29.zip/";;
*"/nes/Edu/"*) core="nestopia_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Famicom%20%26%20Entertainment%20System/Educational/Nintendo%20Famicom%20%26%20Entertainment%20System%20-%20Educational%20%28TOSEC-v2011-02-22%29.zip/";;
*"/nes/MAME/"*) core="mame_libretro nes -cart"; src="https://archive.org/download/mame-sl/mame-sl/nes.zip/nes/";;
*"/nes/ADE MAME/"*) core="mame_libretro nes -cart"; src="https://archive.org/download/mame-sl/mame-sl/nes_ade.zip/nes_ade/";;
*"/nes/NTB MAME/"*) core="mame_libretro nes -cart1 nes:nantbb -cart2"; src="https://archive.org/download/mame-sl/mame-sl/nes_ntbrom.zip/nes_ntbrom/";;
*"/famicom/Cass MAME/"*) core="mame_libretro famicom famibs30 -cass"; src="https://archive.org/download/mame-sl/mame-sl/famicom_cass.zip/famicom_cass/";;
*"/fds/Disk System NoIntro/"*) core="nestopia_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Family%20Computer%20Disk%20System%20%28FDS%29.zip/";;
*"/fds/Disk System TOSEC/"*) core="nestopia_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Famicom%20Disk%20System/Games/%5BFDS%5D/Nintendo%20Famicom%20Disk%20System%20-%20Games%20-%20%5BFDS%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/fds/Demo/"*) core="nestopia_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Famicom%20Disk%20System/Demos/Nintendo%20Famicom%20Disk%20System%20-%20Demos%20%28TOSEC-v2018-03-08%29.zip/";;
*"/fds/Edu/"*) core="nestopia_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Famicom%20Disk%20System/Educational/Nintendo%20Famicom%20Disk%20System%20-%20Educational%20%28TOSEC-v2018-03-08%29.zip/";;
*"/fds/Disk System MAME/"*) core="mame_libretro fds -flop"; src="https://archive.org/download/mame-sl/mame-sl/famicom_flop.zip/famicom_flop/";;
*"/snes/NoIntro/"*) core="snes9x_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System.zip/";;
*"/snes/TOSEC/"*) core="snes9x_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Super%20Famicom%20%26%20Super%20Entertainment%20System/Games/Nintendo%20Super%20Famicom%20%26%20Super%20Entertainment%20System%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/snes/Demo/"*) core="snes9x_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Super%20Famicom%20%26%20Super%20Entertainment%20System/Demos/Nintendo%20Super%20Famicom%20%26%20Super%20Entertainment%20System%20-%20Demos%20%28TOSEC-v2025-01-15%29.zip/";;
*"/snes/Edu/"*) core="snes9x_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Super%20Famicom%20%26%20Super%20Entertainment%20System/Educational/Nintendo%20Super%20Famicom%20%26%20Super%20Entertainment%20System%20-%20Educational%20%28TOSEC-v2011-08-13%29.zip/";;
*"/snes/MAME/"*) core="mame_libretro snes -cart"; src="https://archive.org/download/mame-sl/mame-sl/snes.zip/snes/";;
*"/snes/ST MAME/"*) core="mame_libretro snes -cart1 snes:sufami -cart2"; src="https://archive.org/download/mame-sl/mame-sl/snes_strom.zip/snes_strom/";;
*"/snes/BS-X MAME/"*) core="mame_libretro snes -cart"; src="https://archive.org/download/mame-sl/mame-sl/snes_bspack.zip/snes_bspack/";;
*"/snes-msu1/SNES MSU-1/"*) core="snes9x_libretro"; src="https://archive.org/download/snes-msu-1-games/";;
*"/satellaview/NoIntro/"*) core="snes9x_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Satellaview.zip/";;
*"/sufami/NoIntro/"*) core="snes9x_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Sufami%20Turbo.zip/";;
*"/sufami/TOSEC/"*) core="snes9x_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Sufami%20Turbo/Games/Nintendo%20Sufami%20Turbo%20-%20Games%20%28TOSEC-v2021-12-11%29.zip/";;
*"/sgb/NoIntro/"*) core="mesen-s_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Game%20Boy.zip/";;
*"/sgb/TOSEC/"*) core="mesen-s_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy/Games/Nintendo%20Game%20Boy%20-%20Games%20%28TOSEC-v2024-07-03%29.zip/";;
*"/sgb/Demo/"*) core="mesen-s_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy/Demos/Nintendo%20Game%20Boy%20-%20Demos%20%28TOSEC-v2025-01-15%29.zip/";;
*"/sgb/Edu/"*) core="mesen-s_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy/Educational/Nintendo%20Game%20Boy%20-%20Educational%20%28TOSEC-v2022-12-21%29.zip/";;
*"/sgb/MAME/"*) core="mame_libretro supergb -cart"; src="https://archive.org/download/mame-sl/mame-sl/gameboy.zip/gameboy/";;
*"/n64/NoIntro/"*) core="mupen64plus_next_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Nintendo%2064%20%28ByteSwapped%29.zip/";;
*"/n64/TOSEC/"*) core="mupen64plus_next_libretro"; src="https://archive.org/download/tosec-main/Nintendo/64/Games/Nintendo%2064%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/n64/Demo/"*) core="mupen64plus_next_libretro"; src="https://archive.org/download/tosec-main/Nintendo/64/Demos/Nintendo%2064%20-%20Demos%20%28TOSEC-v2025-01-15%29.zip/";;
*"/n64/Edu/"*) core="mupen64plus_next_libretro"; src="https://archive.org/download/tosec-main/Nintendo/64/Educational/Nintendo%2064%20-%20Educational%20%28TOSEC-v2011-08-13%29.zip/";;
*"/n64/MAME/"*) core="mame_libretro n64 -cart"; src="https://archive.org/download/mame-sl/mame-sl/n64.zip/n64/";;
*"/n64/NoIntro BigEndian/"*) core="mupen64plus_next_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Nintendo%2064%20%28BigEndian%29.zip/";;
*"/n64dd/MAME/"*) core="mame_libretro n64dd -hard"; src="https://archive.org/download/mame-sl/mame-sl/n64dd.zip/n64dd/";;
*"/n64dd/Games NDD/"*) core="mame_libretro n64dd -hard"; src="https://archive.org/download/tosec-main/Nintendo/64DD/Games/%5BNDD%5D/Nintendo%2064DD%20-%20Games%20-%20%5BNDD%5D%20%28TOSEC-v2021-07-25%29.zip/";;
*"/gamecube/ISO/"*) core="dolphin_libretro"; ext="iso"; src="https://archive.org/download/gamecubecollectionbyblopez/";;
*"/wii/Redump/"*) core="dolphin_libretro"; src="https://archive.org/download/redumpwiipalrvz/";;
*"/pokemini/NoIntro/"*) core="pokemini_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Pokemon%20Mini.zip/";;
*"/pokemini/TOSEC/"*) core="pokemini_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Pokemon%20Mini/Games/Nintendo%20Pokemon%20Mini%20-%20Games%20%28TOSEC-v2022-06-08%29.zip/";;
*"/pokemini/MAME/"*) core="mame_libretro pokemini -cart"; src="https://archive.org/download/mame-sl/mame-sl/pokemini.zip/pokemini/";;
*"/virtualboy/NoIntro/"*) core="mednafen_vb_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Virtual%20Boy.zip/";;
*"/virtualboy/TOSEC/"*) core="mednafen_vb_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Virtual%20Boy/Games/Nintendo%20Virtual%20Boy%20-%20Games%20%28TOSEC-v2022-06-08%29.zip/";;
*"/virtualboy/Demo/"*) core="mednafen_vb_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Virtual%20Boy/Demos/Nintendo%20Virtual%20Boy%20-%20Demos%20%28TOSEC-v2012-04-13%29.zip/";;
*"/virtualboy/MAME/"*) core="mame_libretro vboy -cart"; src="https://archive.org/download/mame-sl/mame-sl/vboy.zip/vboy/";;
*"/gb/NoIntro/"*) core="sameboy_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Game%20Boy.zip/";;
*"/gb/TOSEC/"*) core="sameboy_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy/Games/Nintendo%20Game%20Boy%20-%20Games%20%28TOSEC-v2024-07-03%29.zip/";;
*"/gb/Demo/"*) core="sameboy_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy/Demos/Nintendo%20Game%20Boy%20-%20Demos%20%28TOSEC-v2025-01-15%29.zip/";;
*"/gb/Edu/"*) core="sameboy_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy/Educational/Nintendo%20Game%20Boy%20-%20Educational%20%28TOSEC-v2022-12-21%29.zip/";;
*"/gb/MAME/"*) core="mame_libretro gameboy -cart"; src="https://archive.org/download/mame-sl/mame-sl/gameboy.zip/gameboy/";;
*"/gbc/NoIntro/"*) core="sameboy_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Game%20Boy%20Color.zip/";;
*"/gbc/Games GBC/"*) core="sameboy_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy%20Color/Games/%5BGBC%5D/Nintendo%20Game%20Boy%20Color%20-%20Games%20-%20%5BGBC%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/gbc/Games GBX/"*) core="sameboy_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy%20Color/Games/%5BGBX%5D/Nintendo%20Game%20Boy%20Color%20-%20Games%20-%20%5BGBX%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/gbc/Demo/"*) core="sameboy_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy%20Color/Demos/Nintendo%20Game%20Boy%20Color%20-%20Demos%20%28TOSEC-v2025-01-15%29.zip/";;
*"/gbc/MAME/"*) core="mame_libretro gbcolor -cart"; src="https://archive.org/download/mame-sl/mame-sl/gbcolor.zip/gbcolor/";;
*"/gba/NoIntro/"*) core="mgba_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Game%20Boy%20Advance.zip/";;
*"/gba/TOSEC/"*) core="mgba_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy%20Advance/Games/Nintendo%20Game%20Boy%20Advance%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/gba/Demo/"*) core="mgba_libretro"; src="https://archive.org/download/tosec-main/Nintendo/Game%20Boy%20Advance/Demos/Nintendo%20Game%20Boy%20Advance%20-%20Demos%20%28TOSEC-v2025-01-15%29.zip/";;
*"/gba/MAME/"*) core="mame_libretro gba -cart"; src="https://archive.org/download/mame-sl/mame-sl/gba.zip/gba/";;
*"/gba/e-Reader MAME/"*) core="mame_libretro gba -cart"; src="https://archive.org/download/mame-sl/mame-sl/gba_ereader.zip/gba_ereader/";;
*"/gba/NoIntro Video/"*) core="mgba_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Game%20Boy%20Advance%20%28Video%29.zip/";;
*"/nds/DS NoIntro/"*) core="melonds_libretro"; src="https://archive.org/download/ni-n-ds-dec_202401/";;
*"/nds/DS Download/"*) core="melonds_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Nintendo%20DS%20%28Download%20Play%29.zip/";;
*"/nds/DS TOSEC/"*) core="melonds_libretro"; src="https://archive.org/download/tosec-main/Nintendo/DS/Games/Nintendo%20DS%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/nds/Demo/"*) core="melonds_libretro"; src="https://archive.org/download/tosec-main/Nintendo/DS/Demos/Nintendo%20DS%20-%20Demos%20%28TOSEC-v2025-01-15%29.zip/";;
*"/nds/Edu/"*) core="melonds_libretro"; src="https://archive.org/download/tosec-main/Nintendo/DS/Educational/Nintendo%20DS%20-%20Educational%20%28TOSEC-v2021-07-22%29.zip/";;
*"/dsi/NoIntro/"*) core="melondsds_libretro"; src="https://archive.org/download/ni-roms/roms/Nintendo%20-%20Nintendo%20DSi%20%28Decrypted%29.zip/";;
*"/dsi/TOSEC/"*) core="melondsds_libretro"; src="https://archive.org/download/tosec-main/Nintendo/DSi/Games/Nintendo%20DSi%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/3ds/NoIntro/"*) core="citra_libretro"; ext="3ds"; src="https://archive.org/download/nintendo-nintendo-3ds-games-decrypted/Nintendo%20-%20Nintendo%203DS/";;
*"/wiiu/Redump/"*) core="cemu -g"; src="https://archive.org/download/wii-u-retail-nus-usa/";;
*"/svmu/TOSEC/"*) core="mame_libretro svmu -quik"; src="https://archive.org/download/tosec-main/Sega/Visual%20Memory%20System/Games/Sega%20Visual%20Memory%20System%20-%20Games%20%28TOSEC-v2023-08-29%29.zip/";;
*"/svmu/Demo/"*) core="mame_libretro svmu -quik"; src="https://archive.org/download/tosec-main/Sega/Visual%20Memory%20System/Demos/Sega%20Visual%20Memory%20System%20-%20Demos%20%28TOSEC-v2023-08-29%29.zip/";;
*"/svmu/MAME/"*) core="mame_libretro svmu -quik"; src="https://archive.org/download/mame-sl/mame-sl/svmu.zip/svmu/";;
*"/sg1000/NoIntro/"*) core="gearsystem_libretro"; src="https://archive.org/download/ni-roms/roms/Sega%20-%20SG-1000.zip/";;
*"/sg1000/TOSEC/"*) core="gearsystem_libretro"; src="https://archive.org/download/tosec-main/Sega/Game%201000/Games/Sega%20Game%201000%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/sg1000/Demo [BIN]/"*) core="gearsystem_libretro"; src="https://archive.org/download/tosec-main/Sega/Game%201000/Demos/%5BBIN%5D/Sega%20Game%201000%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/sg1000/MAME/"*) core="mame_libretro sg1000 -cart"; src="https://archive.org/download/mame-sl/mame-sl/sg1000.zip/sg1000/";;
*"/sc3000/App/"*) core="mame_libretro sc3000 -cart"; src="https://archive.org/download/tosec-main/Sega/Computer%203000/Applications/Sega%20Computer%203000%20-%20Applications%20%28TOSEC-v2011-11-01%29.zip/";;
*"/sc3000/Edu/"*) core="mame_libretro sc3000 -cart"; src="https://archive.org/download/tosec-main/Sega/Computer%203000/Educational/Sega%20Computer%203000%20-%20Educational%20%28TOSEC-v2011-11-01%29.zip/";;
*"/sc3000/WAV/"*) core="mame_libretro sc3000 -autoboot_command 'LOAD\n' -autoboot_delay 5 -cass"; src="https://archive.org/download/tosec-main/Sega/Computer%203000/Games/%5BROM%5D/Sega%20Computer%203000%20-%20Games%20-%20%5BROM%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/sc3000/Cart MAME/"*) core="mame_libretro sc3000 -cart"; src="https://archive.org/download/mame-sl/mame-sl/sc3000_cart.zip/sc3000_cart/";;
*"/sc3000/Cass MAME/"*) core="mame_libretro sc3000 -autoboot_command 'LOAD\n' -autoboot_delay 5 -cass"; src="https://archive.org/download/mame-sl/mame-sl/sc3000_cass.zip/sc3000_cass/";;
*"/sc3000/Flop MAME/"*) core="mame_libretro sf7000 -flop"; src="https://archive.org/download/mame-sl/mame-sl/sf7000.zip/sf7000/";;
*"/segaai/MAME/"*) core="mame_libretro segaai -card"; src="https://archive.org/download/mame-sl/mame-sl/segaai.zip/segaai/";;
*"/mastersystem/NoIntro/"*) core="gearsystem_libretro"; src="https://archive.org/download/ni-roms/roms/Sega%20-%20Master%20System%20-%20Mark%20III.zip/";;
*"/mastersystem/TOSEC/"*) core="gearsystem_libretro"; src="https://archive.org/download/tosec-main/Sega/Mark%20III%20%26%20Master%20System/Games/Sega%20Mark%20III%20%26%20Master%20System%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/mastersystem/Demo/"*) core="gearsystem_libretro"; src="https://archive.org/download/tosec-main/Sega/Mark%20III%20%26%20Master%20System/Demos/Sega%20Mark%20III%20%26%20Master%20System%20-%20Demos%20%28TOSEC-v2025-01-15%29.zip/";;
*"/mastersystem/Edu/"*) core="gearsystem_libretro"; src="https://archive.org/download/tosec-main/Sega/Mark%20III%20%26%20Master%20System/Educational/Sega%20Mark%20III%20%26%20Master%20System%20-%20Educational%20%28TOSEC-v2010-12-22%29.zip/";;
*"/mastersystem/MAME/"*) core="mame_libretro sms -cart"; src="https://archive.org/download/mame-sl/mame-sl/sms.zip/sms/";;
*"/megadrive/NoIntro/"*) core="genesis_plus_gx_libretro"; src="https://archive.org/download/ni-roms/roms/Sega%20-%20Mega%20Drive%20-%20Genesis.zip/";;
*"/megadrive/TOSEC/"*) core="genesis_plus_gx_libretro"; src="https://archive.org/download/tosec-main/Sega/Mega%20Drive%20%26%20Genesis/Games/%5BBIN%5D/Sega%20Mega%20Drive%20%26%20Genesis%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/megadrive/Demo/"*) core="genesis_plus_gx_libretro"; src="https://archive.org/download/tosec-main/Sega/Mega%20Drive%20%26%20Genesis/Demos/Sega%20Mega%20Drive%20%26%20Genesis%20-%20Demos%20%28TOSEC-v2024-07-03%29.zip/";;
*"/megadrive/Edu/"*) core="genesis_plus_gx_libretro"; src="https://archive.org/download/tosec-main/Sega/Mega%20Drive%20%26%20Genesis/Educational/Sega%20Mega%20Drive%20%26%20Genesis%20-%20Educational%20%28TOSEC-v2020-07-12%29.zip/";;
*"/megadrive/MAME/"*) core="mame_libretro megadriv -cart"; src="https://archive.org/download/mame-sl/mame-sl/megadriv.zip/megadriv/";;
*"/megadrive/Mega-Tech MAME/"*) core="mame_libretro megatech -cart"; src="https://archive.org/download/mame-sl/mame-sl/megatech.zip/megatech/";;
*"/megadrive-msu/Sega MSU-MD/"*) core="genesis_plus_gx_libretro"; ext="md"; src="https://archive.org/download/SegaMD-Enhanced-ROMs/ROMs/Sega%20-%20Mega%20Drive%20-%20MSU-MD/";;
*"/pico/NoIntro/"*) core="picodrive_libretro"; src="https://archive.org/download/ni-roms/roms/Sega%20-%20PICO.zip/";;
*"/pico/TOSEC/"*) core="picodrive_libretro"; src="https://archive.org/download/tosec-main/Sega/Pico/Educational/Sega%20Pico%20-%20Educational%20%28TOSEC-v2017-10-22%29.zip/";;
*"/pico/MAME/"*) core="mame_libretro pico -cart"; src="https://archive.org/download/mame-sl/mame-sl/pico.zip/pico/";;
*"/beena/NoIntro/"*) core="mame_libretro beena -cart"; src="https://archive.org/download/ni-roms/roms/Sega%20-%20Beena.zip/";;
*"/beena/TOSEC/"*) core="mame_libretro beena -cart"; src="https://archive.org/download/tosec-main/Sega/Advanced%20Pico%20Beena/Educational/Sega%20Advanced%20Pico%20Beena%20-%20Educational%20%28TOSEC-v2021-07-25%29.zip/";;
*"/beena/MAME/"*) core="mame_libretro beena -cart"; src="https://archive.org/download/mame-sl/mame-sl/sega_beena_cart.zip/sega_beena_cart/";;
*"/sega32x/NoIntro/"*) core="picodrive_libretro"; src="https://archive.org/download/ni-roms/roms/Sega%20-%2032X.zip/";;
*"/sega32x/TOSEC/"*) core="picodrive_libretro"; src="https://archive.org/download/tosec-main/Sega/32X/Games/Sega%2032X%20-%20Games%20%28TOSEC-v2024-07-03%29.zip/";;
*"/sega32x/Demo/"*) core="picodrive_libretro"; src="https://archive.org/download/tosec-main/Sega/32X/Demos/Sega%2032X%20-%20Demos%20%28TOSEC-v2022-06-08%29.zip/";;
*"/sega32x/MAME/"*) core="mame_libretro 32x -cart"; src="https://archive.org/download/mame-sl/mame-sl/32x.zip/32x/";;
*"/megacd/Redump/"*) core="picodrive_libretro"; ext="cue"; src="https://archive.org/download/sega-mega-cd-sega-cd-redump/";;
*"/megacd/NonRedump/"*) core="picodrive_libretro"; ext="cue"; src="https://archive.org/download/non-redump_sega-mega-cd_sega-cd/";;
*"/saturn/Redump/"*) core="yabasanshiro_libretro"; ext="cue"; src="https://archive.org/download/redump.sega_saturn/";;
*"/saturn/NonRedump/"*) core="yabasanshiro_libretro"; ext="cue"; src="https://archive.org/download/non-redump_sega-saturn/";;
*"/stv/MAME/"*) core="mame_libretro stvbios"; src="https://archive.org/download/mame-sl/mame-sl/stv.zip/stv/";;
*"/dreamcast/Redump/"*) core="flycast_libretro"; ext="cue"; src="https://archive.org/download/sega-dreamcast-redump/";;
*"/dreamcast/NonRedump/"*) core="flycast_libretro"; ext="gdi"; src="https://archive.org/download/non-redump_sega-dreamcast/";;
*"/dreamcast/US/"*) core="flycast_libretro"; ext="gdi"; src="https://archive.org/download/tosec-iso-sega/Dreamcast/Games/US/";;
*"/dreamcast/PAL/"*) core="flycast_libretro"; ext="gdi"; src="https://archive.org/download/tosec-iso-sega/Dreamcast/Games/PAL/";;
*"/dreamcast/JP/"*) core="flycast_libretro"; ext="gdi"; src="https://archive.org/download/tosec-iso-sega/Dreamcast/Games/JP/";;
*"/model2/Sega Model 2/"*) core="mame_libretro"; src="https://archive.org/download/m2emu1.1a/Sega%20Model%202%20Emu%201.1a%20and%20Full%20Romset/Model%202%20Romset%20%28Merged%29/";;
*"/model3/Sega Model 3/"*) core="mame_libretro"; src="https://archive.org/download/segamodel3/ROMs/";;
*"/gamegear/NoIntro/"*) core="gearsystem_libretro"; src="https://archive.org/download/ni-roms/roms/Sega%20-%20Game%20Gear.zip/";;
*"/gamegear/TOSEC/"*) core="gearsystem_libretro"; src="https://archive.org/download/tosec-main/Sega/Game%20Gear/Games/Sega%20Game%20Gear%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/gamegear/Demo/"*) core="gearsystem_libretro"; src="https://archive.org/download/tosec-main/Sega/Game%20Gear/Demos/Sega%20Game%20Gear%20-%20Demos%20%28TOSEC-v2024-01-15%29.zip/";;
*"/gamegear/MAME/"*) core="mame_libretro gamegear -cart"; src="https://archive.org/download/mame-sl/mame-sl/gamegear.zip/gamegear/";;
*"/pockstat/TOSEC/"*) core="mame_libretro pockstat -cart"; src="https://archive.org/download/tosec-main/Sony/PocketStation/Various/Sony%20PocketStation%20-%20Various%20%28TOSEC-v2014-05-29%29.zip/";;
*"/smc777/MAME/"*) core="mame_libretro smc777 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/smc777.zip/smc777/";;
*"/psx/CHD EUR/"*) core="pcsx_rearmed_libretro"; src="https://archive.org/download/PS1_EU_CHD_Arquivista/";;
*"/psx/CHD JAP/"*) core="pcsx_rearmed_libretro"; src="https://archive.org/download/PS1_JP_CHD_Arquivista/";;
*"/psx/CHD USA/"*) core="pcsx_rearmed_libretro"; src="https://archive.org/download/PS1_US_CHD_Arquivista/";;
*"/psx/NonRedump/"*) core="pcsx_rearmed_libretro"; ext="cue"; src="https://archive.org/download/non-redump_sony_playstation/";;
*"/ps2/CHD 1/"*) core="pcsx2_libretro"; src="https://archive.org/download/PS2-part1-CHD-Arquivista/";;
*"/ps2/CHD 2/"*) core="pcsx2_libretro"; src="https://archive.org/download/PS2-part2-CHD-Arquivista/";;
*"/ps2/CHD 3/"*) core="pcsx2_libretro"; src="https://archive.org/download/PS2-part3-CHD-Arquivista/";;
*"/ps2/NonRedump A-G/"*) core="pcsx2_libretro"; ext="iso"; src="https://archive.org/download/non-redump_sony_playstation2_part1/";;
*"/ps2/NonRedump H-Q/"*) core="pcsx2_libretro"; ext="iso"; src="https://archive.org/download/non-redump_sony_playstation2_part2/";;
*"/ps2/NonRedump R-Z/"*) core="pcsx2_libretro"; ext="iso"; src="https://archive.org/download/non-redump_sony_playstation2_part3/";;
*"/psp/Redump/"*) core="ppsspp_libretro"; ext="iso"; src="https://archive.org/download/playstation-portable-redump/";;
*"/psp/NonRedump/"*) core="ppsspp_libretro"; ext="iso"; src="https://archive.org/download/non-redump_sony_playstation_portable/";;
*"/psp/TOSEC/"*) core="ppsspp_libretro"; ext="iso"; src="https://archive.org/download/tosec-iso-sony/PlayStation%20Portable/Games/%5BISO%5D/";;
*"/dos/eXoDOS/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/exodos-full/eXoDOS/eXo/eXoDOS/";;
*"/dos/TOSEC/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/tosec-main/IBM/PC%20Compatibles/Compilations/Games/%5BIMG%5D/IBM%20PC%20Compatibles%20-%20Compilations%20-%20Games%20-%20%5BIMG%5D%20%28TOSEC-v2024-04-20%29.zip/";;
*"/dos/App TOSEC/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/tosec-main/IBM/PC%20Compatibles/Applications/Addons%20%26%20Patches/IBM%20PC%20Compatibles%20-%20Applications%20-%20Addons%20%26%20Patches%20%28TOSEC-v2023-11-07%29.zip/";;
*"/dos/Edu [IMG]/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/tosec-main/IBM/PC%20Compatibles/Educational/%5BIMG%5D/IBM%20PC%20Compatibles%20-%20Educational%20-%20%5BIMG%5D%20%28TOSEC-v2024-04-20%29.zip/";;
*"/dos/Edu [RAW]/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/tosec-main/IBM/PC%20Compatibles/Educational/%5BRAW%5D/IBM%20PC%20Compatibles%20-%20Educational%20-%20%5BRAW%5D%20%28TOSEC-v2022-12-21%29.zip/";;
*"/dos/Edu [SCP]/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/tosec-main/IBM/PC%20Compatibles/Educational/%5BSCP%5D/IBM%20PC%20Compatibles%20-%20Educational%20-%20%5BSCP%5D%20%28TOSEC-v2023-11-07%29.zip/";;
*"/dos/Edu [TD0]/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/tosec-main/IBM/PC%20Compatibles/Educational/%5BTD0%5D/IBM%20PC%20Compatibles%20-%20Educational%20-%20%5BTD0%5D%20%28TOSEC-v2023-11-07%29.zip/";;
*"/dos/TOSEC-ISO/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/tosec-iso-ibm/PC%20Compatibles/CD/Games/%5BISO%5D/";;
*"/dos/TDC 1982/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/1982/";;
*"/dos/TDC 1983/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/1983/";;
*"/dos/TDC 1985/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/1985/";;
*"/dos/TDC 1988/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/1988/";;
*"/dos/TDC 1990/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/1990/";;
*"/dos/TDC 1991/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/1991/";;
*"/dos/TDC 1994/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/total_dos_collection/TDC/Games/Files/1994/";;
*"/dos/TDC 1995/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/total_dos_collection/TDC/Games/Files/1995/";;
*"/dos/TDC 1996/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/total_dos_collection/TDC/Games/Files/1996/";;
*"/dos/TDC 1997/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/total_dos_collection/TDC/Games/Files/1997/";;
*"/dos/TDC 1998/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/total_dos_collection/TDC/Games/Files/1998/";;
*"/dos/TDC 1999/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/1999/";;
*"/dos/TDC 199x/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/199x/";;
*"/dos/TDC 2002/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/2002/";;
*"/dos/TDC 2003/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/2003/";;
*"/dos/TDC 2008/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/2008/";;
*"/dos/TDC 2009/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/2009/";;
*"/dos/TDC 2011/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/2011/";;
*"/dos/TDC 2014/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/2014/";;
*"/dos/TDC 2015/"*) core="dosbox_pure_libretro"; src="https://archive.org/download/Total_DOS_Collection_Release_16_March_2019/Games/Files/2015/";;
*"/ibm5150/MAME/"*) core="mame_libretro ibm5150 -hard1 ibm5150_hdd:freedos13_8086"; src="https://archive.org/download/mame-sl/mame-sl/ibm5150.zip/ibm5150/";;
*"/ibm5170/MAME/"*) core="mame_libretro ibm5170 -hard1 ibm5170_hdd:freedos13"; src="https://archive.org/download/mame-sl/mame-sl/ibm5170.zip/ibm5170/";;
*"/ibm5170/CDROM CHD/"*) core="mame_libretro ibm5170 -cdrom"; src="https://archive.org/download/mame-software-list-chds-2/ibm5170_cdrom/";;
*"/ibm5170/CDROM MAME/"*) core="mame_libretro ibm5170 -cdrom"; src="https://archive.org/download/mame-sl/mame-sl/ibm5170_cdrom.zip/ibm5170_cdrom/";;
*"/ibm5170/HDD CHD/"*) core="mame_libretro ibm5170 -hard"; src="https://archive.org/download/mame-software-list-chds-2/ibm5170_hdd/";;
*"/ibmpcjr/Cart MAME/"*) core="mame_libretro ibmpcjr"; src="https://archive.org/download/mame-sl/mame-sl/ibmpcjr_cart.zip/ibmpcjr_cart/";;
*"/ibmpcjr/Flop MAME/"*) core="mame_libretro ibmpcjr -hard1 ibm5150_hdd:freedos13_8086"; src="https://archive.org/download/mame-sl/mame-sl/ibmpcjr_flop.zip/ibmpcjr_flop/";;
*"/msx1/NoIntro/"*) core="bluemsx_libretro"; src="https://archive.org/download/ni-roms/roms/Microsoft%20-%20MSX.zip/";;
*"/msx1/Games CAS/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Games/%5BCAS%5D/MSX%20MSX%20-%20Games%20-%20%5BCAS%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/msx1/Games DSK/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Games/%5BDSK%5D/MSX%20MSX%20-%20Games%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/msx1/Games ROM/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Games/%5BROM%5D/MSX%20MSX%20-%20Games%20-%20%5BROM%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/msx1/Games WV/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Games/%5BWV%5D/MSX%20MSX%20-%20Games%20-%20%5BWV%5D%20%28TOSEC-v2022-12-21%29.zip/";;
*"/msx1/Demo [CAS]/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Demos/%5BCAS%5D/MSX%20MSX%20-%20Demos%20-%20%5BCAS%5D%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msx1/Demo [DSK]/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Demos/%5BDSK%5D/MSX%20MSX%20-%20Demos%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/msx1/Demo [ROM]/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Demos/%5BROM%5D/MSX%20MSX%20-%20Demos%20-%20%5BROM%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/msx1/Edu [CAS]/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Educational/%5BCAS%5D/MSX%20MSX%20-%20Educational%20-%20%5BCAS%5D%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msx1/Edu [DSK]/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Educational/%5BDSK%5D/MSX%20MSX%20-%20Educational%20-%20%5BDSK%5D%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msx1/Edu [ROM]/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX/Educational/%5BROM%5D/MSX%20MSX%20-%20Educational%20-%20%5BROM%5D%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msx1/Cart MAME/"*) core="mame_libretro expert11 -cart1"; src="https://archive.org/download/mame-sl/mame-sl/msx1_cart.zip/msx1_cart/";;
*"/msx1/Cass MAME/"*) core="mame_libretro expert11 -autoboot_command 'RUN\"CAS:\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/msx1_cass.zip/msx1_cass/";;
*"/msx1/Flop MAME/"*) core="mame_libretro svi738 -flop"; src="https://archive.org/download/mame-sl/mame-sl/msx1_flop.zip/msx1_flop/";;
*"/msx1/Flop 5.25 MAME/"*) core="mame_libretro svi738 -flop"; src="https://archive.org/download/mame-sl/mame-sl/msx1_flop_525.zip/msx1_flop_525/";;
*"/msx2/NoIntro/"*) core="bluemsx_libretro"; src="https://archive.org/download/ni-roms/roms/Microsoft%20-%20MSX2.zip/";;
*"/msx2/Games/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX2/Games/%5BCAS%5D/MSX%20MSX2%20-%20Games%20-%20%5BCAS%5D%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msx2/Demo [COM]/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX2/Demos/%5BCOM%5D/MSX%20MSX2%20-%20Demos%20-%20%5BCOM%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/msx2/Demo [DSK]/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX2/Demos/%5BDSK%5D/MSX%20MSX2%20-%20Demos%20-%20%5BDSK%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/msx2/Edu/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX2/Educational/MSX%20MSX2%20-%20Educational%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msx2/Cart MAME/"*) core="mame_libretro hbf1xd -cart1"; src="https://archive.org/download/mame-sl/mame-sl/msx2_cart.zip/msx2_cart/";;
*"/msx2/Flop MAME/"*) core="mame_libretro hbf1xd -flop"; src="https://archive.org/download/mame-sl/mame-sl/msx2_flop.zip/msx2_flop/";;
*"/msx2/Cass MAME/"*) core="mame_libretro hbf1xd -autoboot_command 'RUN\"CAS:\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/msx2_cass.zip/msx2_cass/";;
*"/msx2+/TOSEC/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX2%2B/Games/MSX%20MSX2%2B%20-%20Games%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msx2+/Demo/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/MSX2%2B/Demos/MSX%20MSX2%2B%20-%20Demos%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msx2+/Cart MAME/"*) core="mame_libretro fsa1wsx -cart1"; src="https://archive.org/download/mame-sl/mame-sl/msx2p_cart.zip/msx2p_cart/";;
*"/msx2+/Flop MAME/"*) core="mame_libretro fsa1wsx -flop"; src="https://archive.org/download/mame-sl/mame-sl/msx2p_flop.zip/msx2p_flop/";;
*"/msxturbor/MSX TurboR/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/TurboR/Games/MSX%20TurboR%20-%20Games%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msxturbor/Demo/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/MSX/TurboR/Demos/MSX%20TurboR%20-%20Demos%20%28TOSEC-v2012-04-15%29.zip/";;
*"/msxturbor/Flop MAME/"*) core="mame_libretro fsa1gt -flop1"; src="https://archive.org/download/mame-sl/mame-sl/msxr_flop.zip/msxr_flop/";;
*"/msxturbor/Cart MAME/"*) core="mame_libretro fsa1gt -cart1"; src="https://archive.org/download/mame-sl/mame-sl/msxr_cart.zip/msxr_cart/";;
*"/studio2/MAME/"*) core="mame_libretro studio2 -cart"; src="https://archive.org/download/mame-sl/mame-sl/studio2.zip/studio2/";;
*"/channelf/NoIntro/"*) core="freechaf_libretro"; src="https://archive.org/download/ni-roms/roms/Fairchild%20-%20Channel%20F.zip/";;
*"/channelf/Games/"*) core="freechaf_libretro"; src="https://archive.org/download/tosec-main/Fairchild/VES%20%26%20Channel%20F/Games/Fairchild%20VES%20%26%20Channel%20F%20-%20Games%20%28TOSEC-v2023-10-03%29.zip/";;
*"/channelf/Demo/"*) core="freechaf_libretro"; src="https://archive.org/download/tosec-main/Fairchild/VES%20%26%20Channel%20F/Demos/Fairchild%20VES%20%26%20Channel%20F%20-%20Demos%20%28TOSEC-v2023-10-03%29.zip/";;
*"/channelf/MAME/"*) core="mame_libretro channelf -cart"; src="https://archive.org/download/mame-sl/mame-sl/channelf.zip/channelf/";;
*"/vectrex/NoIntro/"*) core="vecx_libretro"; src="https://archive.org/download/ni-roms/roms/GCE%20-%20Vectrex.zip/";;
*"/vectrex/TOSEC/"*) core="vecx_libretro"; src="https://archive.org/download/tosec-main/GCE/Vectrex/Games/GCE%20Vectrex%20-%20Games%20%28TOSEC-v2023-10-03%29.zip/";;
*"/vectrex/Demo Music/"*) core="vecx_libretro"; src="https://archive.org/download/tosec-main/GCE/Vectrex/Demos/Music/GCE%20Vectrex%20-%20Demos%20-%20Music%20%28TOSEC-v2012-02-27%29.zip/";;
*"/vectrex/Demo Slideshows/"*) core="vecx_libretro"; src="https://archive.org/download/tosec-main/GCE/Vectrex/Demos/Slideshows/GCE%20Vectrex%20-%20Demos%20-%20Slideshows%20%28TOSEC-v2012-02-27%29.zip/";;
*"/vectrex/Demo Various/"*) core="vecx_libretro"; src="https://archive.org/download/tosec-main/GCE/Vectrex/Demos/Various/GCE%20Vectrex%20-%20Demos%20-%20Various%20%28TOSEC-v2025-01-15%29.zip/";;
*"/vectrex/MAME/"*) core="mame_libretro vectrex -cart"; src="https://archive.org/download/mame-sl/mame-sl/vectrex.zip/vectrex/";;
*"/odyssey2/NoIntro/"*) core="o2em_libretro"; src="https://archive.org/download/ni-roms/roms/Magnavox%20-%20Odyssey%202.zip/";;
*"/odyssey2/TOSEC/"*) core="o2em_libretro"; src="https://archive.org/download/tosec-main/Magnavox/Odyssey2/Games/Magnavox%20Odyssey2%20-%20Games%20%28TOSEC-v2021-07-25%29.zip/";;
*"/odyssey2/Edu/"*) core="o2em_libretro"; src="https://archive.org/download/tosec-main/Magnavox/Odyssey2/Educational/Magnavox%20Odyssey2%20-%20Educational%20%28TOSEC-v2011-02-22%29.zip/";;
*"/odyssey2/MAME/"*) core="mame_libretro videopac -cart"; src="https://archive.org/download/mame-sl/mame-sl/videopac.zip/videopac/";;
*"/videopacplus/NoIntro/"*) core="o2em_libretro"; src="https://archive.org/download/ni-roms/roms/Philips%20-%20Videopac%2B.zip/";;
*"/videopacplus/TOSEC/"*) core="o2em_libretro"; src="https://archive.org/download/tosec-main/Philips/Videopac%2B/Games/Philips%20Videopac%2B%20-%20Games%20%28TOSEC-v2021-12-11%29.zip/";;
*"/videopacplus/Demo/"*) core="o2em_libretro"; src="https://archive.org/download/tosec-main/Philips/Videopac%2B/Demos/Philips%20Videopac%2B%20-%20Demos%20%28TOSEC-v2023-08-29%29.zip/";;
*"/intellivision/NoIntro/"*) core="freeintv_libretro"; src="https://archive.org/download/ni-roms/roms/Mattel%20-%20Intellivision.zip/";;
*"/intellivision/TOSEC/"*) core="freeintv_libretro"; src="https://archive.org/download/tosec-main/Mattel/Intellivision/Games/%5BBIN%5D/Mattel%20Intellivision%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2023-10-03%29.zip/";;
*"/intellivision/Demo [BIN]/"*) core="freeintv_libretro"; src="https://archive.org/download/tosec-main/Mattel/Intellivision/Demos/%5BBIN%5D/Mattel%20Intellivision%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2018-07-01%29.zip/";;
*"/intellivision/Demo [Multipart]/"*) core="freeintv_libretro"; src="https://archive.org/download/tosec-main/Mattel/Intellivision/Demos/%5BMultipart%5D/Mattel%20Intellivision%20-%20Demos%20-%20%5BMultipart%5D%20%28TOSEC-v2018-07-01%29.zip/";;
*"/intellivision/Edu/"*) core="freeintv_libretro"; src="https://archive.org/download/tosec-main/Mattel/Intellivision/Educational/Mattel%20Intellivision%20-%20Educational%20%28TOSEC-v2021-07-25%29.zip/";;
*"/intellivision/MAME/"*) core="mame_libretro intv -cart"; src="https://archive.org/download/mame-sl/mame-sl/intv.zip/intv/";;
*"/intellivision/ECS MAME/"*) core="mame_libretro intvecs -cart"; src="https://archive.org/download/mame-sl/mame-sl/intvecs.zip/intvecs/";;
*"/colecovision/NoIntro/"*) core="gearcoleco_libretro"; src="https://archive.org/download/ni-roms/roms/Coleco%20-%20ColecoVision.zip/";;
*"/colecovision/TOSEC/"*) core="gearcoleco_libretro"; src="https://archive.org/download/tosec-main/Coleco/ColecoVision/Games/Coleco%20ColecoVision%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/colecovision/Demo/"*) core="gearcoleco_libretro"; src="https://archive.org/download/tosec-main/Coleco/ColecoVision/Demos/Coleco%20ColecoVision%20-%20Demos%20%28TOSEC-v2015-05-07%29.zip/";;
*"/colecovision/Edu/"*) core="gearcoleco_libretro"; src="https://archive.org/download/tosec-main/Coleco/ColecoVision/Educational/Coleco%20ColecoVision%20-%20Educational%20%28TOSEC-v2015-05-07%29.zip/";;
*"/colecovision/MAME/"*) core="mame_libretro coleco -cart"; src="https://archive.org/download/mame-sl/mame-sl/coleco.zip/coleco/";;
*"/colecovision/Homebrew MAME/"*) core="mame_libretro coleco -cart"; src="https://archive.org/download/mame-sl/mame-sl/coleco_homebrew.zip/coleco_homebrew/";;
*"/scv/NoIntro/"*) core="emuscv_libretro"; src="https://archive.org/download/ni-roms/roms/Epoch%20-%20Super%20Cassette%20Vision.zip/";;
*"/scv/TOSEC/"*) core="emuscv_libretro"; src="https://archive.org/download/tosec-main/Epoch/Super%20Cassette%20Vision/Games/Epoch%20Super%20Cassette%20Vision%20-%20Games%20%28TOSEC-v2022-06-08%29.zip/";;
*"/scv/MAME/"*) core="mame_libretro scv -cart"; src="https://archive.org/download/mame-sl/mame-sl/scv.zip/scv/";;
*"/ctvboy/MAME/"*) core="mame_libretro ctvboy -cart"; src="https://archive.org/download/mame-sl/mame-sl/ctvboy.zip/ctvboy/";;
*"/sv8000/MAME/"*) core="mame_libretro sv8000 -cart"; src="https://archive.org/download/mame-sl/mame-sl/sv8000.zip/sv8000/";;
*"/astrocade/NoIntro/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/ni-roms/roms/Bally%20-%20Astrocade.zip/";;
*"/astrocade/TOSEC/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/tosec-main/Bally/Professional%20Arcade%20%26%20Astrocade/Compilations/Games/%5BBIN%5D/Bally%20Professional%20Arcade%20%26%20Astrocade%20-%20Compilations%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2017-09-03%29.zip/";;
*"/astrocade/Demo [BIN]/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/tosec-main/Bally/Professional%20Arcade%20%26%20Astrocade/Demos/%5BBIN%5D/Bally%20Professional%20Arcade%20%26%20Astrocade%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2017-09-03%29.zip/";;
*"/astrocade/Demo [PRG]/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/tosec-main/Bally/Professional%20Arcade%20%26%20Astrocade/Demos/%5BPRG%5D/Bally%20Professional%20Arcade%20%26%20Astrocade%20-%20Demos%20-%20%5BPRG%5D%20%28TOSEC-v2017-09-03%29.zip/";;
*"/astrocade/Demo [WAV]/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/tosec-main/Bally/Professional%20Arcade%20%26%20Astrocade/Demos/%5BWAV%5D/Bally%20Professional%20Arcade%20%26%20Astrocade%20-%20Demos%20-%20%5BWAV%5D%20%28TOSEC-v2017-09-03%29.zip/";;
*"/astrocade/Edu [BIN]/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/tosec-main/Bally/Professional%20Arcade%20%26%20Astrocade/Educational/%5BBIN%5D/Bally%20Professional%20Arcade%20%26%20Astrocade%20-%20Educational%20-%20%5BBIN%5D%20%28TOSEC-v2013-12-13%29.zip/";;
*"/astrocade/Edu [PRG]/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/tosec-main/Bally/Professional%20Arcade%20%26%20Astrocade/Educational/%5BPRG%5D/Bally%20Professional%20Arcade%20%26%20Astrocade%20-%20Educational%20-%20%5BPRG%5D%20%28TOSEC-v2017-07-25%29.zip/";;
*"/astrocade/Edu [WAV]/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/tosec-main/Bally/Professional%20Arcade%20%26%20Astrocade/Educational/%5BWAV%5D/Bally%20Professional%20Arcade%20%26%20Astrocade%20-%20Educational%20-%20%5BWAV%5D%20%28TOSEC-v2017-09-03%29.zip/";;
*"/astrocade/MAME/"*) core="mame_libretro astrocde -cart"; src="https://archive.org/download/mame-sl/mame-sl/astrocde.zip/astrocde/";;
*"/apfm1000/NoIntro/"*) core="mame_libretro apfm1000 -cart"; src="https://archive.org/download/ni-roms/roms/APF%20-%20MP-1000.zip/";;
*"/apfm1000/TOSEC/"*) core="mame_libretro apfm1000 -cart"; src="https://archive.org/download/tosec-main/APF/M-1000/Compilations/Games/APF%20M-1000%20-%20Compilations%20-%20Games%20%28TOSEC-v2018-03-08%29.zip/";;
*"/apfm1000/Demo/"*) core="mame_libretro apfm1000 -cart"; src="https://archive.org/download/tosec-main/APF/M-1000/Demos/APF%20M-1000%20-%20Demos%20%28TOSEC-v2018-03-08%29.zip/";;
*"/apfm1000/MAME/"*) core="mame_libretro apfm1000 -cart"; src="https://archive.org/download/mame-sl/mame-sl/apfm1000.zip/apfm1000/";;
*"/apfm1000/Cass MAME/"*) core="mame_libretro apfimag -cass"; src="https://archive.org/download/mame-sl/mame-sl/apfimag_cass.zip/apfimag_cass/";;
*"/crvision/NoIntro/"*) core="mame_libretro crvision -cart"; src="https://archive.org/download/ni-roms/roms/VTech%20-%20CreatiVision.zip/";;
*"/crvision/TOSEC/"*) core="mame_libretro crvision -cart"; src="https://archive.org/download/tosec-main/VTech/Laser%202001%20%26%20CreatiVision/Games/VTech%20Laser%202001%20%26%20CreatiVision%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/crvision/MAME/"*) core="mame_libretro crvision -cart"; src="https://archive.org/download/mame-sl/mame-sl/crvision.zip/crvision/";;
*"/vsmile/NoIntro/"*) core="mame_libretro vsmile -cart"; src="https://archive.org/download/ni-roms/roms/VTech%20-%20V.Smile.zip/";;
*"/vsmile/TOSEC/"*) core="mame_libretro vsmile -cart"; src="https://archive.org/download/tosec-main/VTech/V.Smile%20Motion/Games/%5BBIN%5D/VTech%20V.Smile%20Motion%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2023-05-16%29.zip/";;
*"/vsmile/MAME/"*) core="mame_libretro vsmile -cart"; src="https://archive.org/download/mame-sl/mame-sl/vsmile_cart.zip/vsmile_cart/";;
*"/vsmile/Cart MAME/"*) core="mame_libretro vsmilem -cart"; src="https://archive.org/download/mame-sl/mame-sl/vsmilem_cart.zip/vsmilem_cart/";;
*"/vsmileb/MAME/"*) core="mame_libretro vsmileb -cart"; src="https://archive.org/download/mame-sl/mame-sl/vsmileb_cart.zip/vsmileb_cart/";;
*"/arcadia/NoIntro/"*) core="mame_libretro arcadia -cart"; src="https://archive.org/download/ni-roms/roms/Emerson%20-%20Arcadia%202001.zip/";;
*"/arcadia/TOSEC/"*) core="mame_libretro arcadia -cart"; src="https://archive.org/download/tosec-main/Emerson/Arcadia%202001/Games/Emerson%20Arcadia%202001%20-%20Games%20%28TOSEC-v2011-02-22%29.zip/";;
*"/arcadia/MAME/"*) core="mame_libretro arcadia -cart"; src="https://archive.org/download/mame-sl/mame-sl/arcadia.zip/arcadia/";;
*"/hyperscan/MAME/"*) core="mame_libretro hyprscan -cdrom"; src="https://archive.org/download/mame-software-list-chds-2/hyperscan/";;
*"/supracan/NoIntro/"*) core="mame_libretro supracan -cart"; src="https://archive.org/download/ni-roms/roms/Funtech%20-%20Super%20Acan.zip/";;
*"/supracan/TOSEC/"*) core="mame_libretro supracan -cart"; src="https://archive.org/download/tosec-main/Funtech/Super%20A%27can/Games/Funtech%20Super%20A%27can%20-%20Games%20%28TOSEC-v2021-07-25%29.zip/";;
*"/supracan/MAME/"*) core="mame_libretro supracan -cart"; src="https://archive.org/download/mame-sl/mame-sl/supracan.zip/supracan/";;
*"/vc4000/NoIntro/"*) core="mame_libretro vc4000 -cart"; src="https://archive.org/download/ni-roms/roms/Interton%20-%20VC%204000.zip/";;
*"/vc4000/MAME/"*) core="mame_libretro vc4000 -cart"; src="https://archive.org/download/mame-sl/mame-sl/vc4000.zip/vc4000/";;
*"/multivision/Othello Multivision/"*) core="gearsystem_libretro"; src="https://archive.org/download/tosec-main/Tsukuda%20Original/Othello%20Multivision/Games/Tsukuda%20Original%20Othello%20Multivision%20-%20Games%20%28TOSEC-v2021-02-12%29.zip/";;
*"/vii/MAME/"*) core="mame_libretro vii -cart"; src="https://archive.org/download/mame-sl/mame-sl/vii.zip/vii/";;
*"/unichamp/MAME/"*) core="mame_libretro unichamp -cart"; src="https://archive.org/download/mame-sl/mame-sl/unichamp.zip/unichamp/";;
*"/entexsag/MAME/"*) core="mame_libretro sag -cart"; src="https://archive.org/download/mame-sl/mame-sl/entex_sag.zip/entex_sag/";;
*"/ekara/MAME/"*) core="mame_libretro ekara -cart"; src="https://archive.org/download/mame-sl/mame-sl/ekara_cart.zip/ekara_cart/";;
*"/videoart/MAME/"*) core="mame_libretro videoart -cart"; src="https://archive.org/download/mame-sl/mame-sl/videoart.zip/videoart/";;
*"/pdp1/MAME/"*) core="mame_libretro pdp1 -ptap1"; src="https://archive.org/download/mame-sl/mame-sl/pdp1_ptp.zip/pdp1_ptp/";;
*"/sol20/MAME/"*) core="mame_libretro sol20 -cass1"; src="https://archive.org/download/mame-sl/mame-sl/sol20_cass.zip/sol20_cass/";;
*"/trs80/Model III/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%20III/Games/%5BBAS%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%20III%20-%20Games%20-%20%5BBAS%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/trs80/Model 4/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Games/%5BAPP%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Games%20-%20%5BAPP%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Demo [BAS]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Demos/%5BBAS%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Demos%20-%20%5BBAS%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Demo [CMD]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Demos/%5BCMD%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Demos%20-%20%5BCMD%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Demo [DSK]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Demos/%5BDSK%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Demos%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Demo [GRA]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Demos/%5BGRA%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Demos%20-%20%5BGRA%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Edu [BAS]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Educational/%5BBAS%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Educational%20-%20%5BBAS%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Edu [CMD]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Educational/%5BCMD%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Educational%20-%20%5BCMD%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Edu [DSK]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Educational/%5BDSK%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Educational%20-%20%5BDSK%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Edu [JCL]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Educational/%5BJCL%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Educational%20-%20%5BJCL%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Edu [LST]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%204/Educational/%5BLST%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%204%20-%20Educational%20-%20%5BLST%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/trs80/Demo [BAS]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%20III/Demos/%5BBAS%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%20III%20-%20Demos%20-%20%5BBAS%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/trs80/Demo [CMD]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%20III/Demos/%5BCMD%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%20III%20-%20Demos%20-%20%5BCMD%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/trs80/Edu [BAS]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%20III/Educational/%5BBAS%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%20III%20-%20Educational%20-%20%5BBAS%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/trs80/Edu [CMD]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%20III/Educational/%5BCMD%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%20III%20-%20Educational%20-%20%5BCMD%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/trs80/Edu [DMK]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%20III/Educational/%5BDMK%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%20III%20-%20Educational%20-%20%5BDMK%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/trs80/Edu [DSK]/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Model%20III/Educational/%5BDSK%5D/Tandy%20Radio%20Shack%20TRS-80%20Model%20III%20-%20Educational%20-%20%5BDSK%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/trs80/MAME/"*) core="mame_libretro trs80m3 -quik"; src="https://archive.org/download/mame-sl/mame-sl/trs80_quik.zip/trs80_quik/";;
*"/trs80/Cass MAME/"*) core="mame_libretro trs80m3 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/mame-sl/mame-sl/trs80_cass.zip/trs80_cass/";;
*"/trs80/Flop MAME/"*) core="mame_libretro trs80m3 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/trs80_flop.zip/trs80_flop/";;
*"/trs80/Model II MAME/"*) core="mame_libretro trs80m2 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/trs80m2.zip/trs80m2/";;
*"/sorcerer/Cart MAME/"*) core="mame_libretro sorcerer -cart"; src="https://archive.org/download/mame-sl/mame-sl/sorcerer_cart.zip/sorcerer_cart/";;
*"/sorcerer/Cass MAME/"*) core="mame_libretro sorcerer -cart sorcerer_cart:basicpac -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 5 -cass1"; src="https://archive.org/download/mame-sl/mame-sl/sorcerer_cass.zip/sorcerer_cass/";;
*"/sorcerer/Flop MAME/"*) core="mame_libretro sorcererd -flop1"; src="https://archive.org/download/mame-sl/mame-sl/sorcerer_flop.zip/sorcerer_flop/";;
*"/z80ne/Cass MAME/"*) core="mame_libretro z80net -cass1"; src="https://archive.org/download/mame-sl/mame-sl/z80ne_cass.zip/z80ne_cass/";;
*"/z80ne/Flop MAME/"*) core="mame_libretro z80netf -flop1"; src="https://archive.org/download/mame-sl/mame-sl/z80ne_flop.zip/z80ne_flop/";;
*"/osborne1/MAME/"*) core="mame_libretro osborne1 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/osborne1.zip/osborne1/";;
*"/jupace/MAME/"*) core="mame_libretro jupace -cass"; src="https://archive.org/download/mame-sl/mame-sl/jupace_cass.zip/jupace_cass/";;
*"/jupace/Snap MAME/"*) core="mame_libretro jupace -dump"; src="https://archive.org/download/mame-sl/mame-sl/jupace_snap.zip/jupace_snap/";;
*"/nascom/Snap MAME/"*) core="mame_libretro nascom2 -dump1"; src="https://archive.org/download/mame-sl/mame-sl/nascom_snap.zip/nascom_snap/";;
*"/nascom/Flop MAME/"*) core="mame_libretro nascom2 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/nascom_flop.zip/nascom_flop/";;
*"/nascom/ROM MAME/"*) core="mame_libretro nascom2 -rom1"; src="https://archive.org/download/mame-sl/mame-sl/nascom_socket.zip/nascom_socket/";;
*"/abc80/Flop MAME/"*) core="mame_libretro abc80 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/abc80_flop.zip/abc80_flop/";;
*"/abc80/Cass MAME/"*) core="mame_libretro abc80 -cass"; src="https://archive.org/download/mame-sl/mame-sl/abc80_cass.zip/abc80_cass/";;
*"/abc80/ROM MAME/"*) core="mame_libretro abc80 -cart"; src="https://archive.org/download/mame-sl/mame-sl/abc80_rom.zip/abc80_rom/";;
*"/kaypro/MAME/"*) core="mame_libretro kaypro2x -flop1"; src="https://archive.org/download/mame-sl/mame-sl/kaypro.zip/kaypro/";;
*"/galaxy/MAME/"*) core="mame_libretro galaxy -autoboot_command 'OLD\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/galaxy.zip/galaxy/";;
*"/special/MAME/"*) core="mame_libretro special -autoboot_command 'I\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/special_cass.zip/special_cass/";;
*"/special/Flop MAME/"*) core="mame_libretro specimx -flop1"; src="https://archive.org/download/mame-sl/mame-sl/special_flop.zip/special_flop/";;
*"/apogee/MAME/"*) core="mame_libretro apogee -autoboot_command 'I\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/apogee.zip/apogee/";;
*"/radio86/MAME/"*) core="mame_libretro radio86 -autoboot_command 'I\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/radio86_cass.zip/radio86_cass/";;
*"/mikrosha/MAME/"*) core="mame_libretro mikrosha -autoboot_command 'I\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mikrosha_cass.zip/mikrosha_cass/";;
*"/mikrosha/Cart MAME/"*) core="mame_libretro mikrosha -cart"; src="https://archive.org/download/mame-sl/mame-sl/mikrosha_cart.zip/mikrosha_cart/";;
*"/partner/Cass MAME/"*) core="mame_libretro partner -cass"; src="https://archive.org/download/mame-sl/mame-sl/partner_cass.zip/partner_cass/";;
*"/partner/Flop MAME/"*) core="mame_libretro partner -flop1"; src="https://archive.org/download/mame-sl/mame-sl/partner_flop.zip/partner_flop/";;
*"/korvet/MAME/"*) core="mame_libretro korvet -flop1"; src="https://archive.org/download/mame-sl/mame-sl/korvet_flop.zip/korvet_flop/";;
*"/atom/TOSEC/"*) core="mame_libretro atom -flop1"; src="https://archive.org/download/tosec-main/Acorn/Atom/Compilations/Games/Acorn%20Atom%20-%20Compilations%20-%20Games%20%28TOSEC-v2018-03-08%29.zip/";;
*"/atom/MAME/"*) core="mame_libretro atom -flop1"; src="https://archive.org/download/mame-sl/mame-sl/atom_flop.zip/atom_flop/";;
*"/atom/ROM MAME/"*) core="mame_libretro atom -cart"; src="https://archive.org/download/mame-sl/mame-sl/atom_rom.zip/atom_rom/";;
*"/atom/Cass MAME/"*) core="mame_libretro atom -cass"; src="https://archive.org/download/mame-sl/mame-sl/atom_cass.zip/atom_cass/";;
*"/interact/MAME/"*) core="mame_libretro interact -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/interact.zip/interact/";;
*"/spc1000/MAME/"*) core="mame_libretro spc1000 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/spc1000_cass.zip/spc1000_cass/";;
*"/cgenie/TOSEC/"*) core="mame_libretro cgenie -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/tosec-main/EACA/EG2000%20Colour%20Genie/Compilations/Games/%5BCGD%5D/EACA%20EG2000%20Colour%20Genie%20-%20Compilations%20-%20Games%20-%20%5BCGD%5D%20%28TOSEC-v2020-10-26%29.zip/";;
*"/cgenie/Demo/"*) core="mame_libretro cgenie -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/tosec-main/EACA/EG2000%20Colour%20Genie/Demos/EACA%20EG2000%20Colour%20Genie%20-%20Demos%20%28TOSEC-v2021-02-12%29.zip/";;
*"/cgenie/Edu/"*) core="mame_libretro cgenie -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/tosec-main/EACA/EG2000%20Colour%20Genie/Educational/EACA%20EG2000%20Colour%20Genie%20-%20Educational%20%28TOSEC-v2021-02-12%29.zip/";;
*"/cgenie/Cass MAME/"*) core="mame_libretro cgenie -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/mame-sl/mame-sl/cgenie_cass.zip/cgenie_cass/";;
*"/dragon64/TOSEC/"*) core="mame_libretro dragon64 -autoboot_command 'CLOAD\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/tosec-main/Dragon%20Data/Dragon/Games/%5BBIN%5D/Dragon%20Data%20Dragon%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/dragon64/Demo/"*) core="mame_libretro dragon64 -autoboot_command 'CLOAD\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/tosec-main/Dragon%20Data/Dragon/Demos/Dragon%20Data%20Dragon%20-%20Demos%20%28TOSEC-v2014-01-23%29.zip/";;
*"/dragon64/Edu/"*) core="mame_libretro dragon64 -autoboot_command 'CLOAD\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/tosec-main/Dragon%20Data/Dragon/Educational/Dragon%20Data%20Dragon%20-%20Educational%20%28TOSEC-v2014-01-23%29.zip/";;
*"/dragon64/MAME/"*) core="mame_libretro dragon64 -autoboot_command 'CLOAD\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/mame-sl/mame-sl/dragon_cass.zip/dragon_cass/";;
*"/dragon64/Flop MAME/"*) core="mame_libretro dragon64 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/dragon_flop.zip/dragon_flop/";;
*"/dragon64/Cart MAME/"*) core="mame_libretro dragon64 -cart"; src="https://archive.org/download/mame-sl/mame-sl/dragon_cart.zip/dragon_cart/";;
*"/dragon64/OS-9 MAME/"*) core="mame_libretro dragon64 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/dragon_os9.zip/dragon_os9/";;
*"/dragon64/Flex MAME/"*) core="mame_libretro dragon64 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/dragon_flex.zip/dragon_flex/";;
*"/dragon64/Alpha Flop MAME/"*) core="mame_libretro dragon64 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/dgnalpha_flop.zip/dgnalpha_flop/";;
*"/oricatmos/TAP/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/tosec-main/Tangerine/Oric-1%20%26%20Oric%20Atmos/Compilations/Games/%5BDSK%5D/Tangerine%20Oric-1%20%26%20Oric%20Atmos%20-%20Compilations%20-%20Games%20-%20%5BDSK%5D%20%28TOSEC-v2021-12-11%29.zip/";;
*"/oricatmos/Demo [DSK]/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/tosec-main/Tangerine/Oric-1%20%26%20Oric%20Atmos/Demos/%5BDSK%5D/Tangerine%20Oric-1%20%26%20Oric%20Atmos%20-%20Demos%20-%20%5BDSK%5D%20%28TOSEC-v2021-12-11%29.zip/";;
*"/oricatmos/Demo [TAP]/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/tosec-main/Tangerine/Oric-1%20%26%20Oric%20Atmos/Demos/%5BTAP%5D/Tangerine%20Oric-1%20%26%20Oric%20Atmos%20-%20Demos%20-%20%5BTAP%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/oricatmos/Edu [DSK]/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/tosec-main/Tangerine/Oric-1%20%26%20Oric%20Atmos/Educational/%5BDSK%5D/Tangerine%20Oric-1%20%26%20Oric%20Atmos%20-%20Educational%20-%20%5BDSK%5D%20%28TOSEC-v2021-12-11%29.zip/";;
*"/oricatmos/Edu [TAP]/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/tosec-main/Tangerine/Oric-1%20%26%20Oric%20Atmos/Educational/%5BTAP%5D/Tangerine%20Oric-1%20%26%20Oric%20Atmos%20-%20Educational%20-%20%5BTAP%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/oricatmos/MAME/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass"; src="https://archive.org/download/mame-sl/mame-sl/oric1_cass.zip/oric1_cass/";;
*"/camplynx/MAME/"*) core="mame_libretro lynx48k -autoboot_command 'mload\"\"\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/mame-sl/mame-sl/camplynx_cass.zip/camplynx_cass/";;
*"/camplynx/Flop MAME/"*) core="mame_libretro lynx128k -flop1"; src="https://archive.org/download/mame-sl/mame-sl/camplynx_flop.zip/camplynx_flop/";;
*"/orao/MAME/"*) core="mame_libretro orao -cass"; src="https://archive.org/download/mame-sl/mame-sl/orao.zip/orao/";;
*"/vg5k/MAME/"*) core="mame_libretro vg5k -cass"; src="https://archive.org/download/mame-sl/mame-sl/vg5k.zip/vg5k/";;
*"/pegasus/MAME/"*) core="mame_libretro pegasus -rom1"; src="https://archive.org/download/mame-sl/mame-sl/pegasus_cart.zip/pegasus_cart/";;
*"/juku/MAME/"*) core="mame_libretro juku -flop1"; src="https://archive.org/download/mame-sl/mame-sl/juku.zip/juku/";;
*"/x07/MAME/"*) core="mame_libretro x07 -cass"; src="https://archive.org/download/mame-sl/mame-sl/x07_cass.zip/x07_cass/";;
*"/x07/Card MAME/"*) core="mame_libretro x07 -cart"; src="https://archive.org/download/mame-sl/mame-sl/x07_card.zip/x07_card/";;
*"/alice/A32 MAME/"*) core="mame_libretro alice32 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/alice32.zip/alice32/";;
*"/alice/A90 MAME/"*) core="mame_libretro alice90 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/alice90.zip/alice90/";;
*"/mc10/TOSEC/"*) core="mame_libretro mc10 -cass"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20MC-10/Various/Tandy%20Radio%20Shack%20TRS-80%20MC-10%20-%20Various%20%28TOSEC-v2014-05-29%29.zip/";;
*"/mc10/MAME/"*) core="mame_libretro mc10 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mc10.zip/mc10/";;
*"/phc25/MAME/"*) core="mame_libretro phc25 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/phc25_cass.zip/phc25_cass/";;
*"/laser310/200 VZ/"*) core="mame_libretro laser310 -dump"; src="https://archive.org/download/tosec-main/VTech/Laser%20200/Games/%5BVZ%5D/VTech%20Laser%20200%20-%20Games%20-%20%5BVZ%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/laser310/200 App/"*) core="mame_libretro laser310 -dump"; src="https://archive.org/download/tosec-main/VTech/Laser%20200/Applications/VTech%20Laser%20200%20-%20Applications%20%28TOSEC-v2014-07-30%29.zip/";;
*"/laser310/310 App/"*) core="mame_libretro laser310 -dump"; src="https://archive.org/download/tosec-main/VTech/Laser%20310/Applications/VTech%20Laser%20310%20-%20Applications%20%28TOSEC-v2014-01-21%29.zip/";;
*"/laser310/Demo [CVZ]/"*) core="mame_libretro laser310 -dump"; src="https://archive.org/download/tosec-main/VTech/Laser%20200/Demos/%5BCVZ%5D/VTech%20Laser%20200%20-%20Demos%20-%20%5BCVZ%5D%20%28TOSEC-v2014-07-30%29.zip/";;
*"/laser310/Demo [VZ]/"*) core="mame_libretro laser310 -dump"; src="https://archive.org/download/tosec-main/VTech/Laser%20200/Demos/%5BVZ%5D/VTech%20Laser%20200%20-%20Demos%20-%20%5BVZ%5D%20%28TOSEC-v2014-07-30%29.zip/";;
*"/laser310/MAME/"*) core="mame_libretro laser310 -dump"; src="https://archive.org/download/mame-sl/mame-sl/vz_snap.zip/vz_snap/";;
*"/laser310/Cass MAME/"*) core="mame_libretro laser310 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/mame-sl/mame-sl/vz_cass.zip/vz_cass/";;
*"/bk/TOSEC/"*) core="bk_libretro"; src="https://archive.org/download/tosec-main/Elektronika/BK-0011-411/Games/Elektronika%20BK-0011-411%20-%20Games%20%28TOSEC-v2014-01-23%29.zip/";;
*"/bk/App/"*) core="bk_libretro"; src="https://archive.org/download/tosec-main/Elektronika/BK-0010-0011M/Applications/Elektronika%20BK-0010-0011M%20-%20Applications%20%28TOSEC-v2014-01-23%29.zip/";;
*"/bk/Demo [BIN]/"*) core="bk_libretro"; src="https://archive.org/download/tosec-main/Elektronika/BK-0010-0011M/Demos/%5BBIN%5D/Elektronika%20BK-0010-0011M%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/bk/Demo [IMG]/"*) core="bk_libretro"; src="https://archive.org/download/tosec-main/Elektronika/BK-0010-0011M/Demos/%5BIMG%5D/Elektronika%20BK-0010-0011M%20-%20Demos%20-%20%5BIMG%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/bk/Demo [Multipart]/"*) core="bk_libretro"; src="https://archive.org/download/tosec-main/Elektronika/BK-0010-0011M/Demos/%5BMultipart%5D/Elektronika%20BK-0010-0011M%20-%20Demos%20-%20%5BMultipart%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/bk/Demo [V0]/"*) core="bk_libretro"; src="https://archive.org/download/tosec-main/Elektronika/BK-0010-0011M/Demos/%5BV0%5D/Elektronika%20BK-0010-0011M%20-%20Demos%20-%20%5BV0%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/bk/Demo [WAV]/"*) core="bk_libretro"; src="https://archive.org/download/tosec-main/Elektronika/BK-0010-0011M/Demos/%5BWAV%5D/Elektronika%20BK-0010-0011M%20-%20Demos%20-%20%5BWAV%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/bk/MAME/"*) core="mame_libretro bk0010 -cass"; src="https://archive.org/download/mame-sl/mame-sl/bk0010.zip/bk0010/";;
*"/pmd85/MAME/"*) core="mame_libretro pmd851 -autoboot_command 'MGLD 00\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/pmd85_cass.zip/pmd85_cass/";;
*"/lviv/MAME/"*) core="mame_libretro lviv -autoboot_command 'CLOAD \"\"\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/lviv.zip/lviv/";;
*"/mc1000/MAME/"*) core="mame_libretro mc1000 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mc1000_cass.zip/mc1000_cass/";;
*"/pecom64/MAME/"*) core="mame_libretro pecom64 -autoboot_command 'PLOAD\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/pecom_cass.zip/pecom_cass/";;
*"/spc1500/MAME/"*) core="mame_libretro spc1500 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/spc1500_cass.zip/spc1500_cass/";;
*"/orion128/MAME/"*) core="mame_libretro orion128 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/orion_flop.zip/orion_flop/";;
*"/orion128/Cass MAME/"*) core="mame_libretro orion128 -cass"; src="https://archive.org/download/mame-sl/mame-sl/orion_cass.zip/orion_cass/";;
*"/orion128/Cart MAME/"*) core="mame_libretro orion128 -cart"; src="https://archive.org/download/mame-sl/mame-sl/orion_cart.zip/orion_cart/";;
*"/videobrain/MAME/"*) core="mame_libretro vidbrain -cart"; src="https://archive.org/download/mame-sl/mame-sl/vidbrain.zip/vidbrain/";;
*"/super80/Cass MAME/"*) core="mame_libretro super80 -cass"; src="https://archive.org/download/mame-sl/mame-sl/super80_cass.zip/super80_cass/";;
*"/super80/Flop MAME/"*) core="mame_libretro super80r -flop1"; src="https://archive.org/download/mame-sl/mame-sl/super80_flop.zip/super80_flop/";;
*"/bbcmicro/TOSEC/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/tosec-main/Acorn/BBC/Games/%5BADL%5D/Acorn%20BBC%20-%20Games%20-%20%5BADL%5D%20%28TOSEC-v2013-10-22%29.zip/";;
*"/bbcmicro/Demo [BIN]/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/tosec-main/Acorn/BBC/Demos/%5BBIN%5D/Acorn%20BBC%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2013-10-22%29.zip/";;
*"/bbcmicro/Demo [SSD]/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/tosec-main/Acorn/BBC/Demos/%5BSSD%5D/Acorn%20BBC%20-%20Demos%20-%20%5BSSD%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/bbcmicro/Edu [ADL]/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/tosec-main/Acorn/BBC/Educational/%5BADL%5D/Acorn%20BBC%20-%20Educational%20-%20%5BADL%5D%20%28TOSEC-v2013-10-22%29.zip/";;
*"/bbcmicro/Edu [DSD]/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/tosec-main/Acorn/BBC/Educational/%5BDSD%5D/Acorn%20BBC%20-%20Educational%20-%20%5BDSD%5D%20%28TOSEC-v2013-10-22%29.zip/";;
*"/bbcmicro/Edu [SSD]/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/tosec-main/Acorn/BBC/Educational/%5BSSD%5D/Acorn%20BBC%20-%20Educational%20-%20%5BSSD%5D%20%28TOSEC-v2013-10-22%29.zip/";;
*"/bbcmicro/Edu [UEF]/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/tosec-main/Acorn/BBC/Educational/%5BUEF%5D/Acorn%20BBC%20-%20Educational%20-%20%5BUEF%5D%20%28TOSEC-v2013-10-22%29.zip/";;
*"/bbcmicro/Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbcb_flop.zip/bbcb_flop/";;
*"/bbcmicro/Orig MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbcb_flop_orig.zip/bbcb_flop_orig/";;
*"/bbcmicro/Micro Cass MAME/"*) core="mame_libretro bbcb -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/mame-sl/mame-sl/bbc_cass.zip/bbc_cass/";;
*"/bbcmicro/Micro ROM MAME/"*) core="mame_libretro bbcb -rom1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_rom.zip/bbc_rom/";;
*"/bbcmicro/Master Cart MAME/"*) core="mame_libretro bbcm -cart"; src="https://archive.org/download/mame-sl/mame-sl/bbcm_cart.zip/bbcm_cart/";;
*"/bbcmicro/Master Flop MAME/"*) core="mame_libretro bbcm -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbcm_flop.zip/bbcm_flop/";;
*"/bbcmicro/Master Compact Flop MAME/"*) core="mame_libretro bbcmc -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbcmc_flop.zip/bbcmc_flop/";;
*"/bbcmicro/US Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbcb_flop_us.zip/bbcb_flop_us/";;
*"/bbcmicro/ARM Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_flop_arm.zip/bbc_flop_arm/";;
*"/bbcmicro/Hybrid Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_flop_hybrid.zip/bbc_flop_hybrid/";;
*"/bbcmicro/Torch Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_flop_torch.zip/bbc_flop_torch/";;
*"/bbcmicro/Z80 Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_flop_z80.zip/bbc_flop_z80/";;
*"/bbcmicro/32016 Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_flop_32016.zip/bbc_flop_32016/";;
*"/bbcmicro/6502 Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_flop_6502.zip/bbc_flop_6502/";;
*"/bbcmicro/68000 Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_flop_68000.zip/bbc_flop_68000/";;
*"/bbcmicro/80186 Flop MAME/"*) core="mame_libretro bbcb -flop1"; src="https://archive.org/download/mame-sl/mame-sl/bbc_flop_80186.zip/bbc_flop_80186/";;
*"/ti99/MAME/"*) core="mame_libretro ti99_4a"; src="https://archive.org/download/mame-sl/mame-sl/ti99_cart.zip/ti99_cart/";;
*"/mbee/Cart MAME/"*) core="mame_libretro mbee -rom2"; src="https://archive.org/download/mame-sl/mame-sl/mbee_cart.zip/mbee_cart/";;
*"/mbee/Quik MAME/"*) core="mame_libretro mbee -quik"; src="https://archive.org/download/mame-sl/mame-sl/mbee_quik.zip/mbee_quik/";;
*"/mbee/Flop MAME/"*) core="mame_libretro mbee56 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/mbee_flop.zip/mbee_flop/";;
*"/m5/Cart MAME/"*) core="mame_libretro m5 -cart1"; src="https://archive.org/download/mame-sl/mame-sl/m5_cart.zip/m5_cart/";;
*"/m5/Cass MAME/"*) core="mame_libretro m5 -cart1 m5_cart:basici -autoboot_command 'CHAIN\n' -autoboot_delay 5 -cass"; src="https://archive.org/download/mame-sl/mame-sl/m5_cass.zip/m5_cass/";;
*"/aquarius/Cart MAME/"*) core="mame_libretro aquarius -cart1"; src="https://archive.org/download/mame-sl/mame-sl/aquarius_cart.zip/aquarius_cart/";;
*"/aquarius/Cass MAME/"*) core="mame_libretro aquarius -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/aquarius_cass.zip/aquarius_cass/";;
*"/adam/TOSEC/"*) core="mame_libretro adam -flop1"; src="https://archive.org/download/tosec-main/Coleco/ColecoVision%20ADAM/Compilations/Games/%5BDDP%5D/Coleco%20ColecoVision%20ADAM%20-%20Compilations%20-%20Games%20-%20%5BDDP%5D%20%28TOSEC-v2023-08-29%29.zip/";;
*"/adam/App/"*) core="mame_libretro adam -flop1"; src="https://archive.org/download/tosec-main/Coleco/ColecoVision%20ADAM/Applications/%5BBAS%5D/Coleco%20ColecoVision%20ADAM%20-%20Applications%20-%20%5BBAS%5D%20%28TOSEC-v2011-08-31%29.zip/";;
*"/adam/Edu [DDP]/"*) core="mame_libretro adam -flop1"; src="https://archive.org/download/tosec-main/Coleco/ColecoVision%20ADAM/Educational/%5BDDP%5D/Coleco%20ColecoVision%20ADAM%20-%20Educational%20-%20%5BDDP%5D%20%28TOSEC-v2023-08-29%29.zip/";;
*"/adam/MAME/"*) core="mame_libretro adam -flop1"; src="https://archive.org/download/mame-sl/mame-sl/adam_flop.zip/adam_flop/";;
*"/adam/Cass MAME/"*) core="mame_libretro adam -cass"; src="https://archive.org/download/mame-sl/mame-sl/adam_cass.zip/adam_cass/";;
*"/adam/Cart MAME/"*) core="mame_libretro adam -cart1"; src="https://archive.org/download/mame-sl/mame-sl/adam_cart.zip/adam_cart/";;
*"/spectravideo/Games/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/Spectravideo/SVI-318%20%26%20SVI-328/Games/%5BBIN%5D/Spectravideo%20SVI-318%20%26%20SVI-328%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/spectravideo/Various/"*) core="bluemsx_libretro"; src="https://archive.org/download/tosec-main/Spectravideo/SVI-318%20%26%20SVI-328/Various/%5BBIN%5D/Spectravideo%20SVI-318%20%26%20SVI-328%20-%20Various%20-%20%5BBIN%5D%20%28TOSEC-v2014-05-29%29.zip/";;
*"/spectravideo/MAME/"*) core="mame_libretro svi318 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/svi318_cass.zip/svi318_cass/";;
*"/spectravideo/Cart MAME/"*) core="mame_libretro svi318 -cart"; src="https://archive.org/download/mame-sl/mame-sl/svi318_cart.zip/svi318_cart/";;
*"/mtx/Cart MAME/"*) core="mame_libretro mtx512 -cart1"; src="https://archive.org/download/mame-sl/mame-sl/mtx_cart.zip/mtx_cart/";;
*"/mtx/Cass MAME/"*) core="mame_libretro mtx512 -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mtx_cass.zip/mtx_cass/";;
*"/mtx/Flop MAME/"*) core="mame_libretro mtx512 -exp_ext sdxbas -flop1"; src="https://archive.org/download/mame-sl/mame-sl/mtx_flop.zip/mtx_flop/";;
*"/mtx/ROM MAME/"*) core="mame_libretro mtx512 -rom"; src="https://archive.org/download/mame-sl/mame-sl/mtx_rom.zip/mtx_rom/";;
*"/pencil2/MAME/"*) core="mame_libretro pencil2 -cart"; src="https://archive.org/download/mame-sl/mame-sl/pencil2.zip/pencil2/";;
*"/electron/TOSEC/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/tosec-main/Acorn/Electron/Games/%5BBIN%5D/Acorn%20Electron%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2018-07-01%29.zip/";;
*"/electron/App/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/tosec-main/Acorn/Electron/Applications/%5BBIN%5D/Acorn%20Electron%20-%20Applications%20-%20%5BBIN%5D%20%28TOSEC-v2013-10-22%29.zip/";;
*"/electron/Edu/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/tosec-main/Acorn/Electron/Educational/%5BBIN%5D/Acorn%20Electron%20-%20Educational%20-%20%5BBIN%5D%20%28TOSEC-v2018-07-01%29.zip/";;
*"/electron/Demo [UEF]/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/tosec-main/Acorn/Electron/Demos/%5BUEF%5D/Acorn%20Electron%20-%20Demos%20-%20%5BUEF%5D%20%28TOSEC-v2018-07-01%29.zip/";;
*"/electron/Edu [UEF]/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/tosec-main/Acorn/Electron/Educational/%5BUEF%5D/Acorn%20Electron%20-%20Educational%20-%20%5BUEF%5D%20%28TOSEC-v2018-07-01%29.zip/";;
*"/electron/MAME/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; src="https://archive.org/download/mame-sl/mame-sl/electron_cass.zip/electron_cass/";;
*"/electron/Flop MAME/"*) core="mame_libretro electron64 -flop"; src="https://archive.org/download/mame-sl/mame-sl/electron_flop.zip/electron_flop/";;
*"/electron/Cart MAME/"*) core="mame_libretro electron64 -exp plus1 -cart"; src="https://archive.org/download/mame-sl/mame-sl/electron_cart.zip/electron_cart/";;
*"/electron/ROM MAME/"*) core="mame_libretro electron64 -exp plus1 -rom"; src="https://archive.org/download/mame-sl/mame-sl/electron_rom.zip/electron_rom/";;
*"/tutor/TOSEC/"*) core="mame_libretro tutor -cart"; src="https://archive.org/download/tosec-main/Tomy/Tutor%20%26%20Pyuuta/Games/Tomy%20Tutor%20%26%20Pyuuta%20-%20Games%20%28TOSEC-v2022-06-08%29.zip/";;
*"/tutor/MAME/"*) core="mame_libretro tutor -cart"; src="https://archive.org/download/mame-sl/mame-sl/tutor.zip/tutor/";;
*"/exl100/MAME/"*) core="mame_libretro exl100 -cart"; src="https://archive.org/download/mame-sl/mame-sl/exl100.zip/exl100/";;
*"/compclr2/MAME/"*) core="mame_libretro compclr2 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/compclr2_flop.zip/compclr2_flop/";;
*"/myvision/MAME/"*) core="mame_libretro myvision -cart"; src="https://archive.org/download/mame-sl/mame-sl/myvision.zip/myvision/";;
*"/einstein/MAME/"*) core="mame_libretro einstein -flop1"; src="https://archive.org/download/mame-sl/mame-sl/einstein.zip/einstein/";;
*"/einstein/ROM MAME/"*) core="mame_libretro einstein -rom"; src="https://archive.org/download/mame-sl/mame-sl/einstein_rom.zip/einstein_rom/";;
*"/kc85/Cass MAME/"*) core="mame_libretro kc85_4 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/kc_cass.zip/kc_cass/";;
*"/kc85/Cart MAME/"*) core="mame_libretro kc85_4 -cart"; src="https://archive.org/download/mame-sl/mame-sl/kc_cart.zip/kc_cart/";;
*"/kc85/Flop MAME/"*) core="mame_libretro kc85_4 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/kc_flop.zip/kc_flop/";;
*"/tvc/TC Computer CAS/"*) core="ep128emu_core_libretro"; src="https://archive.org/download/tosec-main/Videoton/TV-Computer/Games/%5BCAS%5D/Videoton%20TV-Computer%20-%20Games%20-%20%5BCAS%5D%20%28TOSEC-v2021-07-25%29.zip/";;
*"/tvc/TC Computer Flop MAME/"*) core="mame_libretro tvc64p -flop1"; src="https://archive.org/download/mame-sl/mame-sl/tvc_flop.zip/tvc_flop/";;
*"/tvc/TVC Cass MAME/"*) core="mame_libretro tvc64p -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/tvc_cass.zip/tvc_cass/";;
*"/tvc/TVC Cart MAME/"*) core="mame_libretro tvc64p -cart"; src="https://archive.org/download/mame-sl/mame-sl/tvc_cart.zip/tvc_cart/";;
*"/rx78/NoIntro/"*) core="mame_libretro rx78 -cart"; src="https://archive.org/download/ni-roms/roms/Bandai%20-%20Gundam%20RX-78.zip/";;
*"/rx78/TOSEC/"*) core="mame_libretro rx78 -cart"; src="https://archive.org/download/tosec-main/Bandai/Gundam%20RX-78/Games/%5BBIN%5D/Bandai%20Gundam%20RX-78%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/rx78/Cart MAME/"*) core="mame_libretro rx78 -cart"; src="https://archive.org/download/mame-sl/mame-sl/rx78_cart.zip/rx78_cart/";;
*"/rx78/Cass MAME/"*) core="mame_libretro rx78 basic -cass"; src="https://archive.org/download/mame-sl/mame-sl/rx78_cass.zip/rx78_cass/";;
*"/coco/TOSEC/"*) core="mame_libretro coco3 -cart"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Color%20Computer/Games/%5BBIN%5D/Tandy%20Radio%20Shack%20TRS-80%20Color%20Computer%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/coco/App/"*) core="mame_libretro coco3 -cart"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Color%20Computer/Applications/%5BBIN%5D/Tandy%20Radio%20Shack%20TRS-80%20Color%20Computer%20-%20Applications%20-%20%5BBIN%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/coco/Demo [BIN]/"*) core="mame_libretro coco3 -cart"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Color%20Computer/Demos/%5BBIN%5D/Tandy%20Radio%20Shack%20TRS-80%20Color%20Computer%20-%20Demos%20-%20%5BBIN%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/coco/Edu [DSK]/"*) core="mame_libretro coco3 -cart"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Color%20Computer/Educational/%5BDSK%5D/Tandy%20Radio%20Shack%20TRS-80%20Color%20Computer%20-%20Educational%20-%20%5BDSK%5D%20%28TOSEC-v2011-01-01%29.zip/";;
*"/coco/Edu [ROM]/"*) core="mame_libretro coco3 -cart"; src="https://archive.org/download/tosec-main/Tandy%20Radio%20Shack/TRS-80%20Color%20Computer/Educational/%5BROM%5D/Tandy%20Radio%20Shack%20TRS-80%20Color%20Computer%20-%20Educational%20-%20%5BROM%5D%20%28TOSEC-v2011-01-01%29.zip/";;
*"/coco/MAME/"*) core="mame_libretro coco3 -cart"; src="https://archive.org/download/mame-sl/mame-sl/coco_cart.zip/coco_cart/";;
*"/coco/Flop MAME/"*) core="mame_libretro coco3 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/coco_flop.zip/coco_flop/";;
*"/samcoupe/DSK/"*) core="mame_libretro samcoupe -flop1"; src="https://archive.org/download/tosec-main/MGT/Sam%20Coupe/Compilations/Games/MGT%20Sam%20Coupe%20-%20Compilations%20-%20Games%20%28TOSEC-v2023-08-29%29.zip/";;
*"/samcoupe/Demo [DSK]/"*) core="mame_libretro samcoupe -flop1"; src="https://archive.org/download/tosec-main/MGT/Sam%20Coupe/Demos/%5BDSK%5D/MGT%20Sam%20Coupe%20-%20Demos%20-%20%5BDSK%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/samcoupe/Demo [MGT]/"*) core="mame_libretro samcoupe -flop1"; src="https://archive.org/download/tosec-main/MGT/Sam%20Coupe/Demos/%5BMGT%5D/MGT%20Sam%20Coupe%20-%20Demos%20-%20%5BMGT%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/samcoupe/Demo [SAD]/"*) core="mame_libretro samcoupe -flop1"; src="https://archive.org/download/tosec-main/MGT/Sam%20Coupe/Demos/%5BSAD%5D/MGT%20Sam%20Coupe%20-%20Demos%20-%20%5BSAD%5D%20%28TOSEC-v2014-04-11%29.zip/";;
*"/samcoupe/Demo [TD0]/"*) core="mame_libretro samcoupe -flop1"; src="https://archive.org/download/tosec-main/MGT/Sam%20Coupe/Demos/%5BTD0%5D/MGT%20Sam%20Coupe%20-%20Demos%20-%20%5BTD0%5D%20%28TOSEC-v2014-04-11%29.zip/";;
*"/samcoupe/MAME/"*) core="mame_libretro samcoupe -flop1"; src="https://archive.org/download/mame-sl/mame-sl/samcoupe_flop.zip/samcoupe_flop/";;
*"/samcoupe/Cass MAME/"*) core="mame_libretro samcoupe -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/samcoupe_cass.zip/samcoupe_cass/";;
*"/enterprise/Games/"*) core="ep128emu_core_libretro"; src="https://archive.org/download/tosec-main/Enterprise/64%20%26%20128/Games/%5BAPP%5D/Enterprise%2064%20%26%20128%20-%20Games%20-%20%5BAPP%5D%20%28TOSEC-v2021-07-25%29.zip/";;
*"/enterprise/Demo Various/"*) core="ep128emu_core_libretro"; src="https://archive.org/download/tosec-main/Enterprise/64%20%26%20128/Demos/Various/Enterprise%2064%20%26%20128%20-%20Demos%20-%20Various%20%28TOSEC-v2025-02-24%29.zip/";;
*"/enterprise/Demo [COM-PRG]/"*) core="ep128emu_core_libretro"; src="https://archive.org/download/tosec-main/Enterprise/64%20%26%20128/Demos/%5BCOM-PRG%5D/Enterprise%2064%20%26%20128%20-%20Demos%20-%20%5BCOM-PRG%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/enterprise/Demo [COM]/"*) core="ep128emu_core_libretro"; src="https://archive.org/download/tosec-main/Enterprise/64%20%26%20128/Demos/%5BCOM%5D/Enterprise%2064%20%26%20128%20-%20Demos%20-%20%5BCOM%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/enterprise/64 & 128 Flop MAME/"*) core="mame_libretro ep128 -flop"; src="https://archive.org/download/mame-sl/mame-sl/ep64_flop.zip/ep64_flop/";;
*"/enterprise/Cart MAME/"*) core="mame_libretro ep128 -cart"; src="https://archive.org/download/mame-sl/mame-sl/ep64_cart.zip/ep64_cart/";;
*"/enterprise/Cass MAME/"*) core="mame_libretro ep128 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/ep64_cass.zip/ep64_cass/";;
*"/vector06/MAME/"*) core="mame_libretro vector06 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/vector06_flop.zip/vector06_flop/";;
*"/vector06/Cart MAME/"*) core="mame_libretro vector06 -cart"; src="https://archive.org/download/mame-sl/mame-sl/vector06_cart.zip/vector06_cart/";;
*"/socrates/VTech Socrates/"*) core="mame_libretro socrates -cart"; src="https://archive.org/download/mame-sl/mame-sl/socrates.zip/socrates/";;
*"/thomson/MO5 K7/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/MO5/Compilations/Games/Thomson%20MO5%20-%20Compilations%20-%20Games%20%28TOSEC-v2012-08-27%29.zip/";;
*"/thomson/MO6 K7/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/MO6/Games/Thomson%20MO6%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/thomson/TO7 K7/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/TO7/Games/%5BK7%5D/Thomson%20TO7%20-%20Games%20-%20%5BK7%5D%20%28TOSEC-v2012-08-27%29.zip/";;
*"/thomson/TO7 SAP/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/TO7/Games/%5BSAP%5D/Thomson%20TO7%20-%20Games%20-%20%5BSAP%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/thomson/Demo Educational/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/MO5/Compilations/Educational/Thomson%20MO5%20-%20Compilations%20-%20Educational%20%28TOSEC-v2021-02-12%29.zip/";;
*"/thomson/Edu [FD]/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/MO5/Educational/%5BFD%5D/Thomson%20MO5%20-%20Educational%20-%20%5BFD%5D%20%28TOSEC-v2012-08-27%29.zip/";;
*"/thomson/Edu [K7]/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/MO5/Educational/%5BK7%5D/Thomson%20MO5%20-%20Educational%20-%20%5BK7%5D%20%28TOSEC-v2012-08-27%29.zip/";;
*"/thomson/Edu [M5]/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/MO5/Educational/%5BM5%5D/Thomson%20MO5%20-%20Educational%20-%20%5BM5%5D%20%28TOSEC-v2011-08-23%29.zip/";;
*"/thomson/Edu [WAV]/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/MO5/Educational/%5BWAV%5D/Thomson%20MO5%20-%20Educational%20-%20%5BWAV%5D%20%28TOSEC-v2012-08-27%29.zip/";;
*"/thomson/Demo/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/TO7/Demos/Thomson%20TO7%20-%20Demos%20%28TOSEC-v2012-08-27%29.zip/";;
*"/thomson/Edu [K7]/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/TO7/Educational/%5BK7%5D/Thomson%20TO7%20-%20Educational%20-%20%5BK7%5D%20%28TOSEC-v2012-08-27%29.zip/";;
*"/thomson/TO8 FD/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/TO8%2C%20TO8D%2C%20TO9%2C%20TO9%2B/Games/%5BFD%5D/Thomson%20TO8%2C%20TO8D%2C%20TO9%2C%20TO9%2B%20-%20Games%20-%20%5BFD%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/thomson/TO8 K7/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/TO8%2C%20TO8D%2C%20TO9%2C%20TO9%2B/Games/%5BK7%5D/Thomson%20TO8%2C%20TO8D%2C%20TO9%2C%20TO9%2B%20-%20Games%20-%20%5BK7%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/thomson/TO8 SAP/"*) core="theodore_libretro"; src="https://archive.org/download/tosec-main/Thomson/TO8%2C%20TO8D%2C%20TO9%2C%20TO9%2B/Games/%5BSAP%5D/Thomson%20TO8%2C%20TO8D%2C%20TO9%2C%20TO9%2B%20-%20Games%20-%20%5BSAP%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/thomson/MO5 Cart MAME/"*) core="mame_libretro mo5 -cart"; src="https://archive.org/download/mame-sl/mame-sl/mo5_cart.zip/mo5_cart/";;
*"/thomson/MO5 Cass MAME/"*) core="mame_libretro mo5 -autoboot_command 'RUN\"\"\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mo5_cass.zip/mo5_cass/";;
*"/thomson/MO5 Flop MAME/"*) core="mame_libretro mo5 -flop"; src="https://archive.org/download/mame-sl/mame-sl/mo5_flop.zip/mo5_flop/";;
*"/thomson/MO6 Cass MAME/"*) core="mame_libretro mo6 -autoboot_command '2\nRUN\"\"\n' -autoboot_delay 5 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mo6_cass.zip/mo6_cass/";;
*"/thomson/MO6 Flop MAME/"*) core="mame_libretro mo6 -flop"; src="https://archive.org/download/mame-sl/mame-sl/mo6_flop.zip/mo6_flop/";;
*"/thomson/TO Flop MAME/"*) core="mame_libretro to8 -flop"; src="https://archive.org/download/mame-sl/mame-sl/to_flop.zip/to_flop/";;
*"/thomson/TO7 Cart MAME/"*) core="mame_libretro to7 -cart"; src="https://archive.org/download/mame-sl/mame-sl/to7_cart.zip/to7_cart/";;
*"/thomson/TO7 Cass MAME/"*) core="mame_libretro to7 -cart basic -autoboot_command '1\nRUN\"\"\n' -autoboot_delay 5 -cass"; src="https://archive.org/download/mame-sl/mame-sl/to7_cass.zip/to7_cass/";;
*"/thomson/TO8 Cass MAME/"*) core="mame_libretro to8 -autoboot_command '2\nRUN\"\"\n' -autoboot_delay 5 -cass"; src="https://archive.org/download/mame-sl/mame-sl/to8_cass.zip/to8_cass/";;
*"/thomson/MO5 QD MAME/"*) core="mame_libretro mo5 -flop"; src="https://archive.org/download/mame-sl/mame-sl/mo5_qd.zip/mo5_qd/";;
*"/thomson/TO7 QD MAME/"*) core="mame_libretro to7 -flop"; src="https://archive.org/download/mame-sl/mame-sl/to7_qd.zip/to7_qd/";;
*"/thomson/TO8 QD MAME/"*) core="mame_libretro to8 -flop"; src="https://archive.org/download/mame-sl/mame-sl/to8_qd.zip/to8_qd/";;
*"/rainbow/MAME/"*) core="mame_libretro rainbow -flop1"; src="https://archive.org/download/mame-sl/mame-sl/rainbow.zip/rainbow/";;
*"/tiki100/MAME/"*) core="mame_libretro tiki100 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/tiki100.zip/tiki100/";;
*"/pro128/Cass MAME/"*) core="mame_libretro pro128 -autoboot_command 'RUN\"CASS:\"\n' -autoboot_delay 8 -cass"; src="https://archive.org/download/mame-sl/mame-sl/pro128_cass.zip/pro128_cass/";;
*"/pro128/Cart MAME/"*) core="mame_libretro pro128 -cart"; src="https://archive.org/download/mame-sl/mame-sl/pro128_cart.zip/pro128_cart/";;
*"/pro128/Flop MAME/"*) core="mame_libretro pro128 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/pro128_flop.zip/pro128_flop/";;
*"/pro128s/MAME/"*) core="mame_libretro pro128s -flop1"; src="https://archive.org/download/mame-sl/mame-sl/pro128s_flop.zip/pro128s_flop/";;
*"/archimedes/TOSEC/"*) core="mame_libretro aa4401 -flop"; src="https://archive.org/download/tosec-main/Acorn/Archimedes/Compilations/Games/%5BADF%5D/Acorn%20Archimedes%20-%20Compilations%20-%20Games%20-%20%5BADF%5D%20%28TOSEC-v2021-12-11%29.zip/";;
*"/archimedes/App/"*) core="mame_libretro aa4401 -flop"; src="https://archive.org/download/tosec-main/Acorn/Archimedes/Applications/%5BADF%5D/Acorn%20Archimedes%20-%20Applications%20-%20%5BADF%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/archimedes/Demo [ADF]/"*) core="mame_libretro aa4401 -flop"; src="https://archive.org/download/tosec-main/Acorn/Archimedes/Demos/%5BADF%5D/Acorn%20Archimedes%20-%20Demos%20-%20%5BADF%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/archimedes/Edu/"*) core="mame_libretro aa4401 -flop"; src="https://archive.org/download/tosec-main/Acorn/Archimedes/Educational/Acorn%20Archimedes%20-%20Educational%20%28TOSEC-v2021-12-11%29.zip/";;
*"/archimedes/MAME/"*) core="mame_libretro aa4401 -flop"; src="https://archive.org/download/mame-sl/mame-sl/archimedes.zip/archimedes/";;
*"/pc60/MAME/"*) core="mame_libretro pc6001 -cart1"; src="https://archive.org/download/mame-sl/mame-sl/pc6001_cart.zip/pc6001_cart/";;
*"/pc80/PC-8001 N-BASIC Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1"; src="https://archive.org/download/mame-sl/mame-sl/pc8001_flop.zip/pc8001_flop/";;
*"/pc80/PC-8001mkII N80 Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1"; src="https://archive.org/download/mame-sl/mame-sl/pc8001mk2_flop.zip/pc8001mk2_flop/";;
*"/pc80/PC-8001mkIISR N80SR Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1"; src="https://archive.org/download/mame-sl/mame-sl/pc8001mk2sr_flop.zip/pc8001mk2sr_flop/";;
*"/pc88/TOSEC/"*) core="quasi88_libretro"; src="https://archive.org/download/tosec-main/NEC/PC-8801/Games/%5BCAS%5D/NEC%20PC-8801%20-%20Games%20-%20%5BCAS%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/pc88/Demo/"*) core="quasi88_libretro"; src="https://archive.org/download/tosec-main/NEC/PC-8801/Demos/NEC%20PC-8801%20-%20Demos%20%28TOSEC-v2014-04-23%29.zip/";;
*"/pc88/Flop MAME/"*) core="mame_libretro pc8801 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/pc8801_flop.zip/pc8801_flop/";;
*"/pc88/Cass MAME/"*) core="mame_libretro pc8801 -cass"; src="https://archive.org/download/mame-sl/mame-sl/pc8801_cass.zip/pc8801_cass/";;
*"/pc98/TOSEC/"*) core="np2kai_libretro"; src="https://archive.org/download/tosec-main/NEC/PC-9801/Games/%5BD88%5D/NEC%20PC-9801%20-%20Games%20-%20%5BD88%5D%20%28TOSEC-v2024-07-03%29.zip/";;
*"/pc98/MAME/"*) core="mame_libretro pc9801 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/pc98.zip/pc98/";;
*"/pc98/CHD/"*) core="mame_libretro pc9821 -cdrm"; src="https://archive.org/download/mame-software-list-chds-2/pc98_cd/";;
*"/pc98/CD MAME/"*) core="mame_libretro pc9821 -cdrm"; src="https://archive.org/download/mame-sl/mame-sl/pc98_cd.zip/pc98_cd/";;
*"/pc98/PC-9821 TOSEC/"*) core="np2kai_libretro"; src="https://archive.org/download/tosec-main/NEC/PC-9821/Games/%5BFDD%5D/NEC%20PC-9821%20-%20Games%20-%20%5BFDD%5D%20%28TOSEC-v2023-06-14%29.zip/";;
*"/pcengine/NoIntro/"*) core="mednafen_pce_fast_libretro"; src="https://archive.org/download/ni-roms/roms/NEC%20-%20PC%20Engine%20-%20TurboGrafx-16.zip/";;
*"/pcengine/TOSEC/"*) core="mednafen_pce_fast_libretro"; src="https://archive.org/download/tosec-main/NEC/PC-Engine%20%26%20TurboGrafx-16/Games/NEC%20PC-Engine%20%26%20TurboGrafx-16%20-%20Games%20%28TOSEC-v2024-07-03%29.zip/";;
*"/pcengine/Demo/"*) core="mednafen_pce_fast_libretro"; src="https://archive.org/download/tosec-main/NEC/PC-Engine%20%26%20TurboGrafx-16/Demos/NEC%20PC-Engine%20%26%20TurboGrafx-16%20-%20Demos%20%28TOSEC-v2022-06-08%29.zip/";;
*"/pcengine/MAME/"*) core="mame_libretro pce -cart"; src="https://archive.org/download/mame-sl/mame-sl/pce.zip/pce/";;
*"/pcengine/TurboGrafx MAME/"*) core="mame_libretro tg16 -cart"; src="https://archive.org/download/mame-sl/mame-sl/tg16.zip/tg16/";;
*"/pcengine/PCE TourVision MAME/"*) core="mame_libretro tourvis -cart"; src="https://archive.org/download/mame-sl/mame-sl/pce_tourvision.zip/pce_tourvision/";;
*"/supergrafx/NoIntro/"*) core="mednafen_supergrafx_libretro"; src="https://archive.org/download/ni-roms/roms/NEC%20-%20PC%20Engine%20SuperGrafx.zip/";;
*"/supergrafx/TOSEC/"*) core="mednafen_supergrafx_libretro"; src="https://archive.org/download/tosec-main/NEC/SuperGrafx/Games/NEC%20SuperGrafx%20-%20Games%20%28TOSEC-v2021-12-11%29.zip/";;
*"/supergrafx/MAME/"*) core="mame_libretro sgx -cart"; src="https://archive.org/download/mame-sl/mame-sl/sgx.zip/sgx/";;
*"/pcenginecd/Redump/"*) core="mednafen_pce_fast_libretro"; ext="cue"; src="https://archive.org/download/nec-pc-engine-cd-turbografx-cd-redump/";;
*"/pcenginecd/ISO/"*) core="mednafen_pce_fast_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-nec/PC-Engine%20CD%20%26%20TurboGrafx-16%20CD/Games/%5BIMG%5D/";;
*"/pcenginecd/NonRedump/"*) core="mednafen_pce_fast_libretro"; ext="cue"; src="https://archive.org/download/non-redump_nec-pc-engine-cd-turbografx-cd/";;
*"/pcenginecd/CHD/"*) core="mame_libretro pce -cdrm"; src="https://archive.org/download/mame-software-list-chds-2/pcecd/";;
*"/pcfx/Redump/"*) core="mednafen_pcfx_libretro"; ext="cue"; src="https://archive.org/download/nec-pc-fx-pc-fxga-redump/";;
*"/pcfx/ISO/"*) core="mednafen_pcfx_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-nec/PC-FX/Games/";;
*"/fm7/NoIntro/"*) core="mame_libretro fm7 -flop1"; src="https://archive.org/download/ni-roms/roms/Fujitsu%20-%20FM-7%20%28Sector%29.zip/";;
*"/fm7/Games T77/"*) core="mame_libretro fm7 -autoboot_command 'RUN\\n' -autoboot_delay 5 -cass,"; ext="Fujitsu - Micro 7"; src="https://archive.org/download/tosec-main/Fujitsu/FM-7/Games/%5BT77%5D/Fujitsu%20FM-7%20-%20Games%20-%20%5BT77%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/fm7/Games D77/"*) core="mame_libretro fm7 -flop1"; src="https://archive.org/download/tosec-main/Fujitsu/FM-7/Games/%5BD77%5D/Fujitsu%20FM-7%20-%20Games%20-%20%5BD77%5D%20%28TOSEC-v2011-02-07%29.zip/";;
*"/fm7/MAME/"*) core="mame_libretro fm7 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/fm7_disk.zip/fm7_disk/";;
*"/fm7/FM-7 Cass MAME/"*) core="mame_libretro fm7 -autoboot_command 'RUN\"\"\n' -autoboot_delay 5 -cass"; src="https://archive.org/download/mame-sl/mame-sl/fm7_cass.zip/fm7_cass/";;
*"/fm7/FM-8 Cass MAME/"*) core="mame_libretro fm8 -autoboot_command 'RUN\"\"\n' -autoboot_delay 5 -cass"; src="https://archive.org/download/mame-sl/mame-sl/fm8_cass.zip/fm8_cass/";;
*"/fm7/FM-77AV Flop MAME/"*) core="mame_libretro fm77av -flop1"; src="https://archive.org/download/mame-sl/mame-sl/fm77av.zip/fm77av/";;
*"/fm7/FM-77AV TOSEC/"*) core="mame_libretro fm77av -flop1"; src="https://archive.org/download/tosec-main/Fujitsu/FM77-AV/Games/%5BD77%5D/Fujitsu%20FM77-AV%20-%20Games%20-%20%5BD77%5D%20%28TOSEC-v2018-07-01%29.zip/";;
*"/fm7/Demo [D77]/"*) core="mame_libretro fm7 -flop1"; src="https://archive.org/download/tosec-main/Fujitsu/FM-7/Demos/%5BD77%5D/Fujitsu%20FM-7%20-%20Demos%20-%20%5BD77%5D%20%28TOSEC-v2011-02-07%29.zip/";;
*"/fm7/Demo [T77]/"*) core="mame_libretro fm7 -flop1"; src="https://archive.org/download/tosec-main/Fujitsu/FM-7/Demos/%5BT77%5D/Fujitsu%20FM-7%20-%20Demos%20-%20%5BT77%5D%20%28TOSEC-v2011-02-07%29.zip/";;
*"/fm7/Demo/"*) core="mame_libretro fm7 -flop1"; src="https://archive.org/download/tosec-main/Fujitsu/FM77-AV/Demos/Fujitsu%20FM77-AV%20-%20Demos%20%28TOSEC-v2018-07-01%29.zip/";;
*"/fmtowns/Redump/"*) core="mame_libretro fmtmarty -cdrm"; src="https://archive.org/download/noaen-redump-fujitsu-fm-towns/";;
*"/fmtowns/MAME/"*) core="mame_libretro fmtmarty -cdrm"; src="https://archive.org/download/mame-sl/mame-sl/fmtowns_cd.zip/fmtowns_cd/";;
*"/fmtowns/CHD/"*) core="mame_libretro fmtmarty -cdrm"; src="https://archive.org/download/mame-software-list-chds-2/fmtowns_cd/";;
*"/fmtowns/Flop Orig MAME/"*) core="mame_libretro fmtowns -flop1"; src="https://archive.org/download/mame-sl/mame-sl/fmtowns_flop_orig.zip/fmtowns_flop_orig/";;
*"/fmtowns/Flop Misc MAME/"*) core="mame_libretro fmtowns -flop1"; src="https://archive.org/download/mame-sl/mame-sl/fmtowns_flop_misc.zip/fmtowns_flop_misc/";;
*"/fmtowns/Games/"*) core="mame_libretro fmtmarty -cdrm"; src="https://archive.org/download/tosec-main/Fujitsu/FM%20Towns/Games/%5BBIN%5D/Fujitsu%20FM%20Towns%20-%20Games%20-%20%5BBIN%5D%20%28TOSEC-v2020-07-12%29.zip/";;
*"/fmtowns/Cracked MAME/"*) core="mame_libretro fmtowns -flop1"; src="https://archive.org/download/mame-sl/mame-sl/fmtowns_flop_cracked.zip/fmtowns_flop_cracked/";;
*"/x1/Games/"*) core="x1_libretro"; src="https://archive.org/download/tosec-main/Sharp/X1/Games/%5B2D%5D/Sharp%20X1%20-%20Games%20-%20%5B2D%5D%20%28TOSEC-v2021-07-25%29.zip/";;
*"/x1/Cass MAME/"*) core="mame_libretro x1 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/x1_cass.zip/x1_cass/";;
*"/x1/Flop MAME/"*) core="mame_libretro x1 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/x1_flop.zip/x1_flop/";;
*"/x68000/DIM/"*) core="px68k_libretro"; src="https://archive.org/download/tosec-main/Sharp/X68000/Games/%5BDIM%5D/Sharp%20X68000%20-%20Games%20-%20%5BDIM%5D%20%28TOSEC-v2014-05-13%29.zip/";;
*"/x68000/App/"*) core="px68k_libretro"; src="https://archive.org/download/tosec-main/Sharp/X68000/Applications/Sharp%20X68000%20-%20Applications%20%28TOSEC-v2014-05-13%29.zip/";;
*"/x68000/Demo/"*) core="px68k_libretro"; src="https://archive.org/download/tosec-main/Sharp/X68000/Demos/Sharp%20X68000%20-%20Demos%20%28TOSEC-v2024-01-15%29.zip/";;
*"/x68000/MAME/"*) core="mame_libretro x68000 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/x68k_flop.zip/x68k_flop/";;
*"/mz700/Games/"*) core="mame_libretro mz700 -autoboot_command 'L\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/tosec-main/Sharp/MZ-700/Games/%5BMZF%5D/Sharp%20MZ-700%20-%20Games%20-%20%5BMZF%5D%20%28TOSEC-v2025-01-15%29.zip/";;
*"/mz700/MAME/"*) core="mame_libretro mz700 -autoboot_command 'L\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mz700_cass.zip/mz700_cass/";;
*"/mz800/Games/"*) core="mame_libretro mz800 -autoboot_command 'L\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/tosec-main/Sharp/MZ-800%20%26%20MZ-1500/Games/%5BMZF%5D/Sharp%20MZ-800%20%26%20MZ-1500%20-%20Games%20-%20%5BMZF%5D%20%28TOSEC-v2022-06-08%29.zip/";;
*"/mz800/MAME/"*) core="mame_libretro mz800 -autoboot_command 'L\n' -autoboot_delay 3 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mz800_cass.zip/mz800_cass/";;
*"/mz2000/MZT/"*) core="mame_libretro mz2000 -autoboot_command 'C' -autoboot_delay 5 -cass"; src="https://archive.org/download/tosec-main/Sharp/MZ-2000%20%26%20MZ-2200/Games/%5BMTW%5D/Sharp%20MZ-2000%20%26%20MZ-2200%20-%20Games%20-%20%5BMTW%5D%20%28TOSEC-v2024-01-15%29.zip/";;
*"/mz2000/MAME/"*) core="mame_libretro mz2000 -autoboot_command 'C' -autoboot_delay 5 -cass"; src="https://archive.org/download/mame-sl/mame-sl/mz2000_cass.zip/mz2000_cass/";;
*"/mz2000/Flop MAME/"*) core="mame_libretro mz2000 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/mz2000_flop.zip/mz2000_flop/";;
*"/mz2500/MAME/"*) core="mame_libretro mz2500 -flop1"; src="https://archive.org/download/mame-sl/mame-sl/mz2500.zip/mz2500/";;
*"/pv1000/NoIntro/"*) core="mame_libretro pv1000 -cart"; src="https://archive.org/download/ni-roms/roms/Casio%20-%20PV-1000.zip/";;
*"/pv1000/TOSEC/"*) core="mame_libretro pv1000 -cart"; src="https://archive.org/download/tosec-main/Casio/PV-1000/Games/Casio%20PV-1000%20-%20Games%20%28TOSEC-v2023-10-03%29.zip/";;
*"/pv1000/MAME/"*) core="mame_libretro pv1000 -cart"; src="https://archive.org/download/mame-sl/mame-sl/pv1000.zip/pv1000/";;
*"/pv2000/TOSEC/"*) core="mame_libretro pv2000 -cart"; src="https://archive.org/download/tosec-main/Casio/PV-2000/Games/Casio%20PV-2000%20-%20Games%20%28TOSEC-v2022-06-08%29.zip/";;
*"/pv2000/MAME/"*) core="mame_libretro pv2000 -cart"; src="https://archive.org/download/mame-sl/mame-sl/pv2000.zip/pv2000/";;
*"/loopy/NoIntro/"*) core="mame_libretro casloopy -cart"; src="https://archive.org/download/ni-roms/roms/Casio%20-%20Loopy%20%28LittleEndian%29.zip/";;
*"/loopy/TOSEC/"*) core="mame_libretro casloopy -cart"; src="https://archive.org/download/tosec-main/Casio/Loopy/Games/Multipart/Casio%20Loopy%20-%20Games%20-%20Multipart%20%28TOSEC-v2018-03-08%29.zip/";;
*"/loopy/MAME/"*) core="mame_libretro casloopy -cart"; src="https://archive.org/download/mame-sl/mame-sl/casloopy.zip/casloopy/";;
*"/amigacdtv/Redump/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/commodore-amiga-cdtv-redump/";;
*"/amigacdtv/ISO/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga%20CDTV/Games/%5BISO%5D/";;
*"/amigacdtv/App/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga%20CDTV/Applications/%5BISO%5D/";;
*"/amigacdtv/Edu/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga%20CDTV/Educational/%5BISO%5D/";;
*"/amigacdtv/Multimedia/"*) core="puae_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-commodore/Amiga%20CDTV/Multimedia/%5BISO%5D/";;
*"/amigacdtv/CHD/"*) core="mame_libretro cdtv -cdrm"; src="https://archive.org/download/mame-software-list-chds-2/cdtv/";;
*"/cdi/Redump/"*) core="same_cdi_libretro"; ext="cue"; src="https://archive.org/download/ef_Philips_cd-i_redump_2300/";;
*"/cdi/NonRedump/"*) core="same_cdi_libretro"; ext="cue"; src="https://archive.org/download/non-redump_philips-cdi/";;
*"/cdi/TOSEC/"*) core="same_cdi_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-philips/CD-i/Games/";;
*"/cdi/App/"*) core="same_cdi_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-philips/CD-i/Applications/";;
*"/cdi/Edu/"*) core="same_cdi_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-philips/CD-i/Educational/";;
*"/cdi/Multimedia/"*) core="same_cdi_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-philips/CD-i/Multimedia/";;
*"/cdi/CHD/"*) core="mame_libretro cdimono1 -cdrm"; src="https://archive.org/download/mame-software-list-chds-2/cdi/";;
*"/3do/Redump/"*) core="opera_libretro"; ext="cue"; src="https://archive.org/download/ef_panasonic_3do_redump_set_661/";;
*"/3do/NonRedump/"*) core="opera_libretro"; ext="cue"; src="https://archive.org/download/non-redump_panasonic_3do/";;
*"/3do/TOSEC/"*) core="opera_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-3do/3DO%20Interactive%20Multiplayer/Games/";;
*"/3do/App/"*) core="opera_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-3do/3DO%20Interactive%20Multiplayer/Applications/%5BISO%5D/";;
*"/3do/Edu/"*) core="opera_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-3do/3DO%20Interactive%20Multiplayer/Educational/%5BISO%5D/";;
*"/3do/Multimedia/"*) core="opera_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-3do/3DO%20Interactive%20Multiplayer/Multimedia/";;
*"/nuon/Redump/"*) core="nuance_libretro"; ext="iso"; src="https://archive.org/download/vm_labs_nuon/";;
*"/vis/Edu/"*) core="mame_libretro vis -cdrm"; ext="cue"; src="https://archive.org/download/tosec-iso-memorex/Video%20Information%20System/Educational/";;
*"/vis/Games/"*) core="mame_libretro vis -cdrm"; ext="cue"; src="https://archive.org/download/tosec-iso-memorex/Video%20Information%20System/Games/";;
*"/vis/Multimedia/"*) core="mame_libretro vis -cdrm"; ext="cue"; src="https://archive.org/download/tosec-iso-memorex/Video%20Information%20System/Multimedia/";;
*"/mame/Merged/"*) core="mame_libretro"; src="https://archive.org/download/mame-roms-merged_/MAME%20ROMs%20%28merged%29/";;
*"/mame/Non-Merged/"*) core="mame_libretro"; src="https://archive.org/download/mame-0.264-roms-non-merged/";;
*"/mame/Split/"*) core="mame_libretro"; src="https://archive.org/download/mame-0.260-roms-split_202310/";;
*"/mame/2000/"*) core="mame_libretro"; src="https://archive.org/download/MAME0.37b5_MAME2000_Reference_Set_Update_2_ROMs_Samples/roms/";;
*"/mame/2003/"*) core="mame_libretro"; src="https://archive.org/download/MAME2003_Reference_Set_MAME0.78_ROMs_CHDs_Samples/roms/";;
*"/mame/2006/"*) core="mame_libretro"; src="https://archive.org/download/MAME0.106-Reference-Set-ROMs-CHDs-Samples/MAME0.106Non-Merged.zip/";;
*"/mame/2010/"*) core="mame_libretro"; src="https://archive.org/download/MAME_2010_full_nonmerged_romsets/roms.zip/roms/";;
*"/mame/2015/"*) core="mame_libretro"; src="https://archive.org/download/MAME_2015_arcade_romsets/roms.zip/roms/";;
*"/mame/2016/"*) core="mame_libretro"; src="https://archive.org/download/MAME_2016_Arcade_Romsets/roms.zip/roms/";;
*"/vgmplay/MAME/"*) core="mame_libretro vgmplay -quik"; src="https://archive.org/download/mame-sl/mame-sl/vgmplay.zip/vgmplay/";;
*"/fbneo/FinalBurn Neo/"*) core="fbneo_libretro"; src="https://archive.org/download/FBNEOPACK/";;
*"/neogeo/MAME/"*) core="mame_libretro aes -cart"; src="https://archive.org/download/mame-sl/mame-sl/neogeo.zip/neogeo/";;
*"/neogeocd/Redump/"*) core="neocd_libretro"; ext="cue"; src="https://archive.org/download/snk-neo-geo-cd-redump/";;
*"/neogeocd/ISO/"*) core="neocd_libretro"; ext="cue"; src="https://archive.org/download/tosec-iso-snk/Neo-Geo%20CD/Games/%5BISO%5D/";;
*"/ngp/NoIntro/"*) core="mednafen_ngp_libretro"; src="https://archive.org/download/ni-roms/roms/SNK%20-%20NeoGeo%20Pocket.zip/";;
*"/ngp/TOSEC/"*) core="mednafen_ngp_libretro"; src="https://archive.org/download/tosec-main/SNK/Neo-Geo%20Pocket/Games/SNK%20Neo-Geo%20Pocket%20-%20Games%20%28TOSEC-v2022-06-08%29.zip/";;
*"/ngp/MAME/"*) core="mame_libretro ngp -cart"; src="https://archive.org/download/mame-sl/mame-sl/ngp.zip/ngp/";;
*"/ngpc/NoIntro/"*) core="mednafen_ngp_libretro"; src="https://archive.org/download/ni-roms/roms/SNK%20-%20NeoGeo%20Pocket%20Color.zip/";;
*"/ngpc/TOSEC/"*) core="mednafen_ngp_libretro"; src="https://archive.org/download/tosec-main/SNK/Neo-Geo%20Pocket%20Color/Games/SNK%20Neo-Geo%20Pocket%20Color%20-%20Games%20%28TOSEC-v2023-11-07%29.zip/";;
*"/ngpc/Demo/"*) core="mednafen_ngp_libretro"; src="https://archive.org/download/tosec-main/SNK/Neo-Geo%20Pocket%20Color/Demos/SNK%20Neo-Geo%20Pocket%20Color%20-%20Demos%20%28TOSEC-v2014-07-01%29.zip/";;
*"/ngpc/MAME/"*) core="mame_libretro ngpc -cart"; src="https://archive.org/download/mame-sl/mame-sl/ngpc.zip/ngpc/";;
*"/gamepock/NoIntro/"*) core="mame_libretro gamepock -cart"; src="https://archive.org/download/ni-roms/roms/Epoch%20-%20Game%20Pocket%20Computer.zip/";;
*"/gamepock/MAME/"*) core="mame_libretro gamepock -cart"; src="https://archive.org/download/mame-sl/mame-sl/gamepock.zip/gamepock/";;
*"/supervision/NoIntro/"*) core="potator_libretro"; src="https://archive.org/download/ni-roms/roms/Watara%20-%20Supervision.zip/";;
*"/supervision/TOSEC/"*) core="potator_libretro"; src="https://archive.org/download/tosec-main/Watara/Supervision/Games/Watara%20Supervision%20-%20Games%20%28TOSEC-v2024-01-15%29.zip/";;
*"/supervision/MAME/"*) core="mame_libretro svision -cart"; src="https://archive.org/download/mame-sl/mame-sl/svision.zip/svision/";;
*"/wswan/NoIntro/"*) core="mednafen_wswan_libretro"; src="https://archive.org/download/ni-roms/roms/Bandai%20-%20WonderSwan.zip/";;
*"/wswan/TOSEC/"*) core="mednafen_wswan_libretro"; src="https://archive.org/download/tosec-main/Bandai/WonderSwan/Games/Bandai%20WonderSwan%20-%20Games%20%28TOSEC-v2023-11-07%29.zip/";;
*"/wswan/Demo/"*) core="mednafen_wswan_libretro"; src="https://archive.org/download/tosec-main/Bandai/WonderSwan/Demos/Bandai%20WonderSwan%20-%20Demos%20%28TOSEC-v2023-10-03%29.zip/";;
*"/wswan/MAME/"*) core="mame_libretro wswan -cart"; src="https://archive.org/download/mame-sl/mame-sl/wswan.zip/wswan/";;
*"/wswan/Pocket Challenge 2 NoIntro/"*) core="mednafen_wswan_libretro"; src="https://archive.org/download/ni-roms/roms/Benesse%20-%20Pocket%20Challenge%20V2.zip/";;
*"/wswanc/NoIntro/"*) core="mednafen_wswan_libretro"; src="https://archive.org/download/ni-roms/roms/Bandai%20-%20WonderSwan%20Color.zip/";;
*"/wswanc/TOSEC/"*) core="mednafen_wswan_libretro"; src="https://archive.org/download/tosec-main/Bandai/WonderSwan%20Color/Games/Bandai%20WonderSwan%20Color%20-%20Games%20%28TOSEC-v2024-07-03%29.zip/";;
*"/wswanc/Demo/"*) core="mednafen_wswan_libretro"; src="https://archive.org/download/tosec-main/Bandai/WonderSwan%20Color/Demos/Bandai%20WonderSwan%20Color%20-%20Demos%20%28TOSEC-v2024-07-03%29.zip/";;
*"/wswanc/MAME/"*) core="mame_libretro wscolor -cart"; src="https://archive.org/download/mame-sl/mame-sl/wscolor.zip/wscolor/";;
*"/megaduck/NoIntro/"*) core="mame_libretro megaduck -cart"; src="https://archive.org/download/ni-roms/roms/Welback%20-%20Mega%20Duck.zip/";;
*"/megaduck/MAME/"*) core="mame_libretro megaduck -cart"; src="https://archive.org/download/mame-sl/mame-sl/megaduck.zip/megaduck/";;
*"/microvision/MAME/"*) core="mame_libretro microvsn -cart"; src="https://archive.org/download/mame-sl/mame-sl/microvision.zip/microvision/";;
*"/gamate/NoIntro/"*) core="mame_libretro gamate -cart"; src="https://archive.org/download/ni-roms/roms/Bit%20Corporation%20-%20Gamate.zip/";;
*"/gamate/Games/"*) core="mame_libretro gamate -cart"; src="https://archive.org/download/tosec-main/Bit%20Corporation/Gamate/Games/Bit%20Corporation%20Gamate%20-%20Games%20%28TOSEC-v2025-01-15%29.zip/";;
*"/gamate/MAME/"*) core="mame_libretro gamate -cart"; src="https://archive.org/download/mame-sl/mame-sl/gamate.zip/gamate/";;
*"/juicebox/MAME/"*) core="mame_libretro juicebox"; src="https://archive.org/download/mame-sl/mame-sl/juicebox.zip/juicebox/";;
*"/gmaster/NoIntro/"*) core="mame_libretro gmaster -cart"; src="https://archive.org/download/ni-roms/roms/Hartung%20-%20Game%20Master.zip/";;
*"/gmaster/TOSEC/"*) core="mame_libretro gmaster -cart"; src="https://archive.org/download/tosec-main/Hartung/Game%20Master/Games/Hartung%20Game%20Master%20-%20Games%20%28TOSEC-v2021-07-25%29.zip/";;
*"/gmaster/MAME/"*) core="mame_libretro gmaster -cart"; src="https://archive.org/download/mame-sl/mame-sl/gmaster.zip/gmaster/";;
*"/gamecom/NoIntro/"*) core="mame_libretro gamecom -cart1"; src="https://archive.org/download/ni-roms/roms/Tiger%20-%20Game.com.zip/";;
*"/gamecom/TOSEC/"*) core="mame_libretro gamecom -cart1"; src="https://archive.org/download/tosec-main/Tiger%20Electronics/Game.com/Games/Tiger%20Electronics%20Game.com%20-%20Games%20%28TOSEC-v2014-06-06%29.zip/";;
*"/gamecom/MAME/"*) core="mame_libretro gamecom -cart1"; src="https://archive.org/download/mame-sl/mame-sl/gamecom.zip/gamecom/";;
*"/gp32/NoIntro/"*) core="mame_libretro gp32 -memc"; src="https://archive.org/download/ni-roms/roms/GamePark%20-%20GP32.zip/";;
*"/gp32/TOSEC/"*) core="mame_libretro gp32 -memc"; src="https://archive.org/download/tosec-main/Game%20Park/GP32/Games/%5BFPK%5D/Game%20Park%20GP32%20-%20Games%20-%20%5BFPK%5D%20%28TOSEC-v2012-08-27%29.zip/";;
*"/gp32/MAME/"*) core="mame_libretro gp32 -memc"; src="https://archive.org/download/mame-sl/mame-sl/gp32.zip/gp32/";;
*"/advision/NoIntro/"*) core="mame_libretro advision -cart"; src="https://archive.org/download/ni-roms/roms/Entex%20-%20Adventure%20Vision.zip/";;
*"/advision/TOSEC/"*) core="mame_libretro advision -cart"; src="https://archive.org/download/tosec-main/Entex/Adventure%20Vision/Games/Entex%20Adventure%20Vision%20-%20Games%20%28TOSEC-v2014-01-23%29.zip/";;
*"/advision/MAME/"*) core="mame_libretro advision -cart"; src="https://archive.org/download/mame-sl/mame-sl/advision.zip/advision/";;
*"/mononcolor/MAME/"*) core="mame_libretro mononcol -cart"; src="https://archive.org/download/mame-sl/mame-sl/monon_color.zip/monon_color/";;
*"/gameking/MAME/"*) core="mame_libretro gameking -cart"; src="https://archive.org/download/mame-sl/mame-sl/gameking.zip/gameking/";;
*"/gameking3/MAME/"*) core="mame_libretro gamekin3 -cart"; src="https://archive.org/download/mame-sl/mame-sl/gameking3.zip/gameking3/";;
*"/j2me/NoIntro/"*) core="freej2me_libretro"; ext="jar"; src="https://archive.org/download/ni-roms/roms/Mobile%20-%20J2ME.zip/";;
*"/palm/NoIntro/"*) core="mu_libretro"; ext="prc"; src="https://archive.org/download/ni-roms/roms/Mobile%20-%20Palm%20OS%20%28Digital%29.zip/";;
esac

if [[ -n "$src" && ! -e "$1" ]]; then
  mkdir -p "$(dirname "$1")"
  relpath="${1#$HOME/share/roms/}"
  inner="${relpath#*/}"; inner="${inner#*/}"
  urlenc() { local LC_ALL=C s="$1" i c e=""; for ((i=0;i<${#s};i++)); do c="${s:i:1}"; case "$c" in [/a-zA-Z0-9._~-]) e+="$c";; *) printf -v c '%%%02X' "'$c"; e+="$c";; esac; done; printf '%s' "$e"; }
  enc=$(urlenc "$inner")
  fname="${1##*/}"
  ia_auth=""
  if [[ -f ~/.config/rclone/rclone.conf ]]; then
    ia_key=$(awk '/^\[archive\]/{f=1;next} /^\[/{f=0} f && /access_key_id/{print $3;exit}' ~/.config/rclone/rclone.conf)
    ia_sec=$(awk '/^\[archive\]/{f=1;next} /^\[/{f=0} f && /secret_access_key/{print $3;exit}' ~/.config/rclone/rclone.conf)
    [[ -n "$ia_key" && -n "$ia_sec" ]] && ia_auth="LOW ${ia_key}:${ia_sec}"
  fi
  echo "Fetching $fname ..." >&2
  if ! curl -sfL --location-trusted ${ia_auth:+-H "Authorization: $ia_auth"} -o "$1" "${src}${enc}"; then
    rm -f "$1"
    echo "Download failed: ${src}${enc}" >&2
    exit 1
  fi
fi

if [ -n "$ext" ]; then
  umount -l ~/iso
  if [[ "$1" == *.rar ]]; then
    ratarmount "$1" ~/iso
  else
    mount-zip "$1" ~/iso
  fi
  rom=$(find ~/iso -type f -name "*.${ext}" | head -n 1)
elif [[ "$1" == *.rar ]]; then
  umount -l ~/iso; ratarmount "$1" ~/iso
  rom=~/iso
else
  rom="$1"
fi

# Ensure the libretro core exists locally: look in the native and flatpak
# cores directories, fetch from the libretro buildbot if missing, and as a
# last resort fall back to an installed core with the same name stem
# (e.g. stella -> stella2014 on arches the buildbot doesn't cover).
if [[ "$core" == *libretro* ]]; then
  corebin="${core%% *}"
  # Flatpak cores dir first: on flatpak-RetroArch machines a same-named core
  # in ~/.config may be built against the wrong libc for the sandbox.
  coredirs=()
  [[ -d "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/cores" ]] && coredirs+=("$HOME/.var/app/org.libretro.RetroArch/config/retroarch/cores")
  coredirs+=("$HOME/.config/retroarch/cores")
  corepath=""
  for d in "${coredirs[@]}"; do [[ -e "$d/$corebin.so" ]] && { corepath="$d/$corebin.so"; break; }; done
  if [[ -z "$corepath" ]]; then
    case "$(uname -m)" in
      x86_64) barch="x86_64";;
      aarch64|arm64) barch="aarch64";;
      armv7l|armv6l) barch="armhf";;
      *) barch="";;
    esac
    if [[ -n "$barch" ]]; then
      echo "Fetching core $corebin ($barch) from the libretro buildbot ..." >&2
      dl="${coredirs[0]}"
      mkdir -p "$dl"
      tmpz=$(mktemp)
      if curl -sfL "https://buildbot.libretro.com/nightly/linux/${barch}/latest/${corebin}.so.zip" -o "$tmpz" && unzip -oq "$tmpz" -d "$dl"; then
        corepath="$dl/$corebin.so"
      fi
      rm -f "$tmpz"
    fi
  fi
  if [[ -z "$corepath" ]]; then
    stem="${corebin%_libretro}"
    for d in "${coredirs[@]}"; do
      alt=$(ls "$d" 2>/dev/null | grep -E "^${stem}[^/]*_libretro\.so$" | head -n 1)
      [[ -n "$alt" ]] && { corepath="$d/$alt"; echo "Core $corebin unavailable; using ${alt%.so} instead" >&2; break; }
    done
  fi
  if [[ -z "$corepath" ]]; then
    echo "Core $corebin is not installed and the buildbot has no build for this system; install it via RetroArch's Online Updater." >&2
    exit 1
  fi
fi

if [[ "$core" == "mame_libretro" || "$core" == "mame_libretro "* ]]; then
  if [[ -z "$ext" ]]; then
    rompath="$(dirname "$1");$HOME/share/bios"
    rom="$(basename "${1%.*}")"
  fi
  case "$1" in
    */model2/*|*/model3/*) rompath="$HOME/share/roms/mame/MAME;$HOME/share/bios" ;;
  esac
  core=$(echo "$core" | sed -E 's|(-hard[0-9]+) ([a-z0-9_]+):([a-z0-9_]+)|\1 '"$HOME"'/share/bios/\2/\3/\3.chd|g')
  mame_args="${core#mame_libretro}"; mame_args="${mame_args# }"
  filename="${rom##*/}"; basename="${filename%.*}"
  hashpath_opt=""
  [[ -d /usr/share/games/mame/hash ]] && hashpath_opt=" -hashpath /usr/share/games/mame/hash"
  cmd_file=$(mktemp).cmd
  echo "${mame_args:+$mame_args }$rom${rompath:+ -rompath \"$rompath\"}$hashpath_opt -skip_gameinfo -snapname \"$basename\"" > "$cmd_file"
  retroarch -L "$corepath" "$cmd_file"
  rm -f "$cmd_file"
  exit
fi

if [[ "$core" == "mame" || "$core" == "mame "* ]]; then
  if [[ -z "$ext" ]]; then
    rompath="$(dirname "$1");$HOME/share/bios"
    rom="$(basename "${1%.*}")"
  fi
  core=$(echo "$core" | sed -E 's|(-hard[0-9]+) ([a-z0-9_]+):([a-z0-9_]+)|\1 '"$HOME"'/share/bios/\2/\3/\3.chd|g')
  filename="${rom##*/}"; basename="${filename%.*}"
  eval "cmd=($core)"
  "${cmd[@]}" "${rom}" ${rompath:+-rompath "$rompath"} -skip_gameinfo -snapname "${basename}"
  exit
fi

if [[ "$core" == *"libretro"* ]]; then
  retroarch -L "$corepath" "${rom}"
else
  ${core} "${rom}"
fi

if [ -z "$core" ]; then
  ark "$1"
fi
