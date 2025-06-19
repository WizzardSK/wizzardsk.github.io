#!/bin/bash
head "$1"
adresar=$(dirname "$1")
adresar2="${adresar##*/}"
case "$adresar" in
*"TIC-80") core="tic80_libretro";;
*"WASM-4") core="wasm4_libretro";;
*"Uzebox") core="uzem_libretro";;
*"LowresNX") core="lowresnx_libretro";;
*"PICO-8") core="pico8 -run";;
*"Voxatron") core="vox";;
*"Atari 2600 ROMS") core="stella_libretro";;
*"No-Intro/Atari - 2600") core="stella_libretro";;
*"Atari 2600 TOSEC") core="stella_libretro";;
*"No-Intro/Atari - 5200") core="a5200_libretro";;
*"Atari 5200 TOSEC") core="a5200_libretro";;
*"No-Intro/Atari - 7800") core="prosystem_libretro";;
*"Atari 7800 TOSEC") core="prosystem_libretro";;
*"Atari 8bit ATR") core="atari800";;
*"Atari 8bit ATX") core="atari800";;
*"Atari 8bit BIN") core="atari800";;
*"Atari 8bit CAS") core="atari800";;
*"Atari 8bit XEX") core="atari800";;
*"Atari 8bit Edu") core="atari800";;
*"Atari 8bit Apps") core="atari800";;
*"No-Intro/Atari - ST") core="hatari_libretro";;
*"Atari ST ST") core="hatari_libretro";;
*"Atari ST STX") core="hatari_libretro";;
*"Atari ST Edu ST") core="hatari_libretro";;
*"Atari ST Edu STX") core="hatari_libretro";;
*"No-Intro/Atari - Jaguar (J64)") core="virtualjaguar_libretro";;
*"Atari Jaguar TOSEC") core="virtualjaguar_libretro";;
*"Redump/Atari - Jaguar CD Interactive Multimedia System") core="bigpemu"; ext="cue";;
*"No-Intro/Non-Redump - Atari - Atari Jaguar CD") core="bigpemu"; ext="cdi";;
*"No-Intro/Atari - Lynx (LYX)") core="mednafen_lynx_libretro";;
*"Atari Lynx TOSEC") core="mednafen_lynx_libretro";;
*"No-Intro/Fairchild - Channel F") core="freechaf_libretro";;
*"Fairchild Channel F TOSEC") core="freechaf_libretro";;
*"No-Intro/GCE - Vectrex") core="vecx_libretro";;
*"GCE Vectrex TOSEC") core="vecx_libretro";;
*"No-Intro/Magnavox - Odyssey 2") core="o2em_libretro";;
*"Magnavox Odyssey 2 TOSEC") core="o2em_libretro";;
*"No-Intro/Philips - Videopac+") core="o2em_libretro";;
*"Philips Videopac+ TOSEC") core="o2em_libretro";;
*"No-Intro/Mattel - Intellivision") core="freeintv_libretro";;
*"Mattel Intellivision TOSEC") core="freeintv_libretro";;
*"Coleco Adam") core="mame adam -flop1";;
*"No-Intro/Coleco - ColecoVision") core="bluemsx_libretro";;
*"Coleco Colecovision TOSEC") core="bluemsx_libretro";;
*"No-Intro/Epoch - Super Cassette Vision") core="emuscv_libretro";;
*"Epoch SCV TOSEC") core="emuscv_libretro";;
*"No-Intro/Epoch - Game Pocket Computer") core="mame gamepock -cart";;
*"No-Intro/Watara - Supervision") core="potator_libretro";;
*"Watara Supervision TOSEC") core="potator_libretro";;
*"No-Intro/Bandai - WonderSwan") core="mednafen_wswan_libretro";;
*"Bandai WonderSwan TOSEC") core="mednafen_wswan_libretro";;
*"No-Intro/Benesse - Pocket Challenge V2") core="mednafen_wswan_libretro";;
*"No-Intro/Bandai - WonderSwan Color") core="mednafen_wswan_libretro";;
*"WonderSwan Color TOSEC") core="mednafen_wswan_libretro";;
*"No-Intro/Arduboy Inc - Arduboy") core="arduous_libretro";;
*"No-Intro/Welback - Mega Duck") core="mame megaduck -cart";;
*"No-Intro/Bit Corporation - Gamate") core="mame gamate -cart";;
*"Bitcorp Gamate TOSEC") core="mame gamate -cart";;
*"No-Intro/Hartung - Game Master") core="mame gmaster -cart";;
*"Hartung Game Master TOSEC") core="mame gmaster -cart";;
*"No-Intro/Tiger - Game.com") core="mame gamecom -cart1";;
*"Tiger Game.com TOSEC") core="mame gamecom -cart1";;
*"No-Intro/GamePark - GP32") core="mame gp32 -memc";;
*"GamePark GP32 TOSEC") core="mame gp32 -memc";;
*"Amstrad CPC DSK") core="cap32_libretro";;
*"Amstrad CPC CDT") core="cap32_libretro";;
*"Amstrad CPC SNA") core="cap32_libretro";;
*"Amstrad GX4000 TOSEC") core="cap32_libretro";;
*"Sinclair ZX81 TOSEC") core="81_libretro";;
*"ZX Spectrum DSK") core="fuse_libretro";;
*"ZX Spectrum SCL") core="fuse_libretro";;
*"ZX Spectrum TAP") core="fuse_libretro";;
*"ZX Spectrum TRD") core="fuse_libretro";;
*"ZX Spectrum TZX") core="fuse_libretro";;
*"ZX Spectrum Z80") core="fuse_libretro";;
*"ZX Spectrum Edu TAP") core="fuse_libretro";;
*"ZX Spectrum Edu TZX") core="fuse_libretro";;
*"ZX Spectrum Edu Z80") core="fuse_libretro";;
*"ZX Spectrum App TAP") core="fuse_libretro";;
*"ZX Spectrum App TZX") core="fuse_libretro";;
*"ZX Spectrum App Z80") core="fuse_libretro";;
*"Spectravideo TOSEC") core="bluemsx_libretro";;
*"Sam Coupé DSK") core="simcoupe";;
*"Sam Coupé SAD") core="simcoupe";;
*"No-Intro/Bally - Astrocade") core="mame astrocde -cart";;
*"Bally Astrocade TOSEC") core="mame astrocde -cart";;
*"No-Intro/APF - MP-1000") core="mame apfm1000 -cart";;
*"APF MP-1000 TOSEC") core="mame apfm1000 -cart";;
*"No-Intro/Entex - Adventure Vision") core="mame advision -cart";;
*"Adventure Vision TOSEC") core="mame advision -cart";;
*"No-Intro/VTech - CreatiVision") core="mame crvision -cart";;
*"CreatiVision TOSEC") core="mame crvision -cart";;
*"No-Intro/VTech - V.Smile") core="mame vsmile -cart";;
*"VTech V.Smile TOSEC") core="mame vsmile -cart";;
*"No-Intro/Emerson - Arcadia 2001") core="mame arcadia -cart";;
*"Arcadia 2001 TOSEC") core="mame arcadia -cart";;
*"No-Intro/Casio - PV-1000") core="mame pv1000 -cart";;
*"Casio PV-1000 TOSEC") core="mame pv1000 -cart";;
*"No-Intro/Funtech - Super Acan") core="mame supracan -cart";;
*"Super Acan TOSEC") core="mame supracan -cart";;
*"No-Intro/Interton - VC 4000") core="mame vc4000 -cart";;
*"Othello Multivision") core="gearsystem_libretro";;
*"Tandy TRS-80 CoCo") core="mame coco3 -cart";;
*"Redump/Memorex - Visual Information System") core="mame vis -cdrm"; ext="cue";;
*"Acorn BBC") core="mame bbcb -flop1";;
*"Acorn Electron") core="mame electron64 -cass";;
*"Acorn Archimedes") core="mame aa4401 -flop";;
*"No-Intro/Fujitsu - FM-7 (Sector)") core="mame fm7 -flop1";;
*"Fujitsu Micro 7 D77") core="mame fm7 -flop1";;
*"Redump/Fujitsu - FM-Towns") core="mame fmtmarty -cdrm";;
*"Tomy Tutor") core="mame tutor -cart";;
*"Apple II DSK") core="mame apple2ee -flop1";;
*"Apple II WOZ") core="mame apple2ee -flop1";;
*"Apple II Edu DSK") core="mame apple2ee -flop1";;
*"Apple II Edu WOZ") core="mame apple2ee -flop1";;
*"Apple II App DSK") core="mame apple2ee -flop1";;
*"Apple II App WOZ") core="mame apple2ee -flop1";;
*"Thomson MO5 K7") core="theodore_libretro";;
*"Thomson MO6 K7") core="theodore_libretro";;
*"Thomson TO7 K7") core="theodore_libretro";;
*"Thomson TO7 M7") core="theodore_libretro";;
*"Thomson TO8 FD") core="theodore_libretro";;
*"Thomson TO8 K7") core="theodore_libretro";;
*"Thomson TO8 SAP") core="theodore_libretro";;
*"No-Intro/Nintendo - Nintendo Entertainment System (Headered)") core="nestopia_libretro";;
*"Nintendo NES TOSEC") core="nestopia_libretro";;
*"No-Intro/Nintendo - Family Computer Disk System (FDS)") core="nestopia_libretro";;
*"Famicom Disk System TOSEC") core="nestopia_libretro";;
*"No-Intro/Nintendo - Super Nintendo Entertainment System") core="snes9x_libretro";;
*"Nintendo SNES TOSEC") core="snes9x_libretro";;
*"No-Intro/Nintendo - Satellaview") core="snes9x_libretro";;
*"No-Intro/Nintendo - Sufami Turbo") core="snes9x_libretro";;
*"Sufami Turbo TOSEC") core="snes9x_libretro";;
*"No-Intro/Nintendo - Nintendo 64 (ByteSwapped)") core="mupen64plus_next_libretro";;
*"Nintendo 64 TOSEC") core="mupen64plus_next_libretro";;
*"Redump/Nintendo - GameCube - NKit RVZ [zstd-19-128k]") core="dolphin_libretro"; ext="rvz";;
*"TOSEC-ISO/Nintendo/GameCube/Games") core="dolphin_libretro"; ext="iso";;
*"No-Intro/Unofficial - Nintendo - Wii (Digital) (Deprecated) (WAD)") core="dolphin_libretro"; ext="wad";;
*"Redump/Nintendo - Wii - NKit RVZ [zstd-19-128k]") core="dolphin_libretro"; ext="rvz";;
*"Redump/Nintendo - Wii U - WUX") core="cemu -g"; ext="wux";;
*"No-Intro/Nintendo - Pokemon Mini") core="pokemini_libretro";;
*"Pokemon Mini TOSEC") core="pokemini_libretro";;
*"No-Intro/Nintendo - Virtual Boy") core="mednafen_vb_libretro";;
*"Virtual Boy TOSEC") core="mednafen_vb_libretro";;
*"No-Intro/Nintendo - Game Boy") core="sameboy_libretro";;
*"Game Boy TOSEC") core="sameboy_libretro";;
*"No-Intro/Nintendo - Game Boy Color") core="sameboy_libretro";;
*"Game Boy Color TOSEC") core="sameboy_libretro";;
*"No-Intro/Nintendo - Game Boy Advance") core="mgba_libretro";;
*"Game Boy Advance TOSEC") core="sameboy_libretro";;
*"No-Intro/Nintendo - Nintendo DS (Decrypted)") core="melonds_libretro";;
*"No-Intro/Nintendo - Nintendo DS (Download Play)") core="melonds_libretro";;
*"Nintendo DS TOSEC") core="melonds_libretro";;
*"No-Intro/Nintendo - Nintendo DSi (Decrypted)") core="melondsds_libretro";;
*"No-Intro/Nintendo - Nintendo 3DS (Decrypted)") core="citra_libretro"; ext="3ds";;
*"No-Intro/Sega - SG-1000") core="genesis_plus_gx_libretro";;
*"SG 1000 TOSEC") core="genesis_plus_gx_libretro";;
*"No-Intro/Sega - Master System - Mark III") core="genesis_plus_gx_libretro";;
*"Master System TOSEC") core="genesis_plus_gx_libretro";;
*"No-Intro/Sega - Mega Drive - Genesis") core="genesis_plus_gx_libretro";;
*"Mega Drive TOSEC") core="genesis_plus_gx_libretro";;
*"No-Intro/Sega - PICO") core="picodrive_libretro";;
*"Sega PICO TOSEC") core="picodrive_libretro";;
*"No-Intro/Sega - 32X") core="picodrive_libretro";;
*"Sega 32X TOSEC") core="picodrive_libretro";;
*"Redump/Sega - Mega CD & Sega CD") core="picodrive_libretro"; ext="cue";;
*"TOSEC-ISO/Sega/Mega-CD & Sega CD/CD/Games/[ISO]") core="picodrive_libretro"; ext="cue";;
*"Redump/Sega - Saturn") core="yabasanshiro_libretro"; ext="cue";;
*"No-Intro/Non-Redump - Sega - Sega Saturn") core="yabasanshiro_libretro"; ext="cue";;
*"TOSEC-ISO/Sega/Saturn/Games/[ISO]") core="yabasanshiro_libretro"; ext="cue";;
*"Redump/Sega - Dreamcast") core="flycast_libretro"; ext="cue";;
*"No-Intro/Non-Redump - Sega - Dreamcast") core="flycast_libretro"; ext="gdi";;
*"TOSEC-ISO/Sega/Dreamcast/Games/US") core="flycast_libretro"; ext="gdi";;
*"TOSEC-ISO/Sega/Dreamcast/Games/PAL") core="flycast_libretro"; ext="gdi";;
*"TOSEC-ISO/Sega/Dreamcast/Games/JP") core="flycast_libretro"; ext="gdi";;
*"No-Intro/Sega - Game Gear") core="genesis_plus_gx_libretro";;
*"Game Gear TOSEC") core="genesis_plus_gx_libretro";;
*"Redump/Sony - PlayStation") core="pcsx_rearmed_libretro"; ext="cue";;
*"No-Intro/Non-Redump - Sony - PlayStation") core="pcsx_rearmed_libretro"; ext="cue";;
*"Redump/Sony - PlayStation 2") core="pcsx2"; ext="iso";;
*"No-Intro/Non-Redump - Sony - PlayStation 2") core="pcsx2"; ext="iso";;
*"Redump/Sony - PlayStation Portable") core="ppsspp_libretro"; ext="iso";;
*"No-Intro/Non-Redump - Sony - PlayStation Portable") core="ppsspp_libretro"; ext="iso";;
*"No-Intro/Unofficial - Sony - PlayStation Portable (PSN) (Decrypted)") core="ppsspp_libretro"; ext="iso";;
*"TOSEC-ISO/Sony/PlayStation Portable/Games/[ISO]") core="ppsspp_libretro"; ext="iso";;
*"No-Intro/NEC - PC Engine - TurboGrafx-16") core="mednafen_pce_fast_libretro";;
*"PC Engine TOSEC") core="mednafen_pce_fast_libretro";;
*"Redump/NEC - PC Engine CD & TurboGrafx CD") core="mednafen_pce_fast_libretro"; ext="cue";;
*"TOSEC-ISO/NEC/PC-Engine CD & TurboGrafx-16 CD/Games/[IMG]") core="mednafen_pce_fast_libretro"; ext="cue";;
*"No-Intro/NEC - PC Engine SuperGrafx") core="mednafen_supergrafx_libretro";;
*"PC Engine 2 TOSEC") core="mednafen_supergrafx_libretro";;
*"Redump/NEC - PC-FX & PC-FXGA") core="mednafen_pcfx_libretro"; ext="cue";;
*"TOSEC-ISO/NEC/PC-FX/Games") core="mednafen_pcfx_libretro"; ext="cue";;
*"Internet Archive/chadmaster/mame-merged/mame-merged") core="mame";;
*"Internet Archive/chadmaster/fbnarcade-fullnonmerged/arcade") core="fbneo_libretro";;
*"Internet Archive/chadmaster/segamodel3/ROMs") core="supermodel";;
*"Redump/Philips - CD-i") core="same_cdi_libretro"; ext="cue";;
*"No-Intro/Non-Redump - Philips - CD-i") core="same_cdi_libretro"; ext="cue";;
*"TOSEC-ISO/Philips/CD-i/Games") core="same_cdi_libretro"; ext="cue";;
*"Redump/Panasonic - 3DO Interactive Multiplayer") core="opera_libretro"; ext="cue";;
*"No-Intro/Non-Redump - Panasonic - 3DO Interactive Multiplayer") core="opera_libretro"; ext="cue";;
*"TOSEC-ISO/3DO/3DO Interactive Multiplayer/Games") core="opera_libretro"; ext="cue";;
*"Neo Geo AES") core="fbneo_libretro";;
*"Neo Geo MVS") core="fbneo_libretro";;
*"Redump/SNK - Neo Geo CD") core="neocd_libretro"; ext="cue";;
*"TOSEC-ISO/SNK/Neo-Geo CD/Games/[ISO]") core="neocd_libretro"; ext="cue";;
*"No-Intro/SNK - NeoGeo Pocket") core="mednafen_ngp_libretro";;
*"Neo Geo Pocket TOSEC") core="mednafen_ngp_libretro";;
*"No-Intro/SNK - NeoGeo Pocket Color") core="mednafen_ngp_libretro";;
*"NGP Color TOSEC") core="mednafen_ngp_libretro";;
*"roms/MS-DOS eXoDOS") core="dosbox_pure_libretro";;
*"MS-DOS TOSEC") core="dosbox_pure_libretro";;
*"TOSEC-ISO/IBM/PC Compatibles/CD/Games/[ISO]") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1982") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1983") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1985") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1988") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1990") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1991") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1996") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1997") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/1999") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/199x") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/2002") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/2003") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/2008") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/2009") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/2011") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/2014") core="dosbox_pure_libretro";;
*"Internet Archive/sketch_the_cow/Total_DOS_Collection_Release_16_March_2019/Games/Files/2015") core="dosbox_pure_libretro";;
*"No-Intro/Microsoft - MSX") core="bluemsx_libretro";;
*"MSX 1 TOSEC") core="bluemsx_libretro";;
*"No-Intro/Microsoft - MSX2") core="bluemsx_libretro";;
*"MSX 2 TOSEC") core="bluemsx_libretro";;
*"MSX 2+ TOSEC") core="bluemsx_libretro";;
*"MSX TurboR") core="bluemsx_libretro";;
*"Commodore PET TOSEC") core="vice_xpet_libretro";;
*"No-Intro/Commodore - Plus-4") core="vice_xplus4_libretro";;
*"Commodore Plus-4 PRG") core="vice_xplus4_libretro";;
*"Commodore Plus-4 TAP") core="vice_xplus4_libretro";;
*"No-Intro/Commodore - VIC-20") core="vice_xvic_libretro";;
*"Commodore VIC-20 CRT") core="vice_xvic_libretro";;
*"Commodore VIC-20 D64") core="vice_xvic_libretro";;
*"Commodore VIC-20 PRG") core="vice_xvic_libretro";;
*"Commodore VIC-20 TAP") core="vice_xvic_libretro";;
*"Commodore 128 D64") core="vice_x128_libretro";;
*"No-Intro/Commodore - Commodore 64") core="vice_x64sc_libretro";;
*"No-Intro/Commodore - Commodore 64 (PP)") core="vice_x64sc_libretro";;
*"No-Intro/Commodore - Commodore 64 (Tapes)") core="vice_x64sc_libretro";;
*"Commodore 64 Adventure") core="vice_x64sc_libretro";;
*"Commodore 64 Arcade") core="vice_x64sc_libretro";;
*"Commodore 64 Boulder") core="vice_x64sc_libretro";;
*"Commodore 64 Cards") core="vice_x64sc_libretro";;
*"Commodore 64 Gambling") core="vice_x64sc_libretro";;
*"Commodore 64 Misc") core="vice_x64sc_libretro";;
*"Commodore 64 Racing") core="vice_x64sc_libretro";;
*"Commodore 64 Shoot'em") core="vice_x64sc_libretro";;
*"Commodore 64 Simulation") core="vice_x64sc_libretro";;
*"Commodore 64 Sports") core="vice_x64sc_libretro";;
*"Commodore 64 Strategy") core="vice_x64sc_libretro";;
*"Commodore 64 Edu") core="vice_x64sc_libretro";;
*"Commodore 64 Apps") core="vice_x64sc_libretro";;
*"No-Intro/Commodore - Amiga") core="puae_libretro";;
*"Amiga 1200 ADF") core="puae_libretro";;
*"Amiga 1200 IPF") core="puae_libretro";;
*"Amiga 1200 PD") core="puae_libretro";;
*"Amiga 1200 SPS") core="puae_libretro";;
*"Amiga 1200 Edu") core="puae_libretro";;
*"Amiga 1200 Apps") core="puae_libretro";;
*"Redump/Commodore - Amiga CD32") core="puae_libretro"; ext="cue";;
*"TOSEC-ISO/Commodore/Amiga CD32/Games/[ISO]") core="puae_libretro"; ext="cue";;
*"Redump/Commodore - Amiga CDTV") core="puae_libretro"; ext="cue";;
*"TOSEC-ISO/Commodore/Amiga CDTV/Games/[ISO]") core="puae_libretro"; ext="cue";;
*"NEC PC-88 TOSEC") core="quasi88_libretro";;
*"NEC PC-98 TOSEC") core="np2kai_libretro";;
*"Sharp X1 2D") core="x1_libretro";;
*"Sharp X1 D88") core="x1_libretro";;
*"Sharp X68000 TOSEC") core="px68k_libretro";;
esac

if [ -n "$ext" ]; then
  umount -l ~/iso
  mount-zip "$1" ~/iso
  rom=$(find ~/iso -type f -name "*.${ext}" | head -n 1)
else
  rom="$1"
fi

if [[ "$core" == *"mame"* ]]; then
  filename="${rom##*/}"
  basename="${filename%.*}"
  ${core} "${rom}" -skip_gameinfo -snapname "${basename}"
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
