#!/bin/bash
# Strip play:// URL scheme + URL-decode. New gameflix HTML emits a relative
# path like /atari2600/NoIntro/foo.zip which we resolve under ~/share/roms;
# old HTML with the full absolute path is detected via existence and used
# as-is.
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
*"/arduboy/NoIntro/"*) core="arduous_libretro"; ext="";;
*"/arduboy/TOSEC/"*) core="arduous_libretro"; ext="";;
*"/uzebox/MAME/"*) core="mame_libretro uzebox -cart"; ext="";;
*"/commanderx16/Games/"*) core="x16emu"; ext="img";;
*"/vircon32/Vircon32/"*) core="vircon32_libretro"; ext="";;
*"/chip8/MAME/"*) core="mame_libretro d6800 -quik"; ext="";;
*"/atari2600/ROMS/"*) core="stella_libretro"; ext="";;
*"/atari2600/NoIntro/"*) core="stella_libretro"; ext="";;
*"/atari2600/TOSEC/"*) core="stella_libretro"; ext="";;
*"/atari2600/Homebrew/"*) core="stella_libretro"; ext="";;
*"/atari2600/Applications/"*) core="stella_libretro"; ext="";;
*"/atari2600/Educational/"*) core="stella_libretro"; ext="";;
*"/atari2600/MAME/"*) core="mame_libretro a2600 -cart"; ext="";;
*"/atari2600/Cass MAME/"*) core="mame_libretro a2600 scharger -cass"; ext="";;
*"/atari5200/NoIntro/"*) core="a5200_libretro"; ext="";;
*"/atari5200/TOSEC/"*) core="a5200_libretro"; ext="";;
*"/atari5200/Homebrew/"*) core="a5200_libretro"; ext="";;
*"/atari5200/App/"*) core="a5200_libretro"; ext="";;
*"/atari5200/MAME/"*) core="mame_libretro a5200 -cart"; ext="";;
*"/atari7800/NoIntro/"*) core="prosystem_libretro"; ext="";;
*"/atari7800/TOSEC/"*) core="prosystem_libretro"; ext="";;
*"/atari7800/Homebrew/"*) core="prosystem_libretro"; ext="";;
*"/atari7800/App/"*) core="prosystem_libretro"; ext="";;
*"/atari7800/MAME/"*) core="mame_libretro a7800 -cart"; ext="";;
*"/jaguar/NoIntro/"*) core="virtualjaguar_libretro"; ext="";;
*"/jaguar/TOSEC/"*) core="virtualjaguar_libretro"; ext="";;
*"/jaguar/MAME/"*) core="mame_libretro jaguar -cart"; ext="";;
*"/jaguarcd/Redump/"*) core="bigpemu"; ext="cue";;
*"/jaguarcd/NonRedump/"*) core="bigpemu"; ext="cdi";;
*"/lynx/NoIntro/"*) core="mednafen_lynx_libretro"; ext="";;
*"/lynx/TOSEC/"*) core="mednafen_lynx_libretro"; ext="";;
*"/lynx/MAME/"*) core="mame_libretro lynx -cart"; ext="bin";;
*"/atari800/NoIntro/"*) core="atari800_libretro"; ext="";;
*"/atari800/Compilations/"*) core="atari800_libretro"; ext="";;
*"/atari800/Applications/"*) core="atari800_libretro"; ext="";;
*"/atari800/Educational/"*) core="atari800_libretro"; ext="";;
*"/atari800/MAME/"*) core="mame_libretro a800 -cart1"; ext="";;
*"/atari800/Flop MAME/"*) core="mame_libretro a800 -flop1"; ext="";;
*"/xegs/MAME/"*) core="mame_libretro xegs -cart"; ext="";;
*"/atarist/NoIntro/"*) core="hatari_libretro"; ext="";;
*"/atarist/Compilations/"*) core="hatari_libretro"; ext="";;
*"/atarist/Applications/"*) core="hatari_libretro"; ext="";;
*"/atarist/Educational/"*) core="hatari_libretro"; ext="";;
*"/atarist/MAME/"*) core="mame_libretro st -flop"; ext="";;
*"/apple1/TOSEC/"*) core="mame_libretro apple1 -cass"; ext="";;
*"/apple1/App/"*) core="mame_libretro apple1 -cass"; ext="";;
*"/apple1/MAME/"*) core="mame_libretro apple1 -cass"; ext="";;
*"/apple2/Compilations/"*) core="mame_libretro apple2ee -flop1"; ext="";;
*"/apple2/Educational/"*) core="mame_libretro apple2ee -flop1"; ext="";;
*"/apple2/Applications/"*) core="mame_libretro apple2ee -flop1"; ext="";;
*"/apple2/Cracked MAME/"*) core="mame_libretro apple2ee -flop1"; ext="";;
*"/apple2/Misc MAME/"*) core="mame_libretro apple2ee -flop1"; ext="";;
*"/apple2/Orig MAME/"*) core="mame_libretro apple2ee -flop1"; ext="";;
*"/apple2/Cass MAME/"*) core="mame_libretro apple2ee -cass"; ext="";;
*"/apple2gs/2MG/"*) core="mame_libretro apple2gs -flop3"; ext="";;
*"/apple2gs/Edu/"*) core="mame_libretro apple2gs -flop3"; ext="";;
*"/apple2gs/App/"*) core="mame_libretro apple2gs -flop3"; ext="";;
*"/apple2gs/Cracked MAME/"*) core="mame_libretro apple2gs -flop3"; ext="";;
*"/apple2gs/Misc MAME/"*) core="mame_libretro apple2gs -flop3"; ext="";;
*"/apple2gs/Orig MAME/"*) core="mame_libretro apple2gs -flop3"; ext="";;
*"/apple3/TOSEC/"*) core="mame_libretro apple3 -flop1"; ext="";;
*"/apple3/Applications/"*) core="mame_libretro apple3 -flop1"; ext="";;
*"/apple3/WAP PD/"*) core="mame_libretro apple3 -flop1"; ext="";;
*"/apple3/MAME/"*) core="mame_libretro apple3 -flop1"; ext="";;
*"/lisa/Applications/"*) core="mame_libretro lisa -flop1"; ext="";;
*"/lisa/MAME/"*) core="mame_libretro lisa -flop1"; ext="";;
*"/macintosh/Flop MAME/"*) core="mame_libretro macse -flop1"; ext="";;
*"/macintosh/Orig MAME/"*) core="mame_libretro macse -flop1"; ext="";;
*"/macintosh/Cracked MAME/"*) core="mame_libretro macse -flop1"; ext="";;
*"/macintosh/HDflop MAME/"*) core="mame_libretro macse -flop1"; ext="";;
*"/macintosh/HDD CHD/"*) core="mame_libretro macse -hard"; ext="";;
*"/macintosh/Games/"*) core="mame_libretro macse -flop1"; ext="";;
*"/zx80/MAME/"*) core="mame_libretro zx80 -autoboot_command 'W\n' -autoboot_delay 3 -cass"; ext="";;
*"/zx81/TOSEC/"*) core="81_libretro"; ext="";;
*"/zx81/App/"*) core="81_libretro"; ext="";;
*"/zx81/MAME/"*) core="mame_libretro zx81 -autoboot_command 'J\"\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/zxspectrum/Compilations/"*) core="fuse_libretro"; ext="";;
*"/zxspectrum/Educational/"*) core="fuse_libretro"; ext="";;
*"/zxspectrum/Applications/"*) core="fuse_libretro"; ext="";;
*"/zxspectrum/MAME/"*) core="mame_libretro spectrum -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/zxspectrum/Cass MAME/"*) core="mame_libretro tc2068 -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/zxspectrum/Beta Disc MAME/"*) core="mame_libretro pentagon -flop"; ext="";;
*"/zxspectrum/Opus Flop MAME/"*) core="mame_libretro spec128 -flop"; ext="";;
*"/zxspectrum/Cart MAME/"*) core="mame_libretro specpls3 -cart"; ext="";;
*"/zxspectrum/MGT Flop MAME/"*) core="mame_libretro spec128 -flop"; ext="";;
*"/specpls3/MAME/"*) core="mame_libretro specpls3 -flop"; ext="";;
*"/ql/Demos MDV/"*) core="mame_libretro ql -autoboot_command 'BOOT\n' -autoboot_delay 5 -utap1"; ext="mdv";;
*"/ql/Cass MAME/"*) core="mame_libretro ql -autoboot_command 'BOOT\n' -autoboot_delay 5 -utap1"; ext="";;
*"/ql/Cart MAME/"*) core="mame_libretro ql -cart"; ext="";;
*"/ql/Flop MAME/"*) core="mame_libretro ql -exp trump -flop"; ext="";;
*"/z88/MAME/"*) core="mame_libretro z88 -cart1"; ext="";;
*"/amstradcpc/Compilations/"*) core="cap32_libretro"; ext="";;
*"/amstradcpc/App/"*) core="cap32_libretro"; ext="";;
*"/amstradcpc/Cass MAME/"*) core="mame_libretro cpc464 -autoboot_command 'RUN\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/amstradcpc/Flop MAME/"*) core="mame_libretro cpc6128 -flop1"; ext="";;
*"/gx4000/TOSEC/"*) core="cap32_libretro"; ext="";;
*"/gx4000/MAME/"*) core="mame_libretro gx4000 -cart"; ext="";;
*"/pcw/MAME/"*) core="mame_libretro pcw8256 -flop"; ext="";;
*"/pet/TOSEC/"*) core="vice_xpet_libretro"; ext="";;
*"/pet/MAME/"*) core="mame_libretro pet2001n -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/pet/Flop MAME/"*) core="mame_libretro pet2001n -flop1"; ext="";;
*"/pet/ROM MAME/"*) core="mame_libretro pet2001n -rom"; ext="";;
*"/cplus4/NoIntro/"*) core="vice_xplus4_libretro"; ext="";;
*"/cplus4/PRG/"*) core="vice_xplus4_libretro"; ext="";;
*"/cplus4/TAP/"*) core="vice_xplus4_libretro"; ext="";;
*"/cplus4/Utils/"*) core="vice_xplus4_libretro"; ext="";;
*"/cplus4/MAME/"*) core="mame_libretro c16 -cart"; ext="";;
*"/cplus4/Flop MAME/"*) core="mame_libretro c16 -flop"; ext="";;
*"/cplus4/Cass MAME/"*) core="mame_libretro c16 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/vic10/MAME/"*) core="mame_libretro vic10"; ext="";;
*"/c20/NoIntro/"*) core="vice_xvic_libretro"; ext="";;
*"/c20/Compilations/"*) core="vice_xvic_libretro"; ext="";;
*"/c20/App/"*) core="vice_xvic_libretro"; ext="";;
*"/c20/MAME/"*) core="mame_libretro vic20 -cart"; ext="";;
*"/cbm2/Cart MAME/"*) core="mame_libretro cbm610 -cart"; ext="";;
*"/cbm2/Flop MAME/"*) core="mame_libretro cbm610 -autoboot_command 'DLOAD\"\"*\"\"\nRUN\n' -autoboot_delay 5 -flop1"; ext="";;
*"/c64/NoIntro/"*) core="vice_x64sc_libretro"; ext="";;
*"/c64/PP/"*) core="vice_x64sc_libretro"; ext="";;
*"/c64/Tapes/"*) core="vice_x64sc_libretro"; ext="";;
*"/c64/Compilations/"*) core="vice_x64sc_libretro"; ext="";;
*"/c64/Educational/"*) core="vice_x64sc_libretro"; ext="";;
*"/c64/Applications/"*) core="vice_x64sc_libretro"; ext="";;
*"/c64/Cart MAME/"*) core="mame_libretro c64 -cart"; ext="";;
*"/c64/Cass MAME/"*) core="mame_libretro c64 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/c64/Flop Orig MAME/"*) core="mame_libretro c64 -flop"; ext="";;
*"/c64/Flop Misc MAME/"*) core="mame_libretro c64 -flop"; ext="";;
*"/c128/Games/"*) core="vice_x128_libretro"; ext="";;
*"/c128/App/"*) core="vice_x128_libretro"; ext="";;
*"/c128/Cart MAME/"*) core="mame_libretro c128 -cart"; ext="";;
*"/c128/Flop MAME/"*) core="mame_libretro c128 -flop"; ext="";;
*"/c128/Rom MAME/"*) core="mame_libretro c128 -rom"; ext="";;
*"/amiga500/NoIntro/"*) core="puae_libretro"; ext="";;
*"/amiga500/Compilations/"*) core="puae_libretro"; ext="";;
*"/amiga500/Edu/"*) core="puae_libretro"; ext="";;
*"/amiga500/Applications/"*) core="puae_libretro"; ext="";;
*"/amiga500/Flop MAME/"*) core="mame_libretro a500 -flop"; ext="";;
*"/amiga500/ECS Flop MAME/"*) core="mame_libretro a600 -flop"; ext="";;
*"/amiga500/OCS Flop MAME/"*) core="mame_libretro a500 -flop"; ext="";;
*"/amiga500/AGA Flop MAME/"*) core="mame_libretro a1200 -flop"; ext="";;
*"/amiga1200/Redump/"*) core="puae_libretro"; ext="cue";;
*"/amiga1200/ISO/"*) core="puae_libretro"; ext="cue";;
*"/amiga1200/App/"*) core="puae_libretro"; ext="cue";;
*"/amiga1200/Multimedia/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/Redump/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/ISO/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/App/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/Edu/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/Multimedia/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/CHD/"*) core="mame_libretro cd32 -cdrm"; ext="";;
*"/nes/NoIntro/"*) core="nestopia_libretro"; ext="";;
*"/nes/TOSEC/"*) core="nestopia_libretro"; ext="";;
*"/nes/MAME/"*) core="mame_libretro nes -cart"; ext="";;
*"/nes/ADE MAME/"*) core="mame_libretro nes -cart"; ext="";;
*"/nes/NTB MAME/"*) core="mame_libretro nes -cart1 nes:nantbb -cart2"; ext="";;
*"/famicom/Cass MAME/"*) core="mame_libretro famicom famibs30 -cass"; ext="";;
*"/fds/Disk System NoIntro/"*) core="nestopia_libretro"; ext="";;
*"/fds/Disk System TOSEC/"*) core="nestopia_libretro"; ext="";;
*"/fds/Disk System MAME/"*) core="mame_libretro fds -flop"; ext="";;
*"/snes/NoIntro/"*) core="snes9x_libretro"; ext="";;
*"/snes/TOSEC/"*) core="snes9x_libretro"; ext="";;
*"/snes/MAME/"*) core="mame_libretro snes -cart"; ext="";;
*"/snes/ST MAME/"*) core="mame_libretro snes -cart1 snes:sufami -cart2"; ext="";;
*"/snes/BS-X MAME/"*) core="mame_libretro snes -cart"; ext="";;
*"/snes-msu1/SNES MSU-1/"*) core="snes9x_libretro"; ext="";;
*"/satellaview/NoIntro/"*) core="snes9x_libretro"; ext="";;
*"/sufami/NoIntro/"*) core="snes9x_libretro"; ext="";;
*"/sufami/TOSEC/"*) core="snes9x_libretro"; ext="";;
*"/sgb/NoIntro/"*) core="mesen-s_libretro"; ext="";;
*"/sgb/TOSEC/"*) core="mesen-s_libretro"; ext="";;
*"/sgb/MAME/"*) core="mame_libretro supergb -cart"; ext="";;
*"/n64/NoIntro/"*) core="mupen64plus_next_libretro"; ext="";;
*"/n64/TOSEC/"*) core="mupen64plus_next_libretro"; ext="";;
*"/n64/MAME/"*) core="mame_libretro n64 -cart"; ext="";;
*"/n64dd/MAME/"*) core="mame_libretro n64dd -hard"; ext="";;
*"/n64dd/TOSEC/"*) core="mame_libretro n64dd -hard"; ext="";;
*"/gamecube/ISO/"*) core="dolphin_libretro"; ext="iso";;
*"/wii/Redump/"*) core="dolphin_libretro"; ext="";;
*"/pokemini/NoIntro/"*) core="pokemini_libretro"; ext="";;
*"/pokemini/TOSEC/"*) core="pokemini_libretro"; ext="";;
*"/pokemini/MAME/"*) core="mame_libretro pokemini -cart"; ext="";;
*"/virtualboy/NoIntro/"*) core="mednafen_vb_libretro"; ext="";;
*"/virtualboy/TOSEC/"*) core="mednafen_vb_libretro"; ext="";;
*"/virtualboy/MAME/"*) core="mame_libretro vboy -cart"; ext="";;
*"/gb/NoIntro/"*) core="sameboy_libretro"; ext="";;
*"/gb/TOSEC/"*) core="sameboy_libretro"; ext="";;
*"/gb/MAME/"*) core="mame_libretro gameboy -cart"; ext="";;
*"/gbc/NoIntro/"*) core="sameboy_libretro"; ext="";;
*"/gbc/TOSEC/"*) core="sameboy_libretro"; ext="";;
*"/gbc/MAME/"*) core="mame_libretro gbcolor -cart"; ext="";;
*"/gba/NoIntro/"*) core="mgba_libretro"; ext="";;
*"/gba/TOSEC/"*) core="mgba_libretro"; ext="";;
*"/gba/MAME/"*) core="mame_libretro gba -cart"; ext="";;
*"/gba/e-Reader MAME/"*) core="mame_libretro gba -cart"; ext="";;
*"/nds/DS NoIntro/"*) core="melonds_libretro"; ext="";;
*"/nds/DS Download/"*) core="melonds_libretro"; ext="";;
*"/nds/DS TOSEC/"*) core="melonds_libretro"; ext="";;
*"/dsi/NoIntro/"*) core="melondsds_libretro"; ext="";;
*"/dsi/TOSEC/"*) core="melondsds_libretro"; ext="";;
*"/3ds/NoIntro/"*) core="citra_libretro"; ext="3ds";;
*"/wiiu/Redump/"*) core="cemu -g"; ext="";;
*"/svmu/TOSEC/"*) core="mame_libretro svmu -quik"; ext="";;
*"/svmu/MAME/"*) core="mame_libretro svmu -quik"; ext="";;
*"/sg1000/NoIntro/"*) core="gearsystem_libretro"; ext="";;
*"/sg1000/TOSEC/"*) core="gearsystem_libretro"; ext="";;
*"/sg1000/MAME/"*) core="mame_libretro sg1000 -cart"; ext="";;
*"/sc3000/App/"*) core="mame_libretro sc3000 -cart"; ext="";;
*"/sc3000/Edu/"*) core="mame_libretro sc3000 -cart"; ext="";;
*"/sc3000/WAV/"*) core="mame_libretro sc3000 -autoboot_command 'LOAD\n' -autoboot_delay 5 -cass"; ext="";;
*"/sc3000/Cart MAME/"*) core="mame_libretro sc3000 -cart"; ext="";;
*"/sc3000/Cass MAME/"*) core="mame_libretro sc3000 -autoboot_command 'LOAD\n' -autoboot_delay 5 -cass"; ext="";;
*"/sc3000/Flop MAME/"*) core="mame_libretro sf7000 -flop"; ext="";;
*"/segaai/MAME/"*) core="mame_libretro segaai -card"; ext="";;
*"/mastersystem/NoIntro/"*) core="gearsystem_libretro"; ext="";;
*"/mastersystem/TOSEC/"*) core="gearsystem_libretro"; ext="";;
*"/mastersystem/MAME/"*) core="mame_libretro sms -cart"; ext="";;
*"/megadrive/NoIntro/"*) core="genesis_plus_gx_libretro"; ext="";;
*"/megadrive/TOSEC/"*) core="genesis_plus_gx_libretro"; ext="";;
*"/megadrive/MAME/"*) core="mame_libretro megadriv -cart"; ext="";;
*"/megadrive/Mega-Tech MAME/"*) core="mame_libretro megatech -cart"; ext="";;
*"/megadrive-msu/Sega MSU-MD/"*) core="genesis_plus_gx_libretro"; ext="md";;
*"/pico/NoIntro/"*) core="picodrive_libretro"; ext="";;
*"/pico/TOSEC/"*) core="picodrive_libretro"; ext="";;
*"/pico/MAME/"*) core="mame_libretro pico -cart"; ext="";;
*"/beena/NoIntro/"*) core="mame_libretro beena -cart"; ext="";;
*"/beena/TOSEC/"*) core="mame_libretro beena -cart"; ext="";;
*"/beena/MAME/"*) core="mame_libretro beena -cart"; ext="";;
*"/sega32x/NoIntro/"*) core="picodrive_libretro"; ext="";;
*"/sega32x/TOSEC/"*) core="picodrive_libretro"; ext="";;
*"/sega32x/MAME/"*) core="mame_libretro 32x -cart"; ext="";;
*"/megacd/Redump/"*) core="picodrive_libretro"; ext="cue";;
*"/megacd/ISO/"*) core="picodrive_libretro"; ext="cue";;
*"/megacd/NonRedump/"*) core="picodrive_libretro"; ext="cue";;
*"/saturn/Redump/"*) core="yabasanshiro_libretro"; ext="cue";;
*"/saturn/NonRedump/"*) core="yabasanshiro_libretro"; ext="cue";;
*"/saturn/ISO/"*) core="yabasanshiro_libretro"; ext="cue";;
*"/stv/MAME/"*) core="mame_libretro stvbios"; ext="";;
*"/dreamcast/Redump/"*) core="flycast_libretro"; ext="cue";;
*"/dreamcast/NonRedump/"*) core="flycast_libretro"; ext="gdi";;
*"/dreamcast/US/"*) core="flycast_libretro"; ext="gdi";;
*"/dreamcast/PAL/"*) core="flycast_libretro"; ext="gdi";;
*"/dreamcast/JP/"*) core="flycast_libretro"; ext="gdi";;
*"/model2/Sega Model 2/"*) core="mame_libretro"; ext="";;
*"/model3/Sega Model 3/"*) core="mame_libretro"; ext="";;
*"/gamegear/NoIntro/"*) core="gearsystem_libretro"; ext="";;
*"/gamegear/TOSEC/"*) core="gearsystem_libretro"; ext="";;
*"/gamegear/MAME/"*) core="mame_libretro gamegear -cart"; ext="";;
*"/pockstat/TOSEC/"*) core="mame_libretro pockstat -cart"; ext="";;
*"/smc777/MAME/"*) core="mame_libretro smc777 -flop1"; ext="";;
*"/psx/CHD EUR/"*) core="pcsx_rearmed_libretro"; ext="";;
*"/psx/CHD JAP/"*) core="pcsx_rearmed_libretro"; ext="";;
*"/psx/CHD USA/"*) core="pcsx_rearmed_libretro"; ext="";;
*"/psx/NonRedump/"*) core="pcsx_rearmed_libretro"; ext="cue";;
*"/ps2/CHD 1/"*) core="pcsx2"; ext="";;
*"/ps2/CHD 2/"*) core="pcsx2"; ext="";;
*"/ps2/CHD 3/"*) core="pcsx2"; ext="";;
*"/ps2/NonRedump A-G/"*) core="pcsx2"; ext="iso";;
*"/ps2/NonRedump H-Q/"*) core="pcsx2"; ext="iso";;
*"/ps2/NonRedump R-Z/"*) core="pcsx2"; ext="iso";;
*"/psp/Redump/"*) core="ppsspp_libretro"; ext="iso";;
*"/psp/NonRedump/"*) core="ppsspp_libretro"; ext="iso";;
*"/psp/TOSEC/"*) core="ppsspp_libretro"; ext="iso";;
*"/dos/eXoDOS/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TOSEC/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/App TOSEC/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/Edu TOSEC/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TOSEC-ISO/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1982/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1983/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1985/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1988/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1990/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1991/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1994/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1995/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1996/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1997/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1998/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 1999/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 199x/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 2002/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 2003/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 2008/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 2009/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 2011/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 2014/"*) core="dosbox_pure_libretro"; ext="";;
*"/dos/TDC 2015/"*) core="dosbox_pure_libretro"; ext="";;
*"/ibm5150/MAME/"*) core="mame_libretro ibm5150 -hard1 ibm5150_hdd:freedos13_8086"; ext="";;
*"/ibm5170/MAME/"*) core="mame_libretro ibm5170 -hard1 ibm5170_hdd:freedos13"; ext="";;
*"/ibm5170/CDROM CHD/"*) core="mame_libretro ibm5170 -cdrom"; ext="";;
*"/ibm5170/CDROM MAME/"*) core="mame_libretro ibm5170 -cdrom"; ext="";;
*"/ibm5170/HDD CHD/"*) core="mame_libretro ibm5170 -hard"; ext="";;
*"/ibmpcjr/Cart MAME/"*) core="mame_libretro ibmpcjr"; ext="";;
*"/ibmpcjr/Flop MAME/"*) core="mame_libretro ibmpcjr -hard1 ibm5150_hdd:freedos13_8086"; ext="";;
*"/msx1/NoIntro/"*) core="bluemsx_libretro"; ext="";;
*"/msx1/Games/"*) core="bluemsx_libretro"; ext="";;
*"/msx1/Cart MAME/"*) core="mame_libretro expert11 -cart1"; ext="";;
*"/msx1/Cass MAME/"*) core="mame_libretro expert11 -autoboot_command 'RUN\"CAS:\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/msx1/Flop MAME/"*) core="mame_libretro svi738 -flop"; ext="";;
*"/msx2/NoIntro/"*) core="bluemsx_libretro"; ext="";;
*"/msx2/Games/"*) core="bluemsx_libretro"; ext="";;
*"/msx2/Cart MAME/"*) core="mame_libretro hbf1xd -cart1"; ext="";;
*"/msx2/Flop MAME/"*) core="mame_libretro hbf1xd -flop"; ext="";;
*"/msx2/Cass MAME/"*) core="mame_libretro hbf1xd -autoboot_command 'RUN\"CAS:\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/msx2+/TOSEC/"*) core="bluemsx_libretro"; ext="";;
*"/msx2+/Cart MAME/"*) core="mame_libretro fsa1wsx -cart1"; ext="";;
*"/msx2+/Flop MAME/"*) core="mame_libretro fsa1wsx -flop"; ext="";;
*"/msxturbor/MSX TurboR/"*) core="bluemsx_libretro"; ext="";;
*"/msxturbor/Flop MAME/"*) core="mame_libretro fsa1gt -flop1"; ext="";;
*"/msxturbor/Cart MAME/"*) core="mame_libretro fsa1gt -cart1"; ext="";;
*"/studio2/MAME/"*) core="mame_libretro studio2 -cart"; ext="";;
*"/channelf/NoIntro/"*) core="freechaf_libretro"; ext="";;
*"/channelf/TOSEC/"*) core="freechaf_libretro"; ext="";;
*"/channelf/MAME/"*) core="mame_libretro channelf -cart"; ext="";;
*"/vectrex/NoIntro/"*) core="vecx_libretro"; ext="";;
*"/vectrex/TOSEC/"*) core="vecx_libretro"; ext="";;
*"/vectrex/MAME/"*) core="mame_libretro vectrex -cart"; ext="";;
*"/o2em/NoIntro/"*) core="o2em_libretro"; ext="";;
*"/o2em/TOSEC/"*) core="o2em_libretro"; ext="";;
*"/o2em/MAME/"*) core="mame_libretro videopac -cart"; ext="";;
*"/videopacplus/NoIntro/"*) core="o2em_libretro"; ext="";;
*"/videopacplus/TOSEC/"*) core="o2em_libretro"; ext="";;
*"/intellivision/NoIntro/"*) core="freeintv_libretro"; ext="";;
*"/intellivision/TOSEC/"*) core="freeintv_libretro"; ext="";;
*"/intellivision/MAME/"*) core="mame_libretro intv -cart"; ext="";;
*"/intellivision/ECS MAME/"*) core="mame_libretro intvecs -cart"; ext="";;
*"/colecovision/NoIntro/"*) core="gearcoleco_libretro"; ext="";;
*"/colecovision/TOSEC/"*) core="gearcoleco_libretro"; ext="";;
*"/colecovision/MAME/"*) core="mame_libretro coleco -cart"; ext="";;
*"/colecovision/Homebrew MAME/"*) core="mame_libretro coleco -cart"; ext="";;
*"/scv/NoIntro/"*) core="emuscv_libretro"; ext="";;
*"/scv/TOSEC/"*) core="emuscv_libretro"; ext="";;
*"/scv/MAME/"*) core="mame_libretro scv -cart"; ext="";;
*"/ctvboy/MAME/"*) core="mame_libretro ctvboy -cart"; ext="";;
*"/sv8000/MAME/"*) core="mame_libretro sv8000 -cart"; ext="";;
*"/astrocade/NoIntro/"*) core="mame_libretro astrocde -cart"; ext="";;
*"/astrocade/TOSEC/"*) core="mame_libretro astrocde -cart"; ext="";;
*"/astrocade/MAME/"*) core="mame_libretro astrocde -cart"; ext="";;
*"/apfm1000/NoIntro/"*) core="mame_libretro apfm1000 -cart"; ext="";;
*"/apfm1000/TOSEC/"*) core="mame_libretro apfm1000 -cart"; ext="";;
*"/apfm1000/MAME/"*) core="mame_libretro apfm1000 -cart"; ext="";;
*"/apfm1000/Cass MAME/"*) core="mame_libretro apfimag -cass"; ext="";;
*"/crvision/NoIntro/"*) core="mame_libretro crvision -cart"; ext="";;
*"/crvision/TOSEC/"*) core="mame_libretro crvision -cart"; ext="";;
*"/crvision/MAME/"*) core="mame_libretro crvision -cart"; ext="";;
*"/vsmile/NoIntro/"*) core="mame_libretro vsmile -cart"; ext="";;
*"/vsmile/TOSEC/"*) core="mame_libretro vsmile -cart"; ext="";;
*"/vsmile/MAME/"*) core="mame_libretro vsmile -cart"; ext="";;
*"/vsmile/Cart MAME/"*) core="mame_libretro vsmilem -cart"; ext="";;
*"/vsmileb/MAME/"*) core="mame_libretro vsmileb -cart"; ext="";;
*"/arcadia/NoIntro/"*) core="mame_libretro arcadia -cart"; ext="";;
*"/arcadia/TOSEC/"*) core="mame_libretro arcadia -cart"; ext="";;
*"/arcadia/MAME/"*) core="mame_libretro arcadia -cart"; ext="";;
*"/hyperscan/MAME/"*) core="mame_libretro hyprscan -cdrom"; ext="";;
*"/supracan/NoIntro/"*) core="mame_libretro supracan -cart"; ext="";;
*"/supracan/TOSEC/"*) core="mame_libretro supracan -cart"; ext="";;
*"/supracan/MAME/"*) core="mame_libretro supracan -cart"; ext="";;
*"/vc4000/NoIntro/"*) core="mame_libretro vc4000 -cart"; ext="";;
*"/vc4000/MAME/"*) core="mame_libretro vc4000 -cart"; ext="";;
*"/multivision/Othello Multivision/"*) core="gearsystem_libretro"; ext="";;
*"/vii/MAME/"*) core="mame_libretro vii -cart"; ext="";;
*"/unichamp/MAME/"*) core="mame_libretro unichamp -cart"; ext="";;
*"/entexsag/MAME/"*) core="mame_libretro sag -cart"; ext="";;
*"/ekara/MAME/"*) core="mame_libretro ekara -cart"; ext="";;
*"/videoart/MAME/"*) core="mame_libretro videoart -cart"; ext="";;
*"/pdp1/MAME/"*) core="mame_libretro pdp1 -ptap1"; ext="";;
*"/sol20/MAME/"*) core="mame_libretro sol20 -cass1"; ext="";;
*"/trs80/Model III/"*) core="mame_libretro trs80m3 -quik"; ext="";;
*"/trs80/Model 4/"*) core="mame_libretro trs80m3 -quik"; ext="";;
*"/trs80/MAME/"*) core="mame_libretro trs80m3 -quik"; ext="";;
*"/trs80/Cass MAME/"*) core="mame_libretro trs80m3 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; ext="";;
*"/trs80/Flop MAME/"*) core="mame_libretro trs80m3 -flop1"; ext="";;
*"/trs80/Model II MAME/"*) core="mame_libretro trs80m2 -flop1"; ext="";;
*"/sorcerer/Cart MAME/"*) core="mame_libretro sorcerer -cart"; ext="";;
*"/sorcerer/Cass MAME/"*) core="mame_libretro sorcerer -cart sorcerer_cart:basicpac -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 5 -cass1"; ext="";;
*"/sorcerer/Flop MAME/"*) core="mame_libretro sorcererd -flop1"; ext="";;
*"/z80ne/Cass MAME/"*) core="mame_libretro z80net -cass1"; ext="";;
*"/z80ne/Flop MAME/"*) core="mame_libretro z80netf -flop1"; ext="";;
*"/osborne1/MAME/"*) core="mame_libretro osborne1 -flop1"; ext="";;
*"/jupace/MAME/"*) core="mame_libretro jupace -cass"; ext="";;
*"/nascom/Snap MAME/"*) core="mame_libretro nascom2 -dump1"; ext="";;
*"/nascom/Flop MAME/"*) core="mame_libretro nascom2 -flop1"; ext="";;
*"/abc80/Flop MAME/"*) core="mame_libretro abc80 -flop1"; ext="";;
*"/abc80/Cass MAME/"*) core="mame_libretro abc80 -cass"; ext="";;
*"/abc80/ROM MAME/"*) core="mame_libretro abc80 -cart"; ext="";;
*"/kaypro/MAME/"*) core="mame_libretro kaypro2x -flop1"; ext="";;
*"/galaxy/MAME/"*) core="mame_libretro galaxy -autoboot_command 'OLD\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/special/MAME/"*) core="mame_libretro special -autoboot_command 'I\n' -autoboot_delay 3 -cass"; ext="";;
*"/special/Flop MAME/"*) core="mame_libretro specimx -flop1"; ext="";;
*"/apogee/MAME/"*) core="mame_libretro apogee -autoboot_command 'I\n' -autoboot_delay 3 -cass"; ext="";;
*"/radio86/MAME/"*) core="mame_libretro radio86 -autoboot_command 'I\n' -autoboot_delay 3 -cass"; ext="";;
*"/mikrosha/MAME/"*) core="mame_libretro mikrosha -autoboot_command 'I\n' -autoboot_delay 3 -cass"; ext="";;
*"/partner/Cass MAME/"*) core="mame_libretro partner -cass"; ext="";;
*"/partner/Flop MAME/"*) core="mame_libretro partner -flop1"; ext="";;
*"/korvet/MAME/"*) core="mame_libretro korvet -flop1"; ext="";;
*"/atom/TOSEC/"*) core="mame_libretro atom -flop1"; ext="";;
*"/atom/MAME/"*) core="mame_libretro atom -flop1"; ext="";;
*"/atom/ROM MAME/"*) core="mame_libretro atom -cart"; ext="";;
*"/atom/Cass MAME/"*) core="mame_libretro atom -cass"; ext="";;
*"/interact/MAME/"*) core="mame_libretro interact -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/spc1000/MAME/"*) core="mame_libretro spc1000 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/cgenie/TOSEC/"*) core="mame_libretro cgenie -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; ext="";;
*"/cgenie/Cass MAME/"*) core="mame_libretro cgenie -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; ext="";;
*"/dragon64/TOSEC/"*) core="mame_libretro dragon64 -autoboot_command 'CLOAD\n' -autoboot_delay 4 -cass"; ext="";;
*"/dragon64/MAME/"*) core="mame_libretro dragon64 -autoboot_command 'CLOAD\n' -autoboot_delay 4 -cass"; ext="";;
*"/dragon64/Flop MAME/"*) core="mame_libretro dragon64 -flop1"; ext="";;
*"/dragon64/Cart MAME/"*) core="mame_libretro dragon64 -cart"; ext="";;
*"/dragon64/OS-9 MAME/"*) core="mame_libretro dragon64 -flop1"; ext="";;
*"/dragon64/Flex MAME/"*) core="mame_libretro dragon64 -flop1"; ext="";;
*"/dragon64/Alpha Flop MAME/"*) core="mame_libretro dragon64 -flop1"; ext="";;
*"/oricatmos/TAP/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass"; ext="";;
*"/oricatmos/MAME/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass"; ext="";;
*"/camplynx/MAME/"*) core="mame_libretro lynx48k -autoboot_command 'mload\"\"\n' -autoboot_delay 2 -cass"; ext="";;
*"/camplynx/Flop MAME/"*) core="mame_libretro lynx128k -flop1"; ext="";;
*"/orao/MAME/"*) core="mame_libretro orao -cass"; ext="";;
*"/vg5k/MAME/"*) core="mame_libretro vg5k -cass"; ext="";;
*"/pegasus/MAME/"*) core="mame_libretro pegasus -rom1"; ext="";;
*"/juku/MAME/"*) core="mame_libretro juku -flop1"; ext="";;
*"/x07/MAME/"*) core="mame_libretro x07 -cass"; ext="";;
*"/alice/A32 MAME/"*) core="mame_libretro alice32 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/alice/A90 MAME/"*) core="mame_libretro alice90 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/mc10/TOSEC/"*) core="mame_libretro mc10 -cass"; ext="";;
*"/mc10/MAME/"*) core="mame_libretro mc10 -cass"; ext="";;
*"/phc25/MAME/"*) core="mame_libretro phc25 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/laser310/200/"*) core="mame_libretro laser310 -dump"; ext="";;
*"/laser310/200 App/"*) core="mame_libretro laser310 -dump"; ext="";;
*"/laser310/310 App/"*) core="mame_libretro laser310 -dump"; ext="";;
*"/laser310/MAME/"*) core="mame_libretro laser310 -dump"; ext="";;
*"/laser310/Cass MAME/"*) core="mame_libretro laser310 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass"; ext="";;
*"/bk/TOSEC/"*) core="bk_libretro"; ext="";;
*"/bk/App/"*) core="bk_libretro"; ext="";;
*"/bk/MAME/"*) core="mame_libretro bk0010 -cass"; ext="";;
*"/pmd85/MAME/"*) core="mame_libretro pmd851 -autoboot_command 'MGLD 00\n' -autoboot_delay 3 -cass"; ext="";;
*"/lviv/MAME/"*) core="mame_libretro lviv -autoboot_command 'CLOAD \"\"\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/mc1000/MAME/"*) core="mame_libretro mc1000 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/pecom64/MAME/"*) core="mame_libretro pecom64 -autoboot_command 'PLOAD\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/spc1500/MAME/"*) core="mame_libretro spc1500 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/orion128/MAME/"*) core="mame_libretro orion128 -flop1"; ext="";;
*"/orion128/Cass MAME/"*) core="mame_libretro orion128 -cass"; ext="";;
*"/videobrain/MAME/"*) core="mame_libretro vidbrain -cart"; ext="";;
*"/super80/Cass MAME/"*) core="mame_libretro super80 -cass"; ext="";;
*"/super80/Flop MAME/"*) core="mame_libretro super80r -flop1"; ext="";;
*"/bbcmicro/TOSEC/"*) core="mame_libretro bbcb -flop1"; ext="";;
*"/bbcmicro/Flop MAME/"*) core="mame_libretro bbcb -flop1"; ext="";;
*"/bbcmicro/Orig MAME/"*) core="mame_libretro bbcb -flop1"; ext="";;
*"/bbcmicro/Micro Cass MAME/"*) core="mame_libretro bbcb -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; ext="";;
*"/bbcmicro/Micro ROM MAME/"*) core="mame_libretro bbcb -rom1"; ext="";;
*"/bbcmicro/Master Cart MAME/"*) core="mame_libretro bbcm -cart"; ext="";;
*"/bbcmicro/Master Flop MAME/"*) core="mame_libretro bbcm -flop1"; ext="";;
*"/bbcmicro/Master Compact Flop MAME/"*) core="mame_libretro bbcmc -flop1"; ext="";;
*"/ti99/MAME/"*) core="mame_libretro ti99_4a"; ext="";;
*"/mbee/Cart MAME/"*) core="mame_libretro mbee -rom2"; ext="";;
*"/mbee/Quik MAME/"*) core="mame_libretro mbee -quik"; ext="";;
*"/mbee/Flop MAME/"*) core="mame_libretro mbee56 -flop1"; ext="";;
*"/m5/Cart MAME/"*) core="mame_libretro m5 -cart1"; ext="";;
*"/m5/Cass MAME/"*) core="mame_libretro m5 -cart1 m5_cart:basici -autoboot_command 'CHAIN\n' -autoboot_delay 5 -cass"; ext="";;
*"/aquarius/Cart MAME/"*) core="mame_libretro aquarius -cart1"; ext="";;
*"/aquarius/Cass MAME/"*) core="mame_libretro aquarius -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/adam/TOSEC/"*) core="mame_libretro adam -flop1"; ext="";;
*"/adam/App/"*) core="mame_libretro adam -flop1"; ext="";;
*"/adam/MAME/"*) core="mame_libretro adam -flop1"; ext="";;
*"/adam/Cass MAME/"*) core="mame_libretro adam -cass"; ext="";;
*"/adam/Cart MAME/"*) core="mame_libretro adam -cart1"; ext="";;
*"/spectravideo/Games/"*) core="bluemsx_libretro"; ext="";;
*"/spectravideo/Various/"*) core="bluemsx_libretro"; ext="";;
*"/spectravideo/MAME/"*) core="mame_libretro svi318 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass"; ext="";;
*"/mtx/Cart MAME/"*) core="mame_libretro mtx512 -cart1"; ext="";;
*"/mtx/Cass MAME/"*) core="mame_libretro mtx512 -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/mtx/Flop MAME/"*) core="mame_libretro mtx512 -exp_ext sdxbas -flop1"; ext="";;
*"/mtx/ROM MAME/"*) core="mame_libretro mtx512 -rom"; ext="";;
*"/pencil2/MAME/"*) core="mame_libretro pencil2 -cart"; ext="";;
*"/electron/TOSEC/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; ext="";;
*"/electron/App/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; ext="";;
*"/electron/Edu/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; ext="";;
*"/electron/MAME/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass"; ext="";;
*"/electron/Flop MAME/"*) core="mame_libretro electron64 -flop"; ext="";;
*"/electron/Cart MAME/"*) core="mame_libretro electron64 -exp plus1 -cart"; ext="";;
*"/electron/ROM MAME/"*) core="mame_libretro electron64 -exp plus1 -rom"; ext="";;
*"/tutor/TOSEC/"*) core="mame_libretro tutor -cart"; ext="";;
*"/tutor/MAME/"*) core="mame_libretro tutor -cart"; ext="";;
*"/exl100/MAME/"*) core="mame_libretro exl100 -cart"; ext="";;
*"/compclr2/MAME/"*) core="mame_libretro compclr2 -flop1"; ext="";;
*"/myvision/MAME/"*) core="mame_libretro myvision -cart"; ext="";;
*"/einstein/MAME/"*) core="mame_libretro einstein -flop1"; ext="";;
*"/kc85/Cass MAME/"*) core="mame_libretro kc85_4 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/kc85/Cart MAME/"*) core="mame_libretro kc85_4 -cart"; ext="";;
*"/kc85/Flop MAME/"*) core="mame_libretro kc85_4 -flop1"; ext="";;
*"/tvc/TC Computer CAS/"*) core="ep128emu_core_libretro"; ext="";;
*"/tvc/TC Computer Flop MAME/"*) core="mame_libretro tvc64p -flop1"; ext="";;
*"/tvc/TVC Cass MAME/"*) core="mame_libretro tvc64p -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/tvc/TVC Cart MAME/"*) core="mame_libretro tvc64p -cart"; ext="";;
*"/rx78/NoIntro/"*) core="mame_libretro rx78 -cart"; ext="";;
*"/rx78/TOSEC/"*) core="mame_libretro rx78 -cart"; ext="";;
*"/rx78/Cart MAME/"*) core="mame_libretro rx78 -cart"; ext="";;
*"/rx78/Cass MAME/"*) core="mame_libretro rx78 basic -cass"; ext="";;
*"/coco/TOSEC/"*) core="mame_libretro coco3 -cart"; ext="";;
*"/coco/App/"*) core="mame_libretro coco3 -cart"; ext="";;
*"/coco/MAME/"*) core="mame_libretro coco3 -cart"; ext="";;
*"/coco/Flop MAME/"*) core="mame_libretro coco3 -flop1"; ext="";;
*"/samcoupe/DSK/"*) core="mame_libretro samcoupe -flop1"; ext="";;
*"/samcoupe/MAME/"*) core="mame_libretro samcoupe -flop1"; ext="";;
*"/samcoupe/Cass MAME/"*) core="mame_libretro samcoupe -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/enterprise/Games/"*) core="ep128emu_core_libretro"; ext="";;
*"/enterprise/64 & 128 Flop MAME/"*) core="mame_libretro ep128 -flop"; ext="";;
*"/enterprise/Cart MAME/"*) core="mame_libretro ep128 -cart"; ext="";;
*"/enterprise/Cass MAME/"*) core="mame_libretro ep128 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/vector06/MAME/"*) core="mame_libretro vector06 -flop1"; ext="";;
*"/socrates/VTech Socrates/"*) core="mame_libretro socrates -cart"; ext="";;
*"/thomson/MO5 K7/"*) core="theodore_libretro"; ext="";;
*"/thomson/MO6 K7/"*) core="theodore_libretro"; ext="";;
*"/thomson/Games/"*) core="theodore_libretro"; ext="";;
*"/thomson/TO8 FD/"*) core="theodore_libretro"; ext="";;
*"/thomson/TO8 K7/"*) core="theodore_libretro"; ext="";;
*"/thomson/TO8 SAP/"*) core="theodore_libretro"; ext="";;
*"/thomson/MO5 Cart MAME/"*) core="mame_libretro mo5 -cart"; ext="";;
*"/thomson/MO5 Cass MAME/"*) core="mame_libretro mo5 -autoboot_command 'RUN\"\"\n' -autoboot_delay 3 -cass"; ext="";;
*"/thomson/MO5 Flop MAME/"*) core="mame_libretro mo5 -flop"; ext="";;
*"/thomson/MO6 Cass MAME/"*) core="mame_libretro mo6 -autoboot_command '2\nRUN\"\"\n' -autoboot_delay 5 -cass"; ext="";;
*"/thomson/MO6 Flop MAME/"*) core="mame_libretro mo6 -flop"; ext="";;
*"/thomson/TO Flop MAME/"*) core="mame_libretro to8 -flop"; ext="";;
*"/thomson/TO7 Cart MAME/"*) core="mame_libretro to7 -cart"; ext="";;
*"/thomson/TO7 Cass MAME/"*) core="mame_libretro to7 -cart basic -autoboot_command '1\nRUN\"\"\n' -autoboot_delay 5 -cass"; ext="";;
*"/thomson/TO8 Cass MAME/"*) core="mame_libretro to8 -autoboot_command '2\nRUN\"\"\n' -autoboot_delay 5 -cass"; ext="";;
*"/thomson/MO5 QD MAME/"*) core="mame_libretro mo5 -flop"; ext="";;
*"/thomson/TO7 QD MAME/"*) core="mame_libretro to7 -flop"; ext="";;
*"/rainbow/MAME/"*) core="mame_libretro rainbow -flop1"; ext="";;
*"/tiki100/MAME/"*) core="mame_libretro tiki100 -flop1"; ext="";;
*"/pro128/Cass MAME/"*) core="mame_libretro pro128 -autoboot_command 'RUN\"CASS:\"\n' -autoboot_delay 8 -cass"; ext="";;
*"/pro128/Cart MAME/"*) core="mame_libretro pro128 -cart"; ext="";;
*"/pro128/Flop MAME/"*) core="mame_libretro pro128 -flop1"; ext="";;
*"/pro128s/MAME/"*) core="mame_libretro pro128s -flop1"; ext="";;
*"/archimedes/TOSEC/"*) core="mame_libretro aa4401 -flop"; ext="";;
*"/archimedes/App/"*) core="mame_libretro aa4401 -flop"; ext="";;
*"/archimedes/MAME/"*) core="mame_libretro aa4401 -flop"; ext="";;
*"/pc60/MAME/"*) core="mame_libretro pc6001 -cart1"; ext="";;
*"/pc80/PC-8001 N-BASIC Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1"; ext="";;
*"/pc80/PC-8001mkII N80 Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1"; ext="";;
*"/pc80/PC-8001mkIISR N80SR Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1"; ext="";;
*"/pc88/TOSEC/"*) core="quasi88_libretro"; ext="";;
*"/pc88/Flop MAME/"*) core="mame_libretro pc8801 -flop1"; ext="";;
*"/pc88/Cass MAME/"*) core="mame_libretro pc8801 -cass"; ext="";;
*"/pc98/TOSEC/"*) core="np2kai_libretro"; ext="";;
*"/pc98/MAME/"*) core="mame_libretro pc9801 -flop1"; ext="";;
*"/pc98/CHD/"*) core="mame_libretro pc9821 -cdrm"; ext="";;
*"/pc98/CD MAME/"*) core="mame_libretro pc9821 -cdrm"; ext="";;
*"/pc98/PC-9821 TOSEC/"*) core="np2kai_libretro"; ext="";;
*"/pcengine/NoIntro/"*) core="mednafen_pce_fast_libretro"; ext="";;
*"/pcengine/TOSEC/"*) core="mednafen_pce_fast_libretro"; ext="";;
*"/pcengine/MAME/"*) core="mame_libretro pce -cart"; ext="";;
*"/pcengine/TurboGrafx MAME/"*) core="mame_libretro tg16 -cart"; ext="";;
*"/pcengine/PCE TourVision MAME/"*) core="mame_libretro tourvis -cart"; ext="";;
*"/supergrafx/NoIntro/"*) core="mednafen_supergrafx_libretro"; ext="";;
*"/supergrafx/TOSEC/"*) core="mednafen_supergrafx_libretro"; ext="";;
*"/supergrafx/MAME/"*) core="mame_libretro sgx -cart"; ext="";;
*"/pcenginecd/Redump/"*) core="mednafen_pce_fast_libretro"; ext="cue";;
*"/pcenginecd/ISO/"*) core="mednafen_pce_fast_libretro"; ext="cue";;
*"/pcenginecd/NonRedump/"*) core="mednafen_pce_fast_libretro"; ext="cue";;
*"/pcenginecd/CHD/"*) core="mame_libretro pce -cdrm"; ext="";;
*"/pcfx/Redump/"*) core="mednafen_pcfx_libretro"; ext="cue";;
*"/pcfx/ISO/"*) core="mednafen_pcfx_libretro"; ext="cue";;
*"/fm7/NoIntro/"*) core="mame_libretro fm7 -flop1"; ext="";;
*"/fm7/D77/"*) core="mame_libretro fm7 -flop1"; ext="";;
*"/fm7/MAME/"*) core="mame_libretro fm7 -flop1"; ext="";;
*"/fm7/FM-7 Cass MAME/"*) core="mame_libretro fm7 -autoboot_command 'RUN\"\"\n' -autoboot_delay 5 -cass"; ext="";;
*"/fm7/FM-8 Cass MAME/"*) core="mame_libretro fm8 -autoboot_command 'RUN\"\"\n' -autoboot_delay 5 -cass"; ext="";;
*"/fm7/FM-77AV Flop MAME/"*) core="mame_libretro fm77av -flop1"; ext="";;
*"/fm7/FM-77AV TOSEC/"*) core="mame_libretro fm77av -flop1"; ext="";;
*"/fmtowns/Redump/"*) core="mame_libretro fmtmarty -cdrm"; ext="";;
*"/fmtowns/MAME/"*) core="mame_libretro fmtmarty -cdrm"; ext="";;
*"/fmtowns/CHD/"*) core="mame_libretro fmtmarty -cdrm"; ext="";;
*"/fmtowns/Flop Orig MAME/"*) core="mame_libretro fmtowns -flop1"; ext="";;
*"/fmtowns/Flop Misc MAME/"*) core="mame_libretro fmtowns -flop1"; ext="";;
*"/fmtowns/Games/"*) core="mame_libretro fmtmarty -cdrm"; ext="";;
*"/x1/Games/"*) core="x1_libretro"; ext="";;
*"/x1/Cass MAME/"*) core="mame_libretro x1 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass"; ext="";;
*"/x1/Flop MAME/"*) core="mame_libretro x1 -flop1"; ext="";;
*"/x68000/DIM/"*) core="px68k_libretro"; ext="";;
*"/x68000/App/"*) core="px68k_libretro"; ext="";;
*"/x68000/MAME/"*) core="mame_libretro x68000 -flop1"; ext="";;
*"/mz700/Games/"*) core="mame_libretro mz700 -autoboot_command 'L\n' -autoboot_delay 3 -cass"; ext="";;
*"/mz700/MAME/"*) core="mame_libretro mz700 -autoboot_command 'L\n' -autoboot_delay 3 -cass"; ext="";;
*"/mz800/Games/"*) core="mame_libretro mz800 -autoboot_command 'L\n' -autoboot_delay 3 -cass"; ext="";;
*"/mz800/MAME/"*) core="mame_libretro mz800 -autoboot_command 'L\n' -autoboot_delay 3 -cass"; ext="";;
*"/mz2000/MZT/"*) core="mame_libretro mz2000 -autoboot_command 'C' -autoboot_delay 5 -cass"; ext="";;
*"/mz2000/MAME/"*) core="mame_libretro mz2000 -autoboot_command 'C' -autoboot_delay 5 -cass"; ext="";;
*"/mz2500/MAME/"*) core="mame_libretro mz2500 -flop1"; ext="";;
*"/pv1000/NoIntro/"*) core="mame_libretro pv1000 -cart"; ext="";;
*"/pv1000/TOSEC/"*) core="mame_libretro pv1000 -cart"; ext="";;
*"/pv1000/MAME/"*) core="mame_libretro pv1000 -cart"; ext="";;
*"/pv2000/TOSEC/"*) core="mame_libretro pv2000 -cart"; ext="";;
*"/pv2000/MAME/"*) core="mame_libretro pv2000 -cart"; ext="";;
*"/loopy/NoIntro/"*) core="mame_libretro casloopy -cart"; ext="";;
*"/loopy/TOSEC/"*) core="mame_libretro casloopy -cart"; ext="";;
*"/loopy/MAME/"*) core="mame_libretro casloopy -cart"; ext="";;
*"/amigacdtv/Redump/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/ISO/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/App/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/Edu/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/Multimedia/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/CHD/"*) core="mame_libretro cdtv -cdrm"; ext="";;
*"/cdi/Redump/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/NonRedump/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/TOSEC/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/App/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/Edu/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/Multimedia/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/CHD/"*) core="mame_libretro cdimono1 -cdrm"; ext="";;
*"/3do/Redump/"*) core="opera_libretro"; ext="cue";;
*"/3do/NonRedump/"*) core="opera_libretro"; ext="cue";;
*"/3do/TOSEC/"*) core="opera_libretro"; ext="cue";;
*"/3do/App/"*) core="opera_libretro"; ext="cue";;
*"/3do/Edu/"*) core="opera_libretro"; ext="cue";;
*"/3do/Multimedia/"*) core="opera_libretro"; ext="cue";;
*"/vis/Edu/"*) core="mame_libretro vis -cdrm"; ext="cue";;
*"/vis/Games/"*) core="mame_libretro vis -cdrm"; ext="cue";;
*"/vis/Multimedia/"*) core="mame_libretro vis -cdrm"; ext="cue";;
*"/mame/Merged/"*) core="mame_libretro"; ext="";;
*"/mame/Non-Merged/"*) core="mame_libretro"; ext="";;
*"/mame/Split/"*) core="mame_libretro"; ext="";;
*"/mame/2000/"*) core="mame_libretro"; ext="";;
*"/mame/2003/"*) core="mame_libretro"; ext="";;
*"/mame/2006/"*) core="mame_libretro"; ext="";;
*"/mame/2010/"*) core="mame_libretro"; ext="";;
*"/mame/2015/"*) core="mame_libretro"; ext="";;
*"/mame/2016/"*) core="mame_libretro"; ext="";;
*"/vgmplay/MAME/"*) core="mame_libretro vgmplay -quik"; ext="";;
*"/fbneo/FinalBurn Neo/"*) core="fbneo_libretro"; ext="";;
*"/neogeo/MAME/"*) core="mame_libretro aes -cart"; ext="";;
*"/neogeocd/Redump/"*) core="neocd_libretro"; ext="cue";;
*"/neogeocd/ISO/"*) core="neocd_libretro"; ext="cue";;
*"/ngp/NoIntro/"*) core="mednafen_ngp_libretro"; ext="";;
*"/ngp/TOSEC/"*) core="mednafen_ngp_libretro"; ext="";;
*"/ngp/MAME/"*) core="mame_libretro ngp -cart"; ext="";;
*"/ngpc/NoIntro/"*) core="mednafen_ngp_libretro"; ext="";;
*"/ngpc/TOSEC/"*) core="mednafen_ngp_libretro"; ext="";;
*"/ngpc/MAME/"*) core="mame_libretro ngpc -cart"; ext="";;
*"/gamepock/NoIntro/"*) core="mame_libretro gamepock -cart"; ext="";;
*"/gamepock/MAME/"*) core="mame_libretro gamepock -cart"; ext="";;
*"/supervision/NoIntro/"*) core="potator_libretro"; ext="";;
*"/supervision/TOSEC/"*) core="potator_libretro"; ext="";;
*"/supervision/MAME/"*) core="mame_libretro svision -cart"; ext="";;
*"/wswan/NoIntro/"*) core="mednafen_wswan_libretro"; ext="";;
*"/wswan/TOSEC/"*) core="mednafen_wswan_libretro"; ext="";;
*"/wswan/MAME/"*) core="mame_libretro wswan -cart"; ext="";;
*"/wswan/Pocket Challenge 2 NoIntro/"*) core="mednafen_wswan_libretro"; ext="";;
*"/wswanc/NoIntro/"*) core="mednafen_wswan_libretro"; ext="";;
*"/wswanc/TOSEC/"*) core="mednafen_wswan_libretro"; ext="";;
*"/wswanc/MAME/"*) core="mame_libretro wscolor -cart"; ext="";;
*"/megaduck/NoIntro/"*) core="mame_libretro megaduck -cart"; ext="";;
*"/megaduck/MAME/"*) core="mame_libretro megaduck -cart"; ext="";;
*"/microvision/MAME/"*) core="mame_libretro microvsn -cart"; ext="";;
*"/gamate/NoIntro/"*) core="mame_libretro gamate -cart"; ext="";;
*"/gamate/TOSEC/"*) core="mame_libretro gamate -cart"; ext="";;
*"/gamate/MAME/"*) core="mame_libretro gamate -cart"; ext="";;
*"/juicebox/MAME/"*) core="mame_libretro juicebox"; ext="";;
*"/gmaster/NoIntro/"*) core="mame_libretro gmaster -cart"; ext="";;
*"/gmaster/TOSEC/"*) core="mame_libretro gmaster -cart"; ext="";;
*"/gmaster/MAME/"*) core="mame_libretro gmaster -cart"; ext="";;
*"/gamecom/NoIntro/"*) core="mame_libretro gamecom -cart1"; ext="";;
*"/gamecom/TOSEC/"*) core="mame_libretro gamecom -cart1"; ext="";;
*"/gamecom/MAME/"*) core="mame_libretro gamecom -cart1"; ext="";;
*"/gp32/NoIntro/"*) core="mame_libretro gp32 -memc"; ext="";;
*"/gp32/TOSEC/"*) core="mame_libretro gp32 -memc"; ext="";;
*"/gp32/MAME/"*) core="mame_libretro gp32 -memc"; ext="";;
*"/advision/NoIntro/"*) core="mame_libretro advision -cart"; ext="";;
*"/advision/TOSEC/"*) core="mame_libretro advision -cart"; ext="";;
*"/advision/MAME/"*) core="mame_libretro advision -cart"; ext="";;
*"/mononcolor/MAME/"*) core="mame_libretro mononcol -cart"; ext="";;
*"/gameking/MAME/"*) core="mame_libretro gameking -cart"; ext="";;
*"/gameking3/MAME/"*) core="mame_libretro gamekin3 -cart"; ext="";;
*"/j2me/NoIntro/"*) core="freej2me_libretro"; ext="jar";;
*"/palm/NoIntro/"*) core="mu_libretro"; ext="prc";;
esac

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

