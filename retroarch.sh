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
*"/arduboy/NoIntro/"*) core="arduous_libretro";;
*"/arduboy/TOSEC/"*) core="arduous_libretro";;
*"/uzebox/MAME/"*) core="mame_libretro uzebox -cart";;
*"/commanderx16/Games/"*) core="x16emu"; ext="img";;
*"/vircon32/Vircon32/"*) core="vircon32_libretro";;
*"/chip8/MAME/"*) core="mame_libretro d6800 -quik";;
*"/atari2600/ROMS/"*) core="stella_libretro";;
*"/atari2600/NoIntro/"*) core="stella_libretro";;
*"/atari2600/TOSEC/"*) core="stella_libretro";;
*"/atari2600/Homebrew/"*) core="stella_libretro";;
*"/atari2600/Applications/"*) core="stella_libretro";;
*"/atari2600/Educational/"*) core="stella_libretro";;
*"/atari2600/MAME/"*) core="mame_libretro a2600 -cart";;
*"/atari2600/Cass MAME/"*) core="mame_libretro a2600 scharger -cass";;
*"/atari5200/NoIntro/"*) core="a5200_libretro";;
*"/atari5200/TOSEC/"*) core="a5200_libretro";;
*"/atari5200/Homebrew/"*) core="a5200_libretro";;
*"/atari5200/App/"*) core="a5200_libretro";;
*"/atari5200/MAME/"*) core="mame_libretro a5200 -cart";;
*"/atari7800/NoIntro/"*) core="prosystem_libretro";;
*"/atari7800/TOSEC/"*) core="prosystem_libretro";;
*"/atari7800/Homebrew/"*) core="prosystem_libretro";;
*"/atari7800/App/"*) core="prosystem_libretro";;
*"/atari7800/MAME/"*) core="mame_libretro a7800 -cart";;
*"/jaguar/NoIntro/"*) core="virtualjaguar_libretro";;
*"/jaguar/Games J64/"*) core="virtualjaguar_libretro";;
*"/jaguar/Games ROM/"*) core="virtualjaguar_libretro";;
*"/jaguar/MAME/"*) core="mame_libretro jaguar -cart";;
*"/jaguarcd/Redump/"*) core="bigpemu"; ext="cue";;
*"/jaguarcd/NonRedump/"*) core="bigpemu"; ext="cdi";;
*"/lynx/NoIntro/"*) core="mednafen_lynx_libretro";;
*"/lynx/TOSEC/"*) core="mednafen_lynx_libretro";;
*"/lynx/MAME/"*) core="mame_libretro lynx -cart"; ext="bin";;
*"/atari800/NoIntro/"*) core="atari800_libretro";;
*"/atari800/Games ATR/"*) core="atari800_libretro";;
*"/atari800/Games XEX/"*) core="atari800_libretro";;
*"/atari800/Games CAR/"*) core="atari800_libretro";;
*"/atari800/Games ATX/"*) core="atari800_libretro";;
*"/atari800/Games CAS/"*) core="atari800_libretro";;
*"/atari800/Compilations/"*) core="atari800_libretro";;
*"/atari800/Applications/"*) core="atari800_libretro";;
*"/atari800/Educational/"*) core="atari800_libretro";;
*"/atari800/MAME/"*) core="mame_libretro a800 -cart1";;
*"/atari800/Flop MAME/"*) core="mame_libretro a800 -flop1";;
*"/xegs/MAME/"*) core="mame_libretro xegs -cart";;
*"/atarist/NoIntro/"*) core="hatari_libretro";;
*"/atarist/Games ST/"*) core="hatari_libretro";;
*"/atarist/Games STX/"*) core="hatari_libretro";;
*"/atarist/Compilations/"*) core="hatari_libretro";;
*"/atarist/Applications/"*) core="hatari_libretro";;
*"/atarist/Educational/"*) core="hatari_libretro";;
*"/atarist/MAME/"*) core="mame_libretro st -flop";;
*"/apple1/TOSEC/"*) core="mame_libretro apple1 -cass";;
*"/apple1/App/"*) core="mame_libretro apple1 -cass";;
*"/apple1/MAME/"*) core="mame_libretro apple1 -cass";;
*"/apple2/Compilations/"*) core="mame_libretro apple2ee -flop1";;
*"/apple2/Educational/"*) core="mame_libretro apple2ee -flop1";;
*"/apple2/Applications/"*) core="mame_libretro apple2ee -flop1";;
*"/apple2/Cracked MAME/"*) core="mame_libretro apple2ee -flop1";;
*"/apple2/Misc MAME/"*) core="mame_libretro apple2ee -flop1";;
*"/apple2/Orig MAME/"*) core="mame_libretro apple2ee -flop1";;
*"/apple2/Cass MAME/"*) core="mame_libretro apple2ee -cass";;
*"/apple2gs/2MG/"*) core="mame_libretro apple2gs -flop3";;
*"/apple2gs/Edu/"*) core="mame_libretro apple2gs -flop3";;
*"/apple2gs/App/"*) core="mame_libretro apple2gs -flop3";;
*"/apple2gs/Cracked MAME/"*) core="mame_libretro apple2gs -flop3";;
*"/apple2gs/Misc MAME/"*) core="mame_libretro apple2gs -flop3";;
*"/apple2gs/Orig MAME/"*) core="mame_libretro apple2gs -flop3";;
*"/apple3/TOSEC/"*) core="mame_libretro apple3 -flop1";;
*"/apple3/Applications/"*) core="mame_libretro apple3 -flop1";;
*"/apple3/WAP PD/"*) core="mame_libretro apple3 -flop1";;
*"/apple3/MAME/"*) core="mame_libretro apple3 -flop1";;
*"/lisa/Applications/"*) core="mame_libretro lisa -flop1";;
*"/lisa/MAME/"*) core="mame_libretro lisa -flop1";;
*"/macintosh/Flop MAME/"*) core="mame_libretro macse -flop1";;
*"/macintosh/Orig MAME/"*) core="mame_libretro macse -flop1";;
*"/macintosh/Cracked MAME/"*) core="mame_libretro macse -flop1";;
*"/macintosh/HDflop MAME/"*) core="mame_libretro macse -flop1";;
*"/macintosh/HDD CHD/"*) core="mame_libretro macse -hard";;
*"/macintosh/Games/"*) core="mame_libretro macse -flop1";;
*"/zx80/MAME/"*) core="mame_libretro zx80 -autoboot_command 'W\n' -autoboot_delay 3 -cass";;
*"/zx81/TOSEC/"*) core="81_libretro";;
*"/zx81/App/"*) core="81_libretro";;
*"/zx81/MAME/"*) core="mame_libretro zx81 -autoboot_command 'J\"\"\n' -autoboot_delay 3 -cass";;
*"/zxspectrum/Compilations/"*) core="fuse_libretro";;
*"/zxspectrum/Educational/"*) core="fuse_libretro";;
*"/zxspectrum/Applications/"*) core="fuse_libretro";;
*"/zxspectrum/MAME/"*) core="mame_libretro spectrum -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass";;
*"/zxspectrum/Cass MAME/"*) core="mame_libretro tc2068 -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass";;
*"/zxspectrum/Beta Disc MAME/"*) core="mame_libretro pentagon -flop";;
*"/zxspectrum/Opus Flop MAME/"*) core="mame_libretro spec128 -flop";;
*"/zxspectrum/Cart MAME/"*) core="mame_libretro specpls3 -cart";;
*"/zxspectrum/MGT Flop MAME/"*) core="mame_libretro spec128 -flop";;
*"/specpls3/MAME/"*) core="mame_libretro specpls3 -flop";;
*"/ql/Demos MDV/"*) core="mame_libretro ql -autoboot_command 'BOOT\n' -autoboot_delay 5 -utap1"; ext="mdv";;
*"/ql/Cass MAME/"*) core="mame_libretro ql -autoboot_command 'BOOT\n' -autoboot_delay 5 -utap1";;
*"/ql/Cart MAME/"*) core="mame_libretro ql -cart";;
*"/ql/Flop MAME/"*) core="mame_libretro ql -exp trump -flop";;
*"/z88/MAME/"*) core="mame_libretro z88 -cart1";;
*"/amstradcpc/Games DSK/"*) core="cap32_libretro";;
*"/amstradcpc/Compilations DSK/"*) core="cap32_libretro";;
*"/amstradcpc/App/"*) core="cap32_libretro";;
*"/amstradcpc/Cass MAME/"*) core="mame_libretro cpc464 -autoboot_command 'RUN\"\n' -autoboot_delay 3 -cass";;
*"/amstradcpc/Flop MAME/"*) core="mame_libretro cpc6128 -flop1";;
*"/gx4000/TOSEC/"*) core="cap32_libretro";;
*"/gx4000/MAME/"*) core="mame_libretro gx4000 -cart";;
*"/pcw/MAME/"*) core="mame_libretro pcw8256 -flop";;
*"/pet/TOSEC/"*) core="vice_xpet_libretro";;
*"/pet/MAME/"*) core="mame_libretro pet2001n -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/pet/Flop MAME/"*) core="mame_libretro pet2001n -flop1";;
*"/pet/ROM MAME/"*) core="mame_libretro pet2001n -rom";;
*"/cplus4/NoIntro/"*) core="vice_xplus4_libretro";;
*"/cplus4/PRG/"*) core="vice_xplus4_libretro";;
*"/cplus4/TAP/"*) core="vice_xplus4_libretro";;
*"/cplus4/Utils/"*) core="vice_xplus4_libretro";;
*"/cplus4/MAME/"*) core="mame_libretro c16 -cart";;
*"/cplus4/Flop MAME/"*) core="mame_libretro c16 -flop";;
*"/cplus4/Cass MAME/"*) core="mame_libretro c16 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/vic10/MAME/"*) core="mame_libretro vic10";;
*"/c20/NoIntro/"*) core="vice_xvic_libretro";;
*"/c20/Compilations/"*) core="vice_xvic_libretro";;
*"/c20/App/"*) core="vice_xvic_libretro";;
*"/c20/MAME/"*) core="mame_libretro vic20 -cart";;
*"/cbm2/Cart MAME/"*) core="mame_libretro cbm610 -cart";;
*"/cbm2/Flop MAME/"*) core="mame_libretro cbm610 -autoboot_command 'DLOAD\"\"*\"\"\nRUN\n' -autoboot_delay 5 -flop1";;
*"/c64/NoIntro/"*) core="vice_x64sc_libretro";;
*"/c64/PP/"*) core="vice_x64sc_libretro";;
*"/c64/Tapes/"*) core="vice_x64sc_libretro";;
*"/c64/Arcade/"*) core="vice_x64sc_libretro";;
*"/c64/Adventure/"*) core="vice_x64sc_libretro";;
*"/c64/Shoot'em Up/"*) core="vice_x64sc_libretro";;
*"/c64/Sports/"*) core="vice_x64sc_libretro";;
*"/c64/Racing/"*) core="vice_x64sc_libretro";;
*"/c64/Strategy/"*) core="vice_x64sc_libretro";;
*"/c64/Simulation/"*) core="vice_x64sc_libretro";;
*"/c64/Misc/"*) core="vice_x64sc_libretro";;
*"/c64/Boulder Dash/"*) core="vice_x64sc_libretro";;
*"/c64/Board/"*) core="vice_x64sc_libretro";;
*"/c64/Gambling/"*) core="vice_x64sc_libretro";;
*"/c64/Cards/"*) core="vice_x64sc_libretro";;
*"/c64/Educational/"*) core="vice_x64sc_libretro";;
*"/c64/Applications/"*) core="vice_x64sc_libretro";;
*"/c64/Cart MAME/"*) core="mame_libretro c64 -cart";;
*"/c64/Cass MAME/"*) core="mame_libretro c64 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/c64/Flop Orig MAME/"*) core="mame_libretro c64 -flop";;
*"/c64/Flop Misc MAME/"*) core="mame_libretro c64 -flop";;
*"/c128/Games/"*) core="vice_x128_libretro";;
*"/c128/App/"*) core="vice_x128_libretro";;
*"/c128/Cart MAME/"*) core="mame_libretro c128 -cart";;
*"/c128/Flop MAME/"*) core="mame_libretro c128 -flop";;
*"/c128/Rom MAME/"*) core="mame_libretro c128 -rom";;
*"/amiga500/NoIntro/"*) core="puae_libretro";;
*"/amiga500/Games ADF/"*) core="puae_libretro";;
*"/amiga500/Games SPS/"*) core="puae_libretro";;
*"/amiga500/Games EXE/"*) core="puae_libretro";;
*"/amiga500/Compilations/"*) core="puae_libretro";;
*"/amiga500/Edu/"*) core="puae_libretro";;
*"/amiga500/Applications/"*) core="puae_libretro";;
*"/amiga500/Flop MAME/"*) core="mame_libretro a500 -flop";;
*"/amiga500/ECS Flop MAME/"*) core="mame_libretro a600 -flop";;
*"/amiga500/OCS Flop MAME/"*) core="mame_libretro a500 -flop";;
*"/amiga500/AGA Flop MAME/"*) core="mame_libretro a1200 -flop";;
*"/amiga1200/Redump/"*) core="puae_libretro"; ext="cue";;
*"/amiga1200/ISO/"*) core="puae_libretro"; ext="cue";;
*"/amiga1200/App/"*) core="puae_libretro"; ext="cue";;
*"/amiga1200/Multimedia/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/Redump/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/ISO/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/App/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/Edu/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/Multimedia/"*) core="puae_libretro"; ext="cue";;
*"/amigacd32/CHD/"*) core="mame_libretro cd32 -cdrm";;
*"/nes/NoIntro/"*) core="nestopia_libretro";;
*"/nes/Games NES/"*) core="nestopia_libretro";;
*"/nes/Games UNF/"*) core="nestopia_libretro";;
*"/nes/MAME/"*) core="mame_libretro nes -cart";;
*"/nes/ADE MAME/"*) core="mame_libretro nes -cart";;
*"/nes/NTB MAME/"*) core="mame_libretro nes -cart1 nes:nantbb -cart2";;
*"/famicom/Cass MAME/"*) core="mame_libretro famicom famibs30 -cass";;
*"/fds/Disk System NoIntro/"*) core="nestopia_libretro";;
*"/fds/Disk System TOSEC/"*) core="nestopia_libretro";;
*"/fds/Disk System MAME/"*) core="mame_libretro fds -flop";;
*"/snes/NoIntro/"*) core="snes9x_libretro";;
*"/snes/TOSEC/"*) core="snes9x_libretro";;
*"/snes/MAME/"*) core="mame_libretro snes -cart";;
*"/snes/ST MAME/"*) core="mame_libretro snes -cart1 snes:sufami -cart2";;
*"/snes/BS-X MAME/"*) core="mame_libretro snes -cart";;
*"/snes-msu1/SNES MSU-1/"*) core="snes9x_libretro";;
*"/satellaview/NoIntro/"*) core="snes9x_libretro";;
*"/sufami/NoIntro/"*) core="snes9x_libretro";;
*"/sufami/TOSEC/"*) core="snes9x_libretro";;
*"/sgb/NoIntro/"*) core="mesen-s_libretro";;
*"/sgb/TOSEC/"*) core="mesen-s_libretro";;
*"/sgb/MAME/"*) core="mame_libretro supergb -cart";;
*"/n64/NoIntro/"*) core="mupen64plus_next_libretro";;
*"/n64/TOSEC/"*) core="mupen64plus_next_libretro";;
*"/n64/MAME/"*) core="mame_libretro n64 -cart";;
*"/n64dd/MAME/"*) core="mame_libretro n64dd -hard";;
*"/n64dd/Games NDD/"*) core="mame_libretro n64dd -hard";;
*"/gamecube/ISO/"*) core="dolphin_libretro"; ext="iso";;
*"/wii/Redump/"*) core="dolphin_libretro";;
*"/pokemini/NoIntro/"*) core="pokemini_libretro";;
*"/pokemini/TOSEC/"*) core="pokemini_libretro";;
*"/pokemini/MAME/"*) core="mame_libretro pokemini -cart";;
*"/virtualboy/NoIntro/"*) core="mednafen_vb_libretro";;
*"/virtualboy/TOSEC/"*) core="mednafen_vb_libretro";;
*"/virtualboy/MAME/"*) core="mame_libretro vboy -cart";;
*"/gb/NoIntro/"*) core="sameboy_libretro";;
*"/gb/TOSEC/"*) core="sameboy_libretro";;
*"/gb/MAME/"*) core="mame_libretro gameboy -cart";;
*"/gbc/NoIntro/"*) core="sameboy_libretro";;
*"/gbc/Games GBC/"*) core="sameboy_libretro";;
*"/gbc/Games GBX/"*) core="sameboy_libretro";;
*"/gbc/MAME/"*) core="mame_libretro gbcolor -cart";;
*"/gba/NoIntro/"*) core="mgba_libretro";;
*"/gba/TOSEC/"*) core="mgba_libretro";;
*"/gba/MAME/"*) core="mame_libretro gba -cart";;
*"/gba/e-Reader MAME/"*) core="mame_libretro gba -cart";;
*"/nds/DS NoIntro/"*) core="melonds_libretro";;
*"/nds/DS Download/"*) core="melonds_libretro";;
*"/nds/DS TOSEC/"*) core="melonds_libretro";;
*"/dsi/NoIntro/"*) core="melondsds_libretro";;
*"/dsi/TOSEC/"*) core="melondsds_libretro";;
*"/3ds/NoIntro/"*) core="citra_libretro"; ext="3ds";;
*"/wiiu/Redump/"*) core="cemu -g";;
*"/svmu/TOSEC/"*) core="mame_libretro svmu -quik";;
*"/svmu/MAME/"*) core="mame_libretro svmu -quik";;
*"/sg1000/NoIntro/"*) core="gearsystem_libretro";;
*"/sg1000/TOSEC/"*) core="gearsystem_libretro";;
*"/sg1000/MAME/"*) core="mame_libretro sg1000 -cart";;
*"/sc3000/App/"*) core="mame_libretro sc3000 -cart";;
*"/sc3000/Edu/"*) core="mame_libretro sc3000 -cart";;
*"/sc3000/WAV/"*) core="mame_libretro sc3000 -autoboot_command 'LOAD\n' -autoboot_delay 5 -cass";;
*"/sc3000/Cart MAME/"*) core="mame_libretro sc3000 -cart";;
*"/sc3000/Cass MAME/"*) core="mame_libretro sc3000 -autoboot_command 'LOAD\n' -autoboot_delay 5 -cass";;
*"/sc3000/Flop MAME/"*) core="mame_libretro sf7000 -flop";;
*"/segaai/MAME/"*) core="mame_libretro segaai -card";;
*"/mastersystem/NoIntro/"*) core="gearsystem_libretro";;
*"/mastersystem/TOSEC/"*) core="gearsystem_libretro";;
*"/mastersystem/MAME/"*) core="mame_libretro sms -cart";;
*"/megadrive/NoIntro/"*) core="genesis_plus_gx_libretro";;
*"/megadrive/TOSEC/"*) core="genesis_plus_gx_libretro";;
*"/megadrive/MAME/"*) core="mame_libretro megadriv -cart";;
*"/megadrive/Mega-Tech MAME/"*) core="mame_libretro megatech -cart";;
*"/megadrive-msu/Sega MSU-MD/"*) core="genesis_plus_gx_libretro"; ext="md";;
*"/pico/NoIntro/"*) core="picodrive_libretro";;
*"/pico/TOSEC/"*) core="picodrive_libretro";;
*"/pico/MAME/"*) core="mame_libretro pico -cart";;
*"/beena/NoIntro/"*) core="mame_libretro beena -cart";;
*"/beena/TOSEC/"*) core="mame_libretro beena -cart";;
*"/beena/MAME/"*) core="mame_libretro beena -cart";;
*"/sega32x/NoIntro/"*) core="picodrive_libretro";;
*"/sega32x/TOSEC/"*) core="picodrive_libretro";;
*"/sega32x/MAME/"*) core="mame_libretro 32x -cart";;
*"/megacd/Redump/"*) core="picodrive_libretro"; ext="cue";;
*"/megacd/ISO/"*) core="picodrive_libretro"; ext="cue";;
*"/megacd/NonRedump/"*) core="picodrive_libretro"; ext="cue";;
*"/saturn/Redump/"*) core="yabasanshiro_libretro"; ext="cue";;
*"/saturn/NonRedump/"*) core="yabasanshiro_libretro"; ext="cue";;
*"/saturn/ISO/"*) core="yabasanshiro_libretro"; ext="cue";;
*"/stv/MAME/"*) core="mame_libretro stvbios";;
*"/dreamcast/Redump/"*) core="flycast_libretro"; ext="cue";;
*"/dreamcast/NonRedump/"*) core="flycast_libretro"; ext="gdi";;
*"/dreamcast/US/"*) core="flycast_libretro"; ext="gdi";;
*"/dreamcast/PAL/"*) core="flycast_libretro"; ext="gdi";;
*"/dreamcast/JP/"*) core="flycast_libretro"; ext="gdi";;
*"/model2/Sega Model 2/"*) core="mame_libretro";;
*"/model3/Sega Model 3/"*) core="mame_libretro";;
*"/gamegear/NoIntro/"*) core="gearsystem_libretro";;
*"/gamegear/TOSEC/"*) core="gearsystem_libretro";;
*"/gamegear/MAME/"*) core="mame_libretro gamegear -cart";;
*"/pockstat/TOSEC/"*) core="mame_libretro pockstat -cart";;
*"/smc777/MAME/"*) core="mame_libretro smc777 -flop1";;
*"/psx/CHD EUR/"*) core="pcsx_rearmed_libretro";;
*"/psx/CHD JAP/"*) core="pcsx_rearmed_libretro";;
*"/psx/CHD USA/"*) core="pcsx_rearmed_libretro";;
*"/psx/NonRedump/"*) core="pcsx_rearmed_libretro"; ext="cue";;
*"/ps2/CHD 1/"*) core="pcsx2";;
*"/ps2/CHD 2/"*) core="pcsx2";;
*"/ps2/CHD 3/"*) core="pcsx2";;
*"/ps2/NonRedump A-G/"*) core="pcsx2"; ext="iso";;
*"/ps2/NonRedump H-Q/"*) core="pcsx2"; ext="iso";;
*"/ps2/NonRedump R-Z/"*) core="pcsx2"; ext="iso";;
*"/psp/Redump/"*) core="ppsspp_libretro"; ext="iso";;
*"/psp/NonRedump/"*) core="ppsspp_libretro"; ext="iso";;
*"/psp/TOSEC/"*) core="ppsspp_libretro"; ext="iso";;
*"/dos/eXoDOS/"*) core="dosbox_pure_libretro";;
*"/dos/TOSEC/"*) core="dosbox_pure_libretro";;
*"/dos/App TOSEC/"*) core="dosbox_pure_libretro";;
*"/dos/Edu TOSEC/"*) core="dosbox_pure_libretro";;
*"/dos/TOSEC-ISO/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1982/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1983/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1985/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1988/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1990/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1991/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1994/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1995/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1996/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1997/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1998/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 1999/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 199x/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 2002/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 2003/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 2008/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 2009/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 2011/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 2014/"*) core="dosbox_pure_libretro";;
*"/dos/TDC 2015/"*) core="dosbox_pure_libretro";;
*"/ibm5150/MAME/"*) core="mame_libretro ibm5150 -hard1 ibm5150_hdd:freedos13_8086";;
*"/ibm5170/MAME/"*) core="mame_libretro ibm5170 -hard1 ibm5170_hdd:freedos13";;
*"/ibm5170/CDROM CHD/"*) core="mame_libretro ibm5170 -cdrom";;
*"/ibm5170/CDROM MAME/"*) core="mame_libretro ibm5170 -cdrom";;
*"/ibm5170/HDD CHD/"*) core="mame_libretro ibm5170 -hard";;
*"/ibmpcjr/Cart MAME/"*) core="mame_libretro ibmpcjr";;
*"/ibmpcjr/Flop MAME/"*) core="mame_libretro ibmpcjr -hard1 ibm5150_hdd:freedos13_8086";;
*"/msx1/NoIntro/"*) core="bluemsx_libretro";;
*"/msx1/Games CAS/"*) core="bluemsx_libretro";;
*"/msx1/Games DSK/"*) core="bluemsx_libretro";;
*"/msx1/Games ROM/"*) core="bluemsx_libretro";;
*"/msx1/Games WV/"*) core="bluemsx_libretro";;
*"/msx1/Cart MAME/"*) core="mame_libretro expert11 -cart1";;
*"/msx1/Cass MAME/"*) core="mame_libretro expert11 -autoboot_command 'RUN\"CAS:\"\n' -autoboot_delay 3 -cass";;
*"/msx1/Flop MAME/"*) core="mame_libretro svi738 -flop";;
*"/msx2/NoIntro/"*) core="bluemsx_libretro";;
*"/msx2/Games/"*) core="bluemsx_libretro";;
*"/msx2/Cart MAME/"*) core="mame_libretro hbf1xd -cart1";;
*"/msx2/Flop MAME/"*) core="mame_libretro hbf1xd -flop";;
*"/msx2/Cass MAME/"*) core="mame_libretro hbf1xd -autoboot_command 'RUN\"CAS:\"\n' -autoboot_delay 3 -cass";;
*"/msx2+/TOSEC/"*) core="bluemsx_libretro";;
*"/msx2+/Cart MAME/"*) core="mame_libretro fsa1wsx -cart1";;
*"/msx2+/Flop MAME/"*) core="mame_libretro fsa1wsx -flop";;
*"/msxturbor/MSX TurboR/"*) core="bluemsx_libretro";;
*"/msxturbor/Flop MAME/"*) core="mame_libretro fsa1gt -flop1";;
*"/msxturbor/Cart MAME/"*) core="mame_libretro fsa1gt -cart1";;
*"/studio2/MAME/"*) core="mame_libretro studio2 -cart";;
*"/channelf/NoIntro/"*) core="freechaf_libretro";;
*"/channelf/Games/"*) core="freechaf_libretro";;
*"/channelf/MAME/"*) core="mame_libretro channelf -cart";;
*"/vectrex/NoIntro/"*) core="vecx_libretro";;
*"/vectrex/TOSEC/"*) core="vecx_libretro";;
*"/vectrex/MAME/"*) core="mame_libretro vectrex -cart";;
*"/o2em/NoIntro/"*) core="o2em_libretro";;
*"/o2em/TOSEC/"*) core="o2em_libretro";;
*"/o2em/MAME/"*) core="mame_libretro videopac -cart";;
*"/videopacplus/NoIntro/"*) core="o2em_libretro";;
*"/videopacplus/TOSEC/"*) core="o2em_libretro";;
*"/intellivision/NoIntro/"*) core="freeintv_libretro";;
*"/intellivision/TOSEC/"*) core="freeintv_libretro";;
*"/intellivision/MAME/"*) core="mame_libretro intv -cart";;
*"/intellivision/ECS MAME/"*) core="mame_libretro intvecs -cart";;
*"/colecovision/NoIntro/"*) core="gearcoleco_libretro";;
*"/colecovision/TOSEC/"*) core="gearcoleco_libretro";;
*"/colecovision/MAME/"*) core="mame_libretro coleco -cart";;
*"/colecovision/Homebrew MAME/"*) core="mame_libretro coleco -cart";;
*"/scv/NoIntro/"*) core="emuscv_libretro";;
*"/scv/TOSEC/"*) core="emuscv_libretro";;
*"/scv/MAME/"*) core="mame_libretro scv -cart";;
*"/ctvboy/MAME/"*) core="mame_libretro ctvboy -cart";;
*"/sv8000/MAME/"*) core="mame_libretro sv8000 -cart";;
*"/astrocade/NoIntro/"*) core="mame_libretro astrocde -cart";;
*"/astrocade/TOSEC/"*) core="mame_libretro astrocde -cart";;
*"/astrocade/MAME/"*) core="mame_libretro astrocde -cart";;
*"/apfm1000/NoIntro/"*) core="mame_libretro apfm1000 -cart";;
*"/apfm1000/TOSEC/"*) core="mame_libretro apfm1000 -cart";;
*"/apfm1000/MAME/"*) core="mame_libretro apfm1000 -cart";;
*"/apfm1000/Cass MAME/"*) core="mame_libretro apfimag -cass";;
*"/crvision/NoIntro/"*) core="mame_libretro crvision -cart";;
*"/crvision/TOSEC/"*) core="mame_libretro crvision -cart";;
*"/crvision/MAME/"*) core="mame_libretro crvision -cart";;
*"/vsmile/NoIntro/"*) core="mame_libretro vsmile -cart";;
*"/vsmile/TOSEC/"*) core="mame_libretro vsmile -cart";;
*"/vsmile/MAME/"*) core="mame_libretro vsmile -cart";;
*"/vsmile/Cart MAME/"*) core="mame_libretro vsmilem -cart";;
*"/vsmileb/MAME/"*) core="mame_libretro vsmileb -cart";;
*"/arcadia/NoIntro/"*) core="mame_libretro arcadia -cart";;
*"/arcadia/TOSEC/"*) core="mame_libretro arcadia -cart";;
*"/arcadia/MAME/"*) core="mame_libretro arcadia -cart";;
*"/hyperscan/MAME/"*) core="mame_libretro hyprscan -cdrom";;
*"/supracan/NoIntro/"*) core="mame_libretro supracan -cart";;
*"/supracan/TOSEC/"*) core="mame_libretro supracan -cart";;
*"/supracan/MAME/"*) core="mame_libretro supracan -cart";;
*"/vc4000/NoIntro/"*) core="mame_libretro vc4000 -cart";;
*"/vc4000/MAME/"*) core="mame_libretro vc4000 -cart";;
*"/multivision/Othello Multivision/"*) core="gearsystem_libretro";;
*"/vii/MAME/"*) core="mame_libretro vii -cart";;
*"/unichamp/MAME/"*) core="mame_libretro unichamp -cart";;
*"/entexsag/MAME/"*) core="mame_libretro sag -cart";;
*"/ekara/MAME/"*) core="mame_libretro ekara -cart";;
*"/videoart/MAME/"*) core="mame_libretro videoart -cart";;
*"/pdp1/MAME/"*) core="mame_libretro pdp1 -ptap1";;
*"/sol20/MAME/"*) core="mame_libretro sol20 -cass1";;
*"/trs80/Model III/"*) core="mame_libretro trs80m3 -quik";;
*"/trs80/Model 4/"*) core="mame_libretro trs80m3 -quik";;
*"/trs80/MAME/"*) core="mame_libretro trs80m3 -quik";;
*"/trs80/Cass MAME/"*) core="mame_libretro trs80m3 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass";;
*"/trs80/Flop MAME/"*) core="mame_libretro trs80m3 -flop1";;
*"/trs80/Model II MAME/"*) core="mame_libretro trs80m2 -flop1";;
*"/sorcerer/Cart MAME/"*) core="mame_libretro sorcerer -cart";;
*"/sorcerer/Cass MAME/"*) core="mame_libretro sorcerer -cart sorcerer_cart:basicpac -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 5 -cass1";;
*"/sorcerer/Flop MAME/"*) core="mame_libretro sorcererd -flop1";;
*"/z80ne/Cass MAME/"*) core="mame_libretro z80net -cass1";;
*"/z80ne/Flop MAME/"*) core="mame_libretro z80netf -flop1";;
*"/osborne1/MAME/"*) core="mame_libretro osborne1 -flop1";;
*"/jupace/MAME/"*) core="mame_libretro jupace -cass";;
*"/nascom/Snap MAME/"*) core="mame_libretro nascom2 -dump1";;
*"/nascom/Flop MAME/"*) core="mame_libretro nascom2 -flop1";;
*"/abc80/Flop MAME/"*) core="mame_libretro abc80 -flop1";;
*"/abc80/Cass MAME/"*) core="mame_libretro abc80 -cass";;
*"/abc80/ROM MAME/"*) core="mame_libretro abc80 -cart";;
*"/kaypro/MAME/"*) core="mame_libretro kaypro2x -flop1";;
*"/galaxy/MAME/"*) core="mame_libretro galaxy -autoboot_command 'OLD\nRUN\n' -autoboot_delay 3 -cass";;
*"/special/MAME/"*) core="mame_libretro special -autoboot_command 'I\n' -autoboot_delay 3 -cass";;
*"/special/Flop MAME/"*) core="mame_libretro specimx -flop1";;
*"/apogee/MAME/"*) core="mame_libretro apogee -autoboot_command 'I\n' -autoboot_delay 3 -cass";;
*"/radio86/MAME/"*) core="mame_libretro radio86 -autoboot_command 'I\n' -autoboot_delay 3 -cass";;
*"/mikrosha/MAME/"*) core="mame_libretro mikrosha -autoboot_command 'I\n' -autoboot_delay 3 -cass";;
*"/partner/Cass MAME/"*) core="mame_libretro partner -cass";;
*"/partner/Flop MAME/"*) core="mame_libretro partner -flop1";;
*"/korvet/MAME/"*) core="mame_libretro korvet -flop1";;
*"/atom/TOSEC/"*) core="mame_libretro atom -flop1";;
*"/atom/MAME/"*) core="mame_libretro atom -flop1";;
*"/atom/ROM MAME/"*) core="mame_libretro atom -cart";;
*"/atom/Cass MAME/"*) core="mame_libretro atom -cass";;
*"/interact/MAME/"*) core="mame_libretro interact -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass";;
*"/spc1000/MAME/"*) core="mame_libretro spc1000 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/cgenie/TOSEC/"*) core="mame_libretro cgenie -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass";;
*"/cgenie/Cass MAME/"*) core="mame_libretro cgenie -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass";;
*"/dragon64/TOSEC/"*) core="mame_libretro dragon64 -autoboot_command 'CLOAD\n' -autoboot_delay 4 -cass";;
*"/dragon64/MAME/"*) core="mame_libretro dragon64 -autoboot_command 'CLOAD\n' -autoboot_delay 4 -cass";;
*"/dragon64/Flop MAME/"*) core="mame_libretro dragon64 -flop1";;
*"/dragon64/Cart MAME/"*) core="mame_libretro dragon64 -cart";;
*"/dragon64/OS-9 MAME/"*) core="mame_libretro dragon64 -flop1";;
*"/dragon64/Flex MAME/"*) core="mame_libretro dragon64 -flop1";;
*"/dragon64/Alpha Flop MAME/"*) core="mame_libretro dragon64 -flop1";;
*"/oricatmos/TAP/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass";;
*"/oricatmos/MAME/"*) core="mame_libretro orica -autoboot_command 'CLOAD\"\"\n' -autoboot_delay 4 -cass";;
*"/camplynx/MAME/"*) core="mame_libretro lynx48k -autoboot_command 'mload\"\"\n' -autoboot_delay 2 -cass";;
*"/camplynx/Flop MAME/"*) core="mame_libretro lynx128k -flop1";;
*"/orao/MAME/"*) core="mame_libretro orao -cass";;
*"/vg5k/MAME/"*) core="mame_libretro vg5k -cass";;
*"/pegasus/MAME/"*) core="mame_libretro pegasus -rom1";;
*"/juku/MAME/"*) core="mame_libretro juku -flop1";;
*"/x07/MAME/"*) core="mame_libretro x07 -cass";;
*"/alice/A32 MAME/"*) core="mame_libretro alice32 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass";;
*"/alice/A90 MAME/"*) core="mame_libretro alice90 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass";;
*"/mc10/TOSEC/"*) core="mame_libretro mc10 -cass";;
*"/mc10/MAME/"*) core="mame_libretro mc10 -cass";;
*"/phc25/MAME/"*) core="mame_libretro phc25 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass";;
*"/laser310/200 VZ/"*) core="mame_libretro laser310 -dump";;
*"/laser310/200 App/"*) core="mame_libretro laser310 -dump";;
*"/laser310/310 App/"*) core="mame_libretro laser310 -dump";;
*"/laser310/MAME/"*) core="mame_libretro laser310 -dump";;
*"/laser310/Cass MAME/"*) core="mame_libretro laser310 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 2 -cass";;
*"/bk/TOSEC/"*) core="bk_libretro";;
*"/bk/App/"*) core="bk_libretro";;
*"/bk/MAME/"*) core="mame_libretro bk0010 -cass";;
*"/pmd85/MAME/"*) core="mame_libretro pmd851 -autoboot_command 'MGLD 00\n' -autoboot_delay 3 -cass";;
*"/lviv/MAME/"*) core="mame_libretro lviv -autoboot_command 'CLOAD \"\"\nRUN\n' -autoboot_delay 3 -cass";;
*"/mc1000/MAME/"*) core="mame_libretro mc1000 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/pecom64/MAME/"*) core="mame_libretro pecom64 -autoboot_command 'PLOAD\nRUN\n' -autoboot_delay 3 -cass";;
*"/spc1500/MAME/"*) core="mame_libretro spc1500 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/orion128/MAME/"*) core="mame_libretro orion128 -flop1";;
*"/orion128/Cass MAME/"*) core="mame_libretro orion128 -cass";;
*"/videobrain/MAME/"*) core="mame_libretro vidbrain -cart";;
*"/super80/Cass MAME/"*) core="mame_libretro super80 -cass";;
*"/super80/Flop MAME/"*) core="mame_libretro super80r -flop1";;
*"/bbcmicro/TOSEC/"*) core="mame_libretro bbcb -flop1";;
*"/bbcmicro/Flop MAME/"*) core="mame_libretro bbcb -flop1";;
*"/bbcmicro/Orig MAME/"*) core="mame_libretro bbcb -flop1";;
*"/bbcmicro/Micro Cass MAME/"*) core="mame_libretro bbcb -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass";;
*"/bbcmicro/Micro ROM MAME/"*) core="mame_libretro bbcb -rom1";;
*"/bbcmicro/Master Cart MAME/"*) core="mame_libretro bbcm -cart";;
*"/bbcmicro/Master Flop MAME/"*) core="mame_libretro bbcm -flop1";;
*"/bbcmicro/Master Compact Flop MAME/"*) core="mame_libretro bbcmc -flop1";;
*"/ti99/MAME/"*) core="mame_libretro ti99_4a";;
*"/mbee/Cart MAME/"*) core="mame_libretro mbee -rom2";;
*"/mbee/Quik MAME/"*) core="mame_libretro mbee -quik";;
*"/mbee/Flop MAME/"*) core="mame_libretro mbee56 -flop1";;
*"/m5/Cart MAME/"*) core="mame_libretro m5 -cart1";;
*"/m5/Cass MAME/"*) core="mame_libretro m5 -cart1 m5_cart:basici -autoboot_command 'CHAIN\n' -autoboot_delay 5 -cass";;
*"/aquarius/Cart MAME/"*) core="mame_libretro aquarius -cart1";;
*"/aquarius/Cass MAME/"*) core="mame_libretro aquarius -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass";;
*"/adam/TOSEC/"*) core="mame_libretro adam -flop1";;
*"/adam/App/"*) core="mame_libretro adam -flop1";;
*"/adam/MAME/"*) core="mame_libretro adam -flop1";;
*"/adam/Cass MAME/"*) core="mame_libretro adam -cass";;
*"/adam/Cart MAME/"*) core="mame_libretro adam -cart1";;
*"/spectravideo/Games/"*) core="bluemsx_libretro";;
*"/spectravideo/Various/"*) core="bluemsx_libretro";;
*"/spectravideo/MAME/"*) core="mame_libretro svi318 -autoboot_command 'CLOAD\nRUN\n' -autoboot_delay 3 -cass";;
*"/mtx/Cart MAME/"*) core="mame_libretro mtx512 -cart1";;
*"/mtx/Cass MAME/"*) core="mame_libretro mtx512 -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass";;
*"/mtx/Flop MAME/"*) core="mame_libretro mtx512 -exp_ext sdxbas -flop1";;
*"/mtx/ROM MAME/"*) core="mame_libretro mtx512 -rom";;
*"/pencil2/MAME/"*) core="mame_libretro pencil2 -cart";;
*"/electron/TOSEC/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass";;
*"/electron/App/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass";;
*"/electron/Edu/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass";;
*"/electron/MAME/"*) core="mame_libretro electron64 -autoboot_command '*T.\nCH.\"\"\n' -autoboot_delay 2 -cass";;
*"/electron/Flop MAME/"*) core="mame_libretro electron64 -flop";;
*"/electron/Cart MAME/"*) core="mame_libretro electron64 -exp plus1 -cart";;
*"/electron/ROM MAME/"*) core="mame_libretro electron64 -exp plus1 -rom";;
*"/tutor/TOSEC/"*) core="mame_libretro tutor -cart";;
*"/tutor/MAME/"*) core="mame_libretro tutor -cart";;
*"/exl100/MAME/"*) core="mame_libretro exl100 -cart";;
*"/compclr2/MAME/"*) core="mame_libretro compclr2 -flop1";;
*"/myvision/MAME/"*) core="mame_libretro myvision -cart";;
*"/einstein/MAME/"*) core="mame_libretro einstein -flop1";;
*"/kc85/Cass MAME/"*) core="mame_libretro kc85_4 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/kc85/Cart MAME/"*) core="mame_libretro kc85_4 -cart";;
*"/kc85/Flop MAME/"*) core="mame_libretro kc85_4 -flop1";;
*"/tvc/TC Computer CAS/"*) core="ep128emu_core_libretro";;
*"/tvc/TC Computer Flop MAME/"*) core="mame_libretro tvc64p -flop1";;
*"/tvc/TVC Cass MAME/"*) core="mame_libretro tvc64p -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/tvc/TVC Cart MAME/"*) core="mame_libretro tvc64p -cart";;
*"/rx78/NoIntro/"*) core="mame_libretro rx78 -cart";;
*"/rx78/TOSEC/"*) core="mame_libretro rx78 -cart";;
*"/rx78/Cart MAME/"*) core="mame_libretro rx78 -cart";;
*"/rx78/Cass MAME/"*) core="mame_libretro rx78 basic -cass";;
*"/coco/TOSEC/"*) core="mame_libretro coco3 -cart";;
*"/coco/App/"*) core="mame_libretro coco3 -cart";;
*"/coco/MAME/"*) core="mame_libretro coco3 -cart";;
*"/coco/Flop MAME/"*) core="mame_libretro coco3 -flop1";;
*"/samcoupe/DSK/"*) core="mame_libretro samcoupe -flop1";;
*"/samcoupe/MAME/"*) core="mame_libretro samcoupe -flop1";;
*"/samcoupe/Cass MAME/"*) core="mame_libretro samcoupe -autoboot_command 'LOAD \"\"\n' -autoboot_delay 3 -cass";;
*"/enterprise/Games/"*) core="ep128emu_core_libretro";;
*"/enterprise/64 & 128 Flop MAME/"*) core="mame_libretro ep128 -flop";;
*"/enterprise/Cart MAME/"*) core="mame_libretro ep128 -cart";;
*"/enterprise/Cass MAME/"*) core="mame_libretro ep128 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/vector06/MAME/"*) core="mame_libretro vector06 -flop1";;
*"/socrates/VTech Socrates/"*) core="mame_libretro socrates -cart";;
*"/thomson/MO5 K7/"*) core="theodore_libretro";;
*"/thomson/MO6 K7/"*) core="theodore_libretro";;
*"/thomson/TO7 K7/"*) core="theodore_libretro";;
*"/thomson/TO7 SAP/"*) core="theodore_libretro";;
*"/thomson/TO8 FD/"*) core="theodore_libretro";;
*"/thomson/TO8 K7/"*) core="theodore_libretro";;
*"/thomson/TO8 SAP/"*) core="theodore_libretro";;
*"/thomson/MO5 Cart MAME/"*) core="mame_libretro mo5 -cart";;
*"/thomson/MO5 Cass MAME/"*) core="mame_libretro mo5 -autoboot_command 'RUN\"\"\n' -autoboot_delay 3 -cass";;
*"/thomson/MO5 Flop MAME/"*) core="mame_libretro mo5 -flop";;
*"/thomson/MO6 Cass MAME/"*) core="mame_libretro mo6 -autoboot_command '2\nRUN\"\"\n' -autoboot_delay 5 -cass";;
*"/thomson/MO6 Flop MAME/"*) core="mame_libretro mo6 -flop";;
*"/thomson/TO Flop MAME/"*) core="mame_libretro to8 -flop";;
*"/thomson/TO7 Cart MAME/"*) core="mame_libretro to7 -cart";;
*"/thomson/TO7 Cass MAME/"*) core="mame_libretro to7 -cart basic -autoboot_command '1\nRUN\"\"\n' -autoboot_delay 5 -cass";;
*"/thomson/TO8 Cass MAME/"*) core="mame_libretro to8 -autoboot_command '2\nRUN\"\"\n' -autoboot_delay 5 -cass";;
*"/thomson/MO5 QD MAME/"*) core="mame_libretro mo5 -flop";;
*"/thomson/TO7 QD MAME/"*) core="mame_libretro to7 -flop";;
*"/rainbow/MAME/"*) core="mame_libretro rainbow -flop1";;
*"/tiki100/MAME/"*) core="mame_libretro tiki100 -flop1";;
*"/pro128/Cass MAME/"*) core="mame_libretro pro128 -autoboot_command 'RUN\"CASS:\"\n' -autoboot_delay 8 -cass";;
*"/pro128/Cart MAME/"*) core="mame_libretro pro128 -cart";;
*"/pro128/Flop MAME/"*) core="mame_libretro pro128 -flop1";;
*"/pro128s/MAME/"*) core="mame_libretro pro128s -flop1";;
*"/archimedes/TOSEC/"*) core="mame_libretro aa4401 -flop";;
*"/archimedes/App/"*) core="mame_libretro aa4401 -flop";;
*"/archimedes/MAME/"*) core="mame_libretro aa4401 -flop";;
*"/pc60/MAME/"*) core="mame_libretro pc6001 -cart1";;
*"/pc80/PC-8001 N-BASIC Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1";;
*"/pc80/PC-8001mkII N80 Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1";;
*"/pc80/PC-8001mkIISR N80SR Flop MAME/"*) core="mame_libretro pc8001mk2sr -flop1";;
*"/pc88/TOSEC/"*) core="quasi88_libretro";;
*"/pc88/Flop MAME/"*) core="mame_libretro pc8801 -flop1";;
*"/pc88/Cass MAME/"*) core="mame_libretro pc8801 -cass";;
*"/pc98/TOSEC/"*) core="np2kai_libretro";;
*"/pc98/MAME/"*) core="mame_libretro pc9801 -flop1";;
*"/pc98/CHD/"*) core="mame_libretro pc9821 -cdrm";;
*"/pc98/CD MAME/"*) core="mame_libretro pc9821 -cdrm";;
*"/pc98/PC-9821 TOSEC/"*) core="np2kai_libretro";;
*"/pcengine/NoIntro/"*) core="mednafen_pce_fast_libretro";;
*"/pcengine/TOSEC/"*) core="mednafen_pce_fast_libretro";;
*"/pcengine/MAME/"*) core="mame_libretro pce -cart";;
*"/pcengine/TurboGrafx MAME/"*) core="mame_libretro tg16 -cart";;
*"/pcengine/PCE TourVision MAME/"*) core="mame_libretro tourvis -cart";;
*"/supergrafx/NoIntro/"*) core="mednafen_supergrafx_libretro";;
*"/supergrafx/TOSEC/"*) core="mednafen_supergrafx_libretro";;
*"/supergrafx/MAME/"*) core="mame_libretro sgx -cart";;
*"/pcenginecd/Redump/"*) core="mednafen_pce_fast_libretro"; ext="cue";;
*"/pcenginecd/ISO/"*) core="mednafen_pce_fast_libretro"; ext="cue";;
*"/pcenginecd/NonRedump/"*) core="mednafen_pce_fast_libretro"; ext="cue";;
*"/pcenginecd/CHD/"*) core="mame_libretro pce -cdrm";;
*"/pcfx/Redump/"*) core="mednafen_pcfx_libretro"; ext="cue";;
*"/pcfx/ISO/"*) core="mednafen_pcfx_libretro"; ext="cue";;
*"/fm7/NoIntro/"*) core="mame_libretro fm7 -flop1";;
*"/fm7/Games T77/"*) core="mame_libretro fm7 -autoboot_command 'RUN\\n' -autoboot_delay 5 -cass,"; ext="Fujitsu - Micro 7";;
*"/fm7/Games D77/"*) core="mame_libretro fm7 -flop1";;
*"/fm7/MAME/"*) core="mame_libretro fm7 -flop1";;
*"/fm7/FM-7 Cass MAME/"*) core="mame_libretro fm7 -autoboot_command 'RUN\"\"\n' -autoboot_delay 5 -cass";;
*"/fm7/FM-8 Cass MAME/"*) core="mame_libretro fm8 -autoboot_command 'RUN\"\"\n' -autoboot_delay 5 -cass";;
*"/fm7/FM-77AV Flop MAME/"*) core="mame_libretro fm77av -flop1";;
*"/fm7/FM-77AV TOSEC/"*) core="mame_libretro fm77av -flop1";;
*"/fmtowns/Redump/"*) core="mame_libretro fmtmarty -cdrm";;
*"/fmtowns/MAME/"*) core="mame_libretro fmtmarty -cdrm";;
*"/fmtowns/CHD/"*) core="mame_libretro fmtmarty -cdrm";;
*"/fmtowns/Flop Orig MAME/"*) core="mame_libretro fmtowns -flop1";;
*"/fmtowns/Flop Misc MAME/"*) core="mame_libretro fmtowns -flop1";;
*"/fmtowns/Games/"*) core="mame_libretro fmtmarty -cdrm";;
*"/x1/Games/"*) core="x1_libretro";;
*"/x1/Cass MAME/"*) core="mame_libretro x1 -autoboot_command 'LOAD\n' -autoboot_delay 3 -cass";;
*"/x1/Flop MAME/"*) core="mame_libretro x1 -flop1";;
*"/x68000/DIM/"*) core="px68k_libretro";;
*"/x68000/App/"*) core="px68k_libretro";;
*"/x68000/MAME/"*) core="mame_libretro x68000 -flop1";;
*"/mz700/Games/"*) core="mame_libretro mz700 -autoboot_command 'L\n' -autoboot_delay 3 -cass";;
*"/mz700/MAME/"*) core="mame_libretro mz700 -autoboot_command 'L\n' -autoboot_delay 3 -cass";;
*"/mz800/Games/"*) core="mame_libretro mz800 -autoboot_command 'L\n' -autoboot_delay 3 -cass";;
*"/mz800/MAME/"*) core="mame_libretro mz800 -autoboot_command 'L\n' -autoboot_delay 3 -cass";;
*"/mz2000/MZT/"*) core="mame_libretro mz2000 -autoboot_command 'C' -autoboot_delay 5 -cass";;
*"/mz2000/MAME/"*) core="mame_libretro mz2000 -autoboot_command 'C' -autoboot_delay 5 -cass";;
*"/mz2500/MAME/"*) core="mame_libretro mz2500 -flop1";;
*"/pv1000/NoIntro/"*) core="mame_libretro pv1000 -cart";;
*"/pv1000/TOSEC/"*) core="mame_libretro pv1000 -cart";;
*"/pv1000/MAME/"*) core="mame_libretro pv1000 -cart";;
*"/pv2000/TOSEC/"*) core="mame_libretro pv2000 -cart";;
*"/pv2000/MAME/"*) core="mame_libretro pv2000 -cart";;
*"/loopy/NoIntro/"*) core="mame_libretro casloopy -cart";;
*"/loopy/TOSEC/"*) core="mame_libretro casloopy -cart";;
*"/loopy/MAME/"*) core="mame_libretro casloopy -cart";;
*"/amigacdtv/Redump/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/ISO/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/App/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/Edu/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/Multimedia/"*) core="puae_libretro"; ext="cue";;
*"/amigacdtv/CHD/"*) core="mame_libretro cdtv -cdrm";;
*"/cdi/Redump/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/NonRedump/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/TOSEC/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/App/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/Edu/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/Multimedia/"*) core="same_cdi_libretro"; ext="cue";;
*"/cdi/CHD/"*) core="mame_libretro cdimono1 -cdrm";;
*"/3do/Redump/"*) core="opera_libretro"; ext="cue";;
*"/3do/NonRedump/"*) core="opera_libretro"; ext="cue";;
*"/3do/TOSEC/"*) core="opera_libretro"; ext="cue";;
*"/3do/App/"*) core="opera_libretro"; ext="cue";;
*"/3do/Edu/"*) core="opera_libretro"; ext="cue";;
*"/3do/Multimedia/"*) core="opera_libretro"; ext="cue";;
*"/vis/Edu/"*) core="mame_libretro vis -cdrm"; ext="cue";;
*"/vis/Games/"*) core="mame_libretro vis -cdrm"; ext="cue";;
*"/vis/Multimedia/"*) core="mame_libretro vis -cdrm"; ext="cue";;
*"/mame/Merged/"*) core="mame_libretro";;
*"/mame/Non-Merged/"*) core="mame_libretro";;
*"/mame/Split/"*) core="mame_libretro";;
*"/mame/2000/"*) core="mame_libretro";;
*"/mame/2003/"*) core="mame_libretro";;
*"/mame/2006/"*) core="mame_libretro";;
*"/mame/2010/"*) core="mame_libretro";;
*"/mame/2015/"*) core="mame_libretro";;
*"/mame/2016/"*) core="mame_libretro";;
*"/vgmplay/MAME/"*) core="mame_libretro vgmplay -quik";;
*"/fbneo/FinalBurn Neo/"*) core="fbneo_libretro";;
*"/neogeo/MAME/"*) core="mame_libretro aes -cart";;
*"/neogeocd/Redump/"*) core="neocd_libretro"; ext="cue";;
*"/neogeocd/ISO/"*) core="neocd_libretro"; ext="cue";;
*"/ngp/NoIntro/"*) core="mednafen_ngp_libretro";;
*"/ngp/TOSEC/"*) core="mednafen_ngp_libretro";;
*"/ngp/MAME/"*) core="mame_libretro ngp -cart";;
*"/ngpc/NoIntro/"*) core="mednafen_ngp_libretro";;
*"/ngpc/TOSEC/"*) core="mednafen_ngp_libretro";;
*"/ngpc/MAME/"*) core="mame_libretro ngpc -cart";;
*"/gamepock/NoIntro/"*) core="mame_libretro gamepock -cart";;
*"/gamepock/MAME/"*) core="mame_libretro gamepock -cart";;
*"/supervision/NoIntro/"*) core="potator_libretro";;
*"/supervision/TOSEC/"*) core="potator_libretro";;
*"/supervision/MAME/"*) core="mame_libretro svision -cart";;
*"/wswan/NoIntro/"*) core="mednafen_wswan_libretro";;
*"/wswan/TOSEC/"*) core="mednafen_wswan_libretro";;
*"/wswan/MAME/"*) core="mame_libretro wswan -cart";;
*"/wswan/Pocket Challenge 2 NoIntro/"*) core="mednafen_wswan_libretro";;
*"/wswanc/NoIntro/"*) core="mednafen_wswan_libretro";;
*"/wswanc/TOSEC/"*) core="mednafen_wswan_libretro";;
*"/wswanc/MAME/"*) core="mame_libretro wscolor -cart";;
*"/megaduck/NoIntro/"*) core="mame_libretro megaduck -cart";;
*"/megaduck/MAME/"*) core="mame_libretro megaduck -cart";;
*"/microvision/MAME/"*) core="mame_libretro microvsn -cart";;
*"/gamate/NoIntro/"*) core="mame_libretro gamate -cart";;
*"/gamate/Games/"*) core="mame_libretro gamate -cart";;
*"/gamate/MAME/"*) core="mame_libretro gamate -cart";;
*"/juicebox/MAME/"*) core="mame_libretro juicebox";;
*"/gmaster/NoIntro/"*) core="mame_libretro gmaster -cart";;
*"/gmaster/TOSEC/"*) core="mame_libretro gmaster -cart";;
*"/gmaster/MAME/"*) core="mame_libretro gmaster -cart";;
*"/gamecom/NoIntro/"*) core="mame_libretro gamecom -cart1";;
*"/gamecom/TOSEC/"*) core="mame_libretro gamecom -cart1";;
*"/gamecom/MAME/"*) core="mame_libretro gamecom -cart1";;
*"/gp32/NoIntro/"*) core="mame_libretro gp32 -memc";;
*"/gp32/TOSEC/"*) core="mame_libretro gp32 -memc";;
*"/gp32/MAME/"*) core="mame_libretro gp32 -memc";;
*"/advision/NoIntro/"*) core="mame_libretro advision -cart";;
*"/advision/TOSEC/"*) core="mame_libretro advision -cart";;
*"/advision/MAME/"*) core="mame_libretro advision -cart";;
*"/mononcolor/MAME/"*) core="mame_libretro mononcol -cart";;
*"/gameking/MAME/"*) core="mame_libretro gameking -cart";;
*"/gameking3/MAME/"*) core="mame_libretro gamekin3 -cart";;
*"/j2me/NoIntro/"*) core="freej2me_libretro"; ext="jar";;
*"/palm/NoIntro/"*) core="mu_libretro"; ext="prc";;
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