if [[ "$core" == "mame_libretro" || "$core" == "mame_libretro "* ]]; then
  # MAME via libretro core. mame_libretro supports .cmd files as content
  # (see supported_extensions = "cmd|zip|7z" in mame_libretro.info): the
  # file's text is parsed as MAME command-line args. Same args we'd pass
  # to standalone MAME — just routed through the libretro frontend.
  # Bare "mame_libretro" = arcade ROMset (zip basename IS the machine);
  # "mame_libretro <driver> ..." = softlist or system-with-media.
  if [[ -z "$ext" ]]; then
    rompath="$(dirname "$1");$HOME/share/bios"
    rom="$(basename "${1%.*}")"
  fi
  # Model 2/3: the gameflix listing comes from an ElSemi-format archive
  # (m2emu1.1a / segamodel3) whose zips MAME can't read. The zip basenames
  # match MAME driver shortnames though, so point rompath at MAME's merged
  # romset — MAME finds the right ROMs there (including the model2 BIOS).
  # ElSemi-format dir is omitted entirely; it would only mask the MAME zips.
  case "$1" in
    */model2/*|*/model3/*) rompath="$HOME/share/roms/mame/MAME;$HOME/share/bios" ;;
  esac
  core=$(echo "$core" | sed -E 's|(-hard[0-9]+) ([a-z0-9_]+):([a-z0-9_]+)|\1 '"$HOME"'/share/bios/\2/\3/\3.chd|g')
  mame_args="${core#mame_libretro}"; mame_args="${mame_args# }"
  filename="${rom##*/}"; basename="${filename%.*}"
  cmd_file=$(mktemp --suffix=.cmd)
  echo "${mame_args:+$mame_args }$rom${rompath:+ -rompath \"$rompath\"} -skip_gameinfo -snapname \"$basename\"" > "$cmd_file"
  retroarch -L ~/.config/retroarch/cores/mame_libretro.so "$cmd_file"
  rm -f "$cmd_file"
  exit
fi

if [[ "$core" == "mame" || "$core" == "mame "* ]]; then
  # Standalone MAME — only model2/model3 still routed here. Arcade ROMset
  # (core="mame", zip basename IS the machine) gets shortname + -rompath
  # treatment so MAME can resolve parent/BIOS deps via its hash files.
  # TOSEC paths already set $ext and pre-mounted a real disk file into $rom.
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
  retroarch -L ~/.config/retroarch/cores/${core}.so "${rom}"
else
  ${core} "${rom}"
fi

if [ -z "$core" ]; then
  ark "$1"
fi
