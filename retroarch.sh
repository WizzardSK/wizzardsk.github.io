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
*"Vircon32") core="vircon32_libretro";;
*"Atari 2600 ROMS") core="stella_libretro";;
*"No-Intro/Atari - Atari 2600") core="stella_libretro";;
*"TOSEC/Atari/2600 & VCS/Games") core="stella_libretro";;
*"TOSEC/Atari/2600 & VCS/Homebrew/Games/[BIN]") core="stella_libretro";;
*"No-Intro/Atari - Atari 5200") core="a5200_libretro";;
*"TOSEC/Atari/5200/Games") core="a5200_libretro";;
*"No-Intro/Atari - Atari 7800 (BIN)") core="prosystem_libretro";;
*"TOSEC/Atari/7800/Games") core="prosystem_libretro";;
*"No-Intro/Atari - 8-bit Family") core="atari800";;
*"TOSEC/Atari/8bit/Games/[ATR]") core="atari800";;
*"TOSEC/Atari/8bit/Games/[ATX]") core="atari800";;
*"TOSEC/Atari/8bit/Games/[BIN]") core="atari800";;
*"TOSEC/Atari/8bit/Games/[CAS]") core="atari800";;
*"TOSEC/Atari/8bit/Games/[XEX]") core="atari800";;
*"TOSEC/Atari/8bit/Educational/[ATR]") core="atari800";;
*"TOSEC/Atari/8bit/Applications/[ATR]") core="atari800";;
*"No-Intro/Atari - Atari ST") core="hatari_libretro";;
*"TOSEC/Atari/ST/Games/[ST]") core="hatari_libretro";;
*"TOSEC/Atari/ST/Games/[STX]") core="hatari_libretro";;
*"TOSEC/Atari/ST/Educational/[ST]") core="hatari_libretro";;
*"TOSEC/Atari/ST/Educational/[STX]") core="hatari_libretro";;
*"No-Intro/Atari - Atari Jaguar (J64)") core="virtualjaguar_libretro";;
*"TOSEC/Atari/Jaguar/Games/[J64]") core="virtualjaguar_libretro";;
*"Redump/Atari - Jaguar CD Interactive Multimedia System") core="bigpemu"; ext="cue";;
*"No-Intro/Non-Redump - Atari - Atari Jaguar CD") core="bigpemu"; ext="cdi";;
*"No-Intro/Atari - Atari Lynx (LYX)") core="mednafen_lynx_libretro";;
*"TOSEC/Atari/Lynx/Games/[LNX]") core="mednafen_lynx_libretro";;
*"No-Intro/Fairchild - Channel F") core="freechaf_libretro";;
*"TOSEC/Fairchild/VES & Channel F/Games") core="freechaf_libretro";;
*"No-Intro/GCE - Vectrex") core="vecx_libretro";;
*"TOSEC/GCE/Vectrex/Games") core="vecx_libretro";;
*"No-Intro/Magnavox - Odyssey 2") core="o2em_libretro";;
*"TOSEC/Magnavox/Odyssey2/Games") core="o2em_libretro";;
*"No-Intro/Philips - Videopac+") core="o2em_libretro";;
*"TOSEC/Philips/Videopac+/Games") core="o2em_libretro";;
*"No-Intro/Mattel - Intellivision") core="freeintv_libretro";;
*"TOSEC/Mattel/Intellivision/Games/[BIN]") core="freeintv_libretro";;
*"TOSEC/Coleco/ColecoVision ADAM/Games/[DSK]") core="mame adam -flop1";;
*"No-Intro/Coleco - ColecoVision") core="bluemsx_libretro";;
*"TOSEC/Coleco/ColecoVision/Games") core="bluemsx_libretro";;
*"No-Intro/Epoch - Super Cassette Vision") core="emuscv_libretro";;
*"TOSEC/Epoch/Super Cassette Vision/Games") core="emuscv_libretro";;
*"No-Intro/Epoch - Game Pocket Computer") core="mame gamepock -cart";;
*"No-Intro/Watara - Supervision") core="potator_libretro";;
*"TOSEC/Watara/Supervision/Games") core="potator_libretro";;
*"No-Intro/Bandai - WonderSwan") core="mednafen_wswan_libretro";;
*"TOSEC/Bandai/WonderSwan/Games") core="mednafen_wswan_libretro";;
*"No-Intro/Benesse - Pocket Challenge V2") core="mednafen_wswan_libretro";;
*"No-Intro/Bandai - WonderSwan Color") core="mednafen_wswan_libretro";;
*"TOSEC/Bandai/WonderSwan Color/Games") core="mednafen_wswan_libretro";;
*"No-Intro/Arduboy Inc - Arduboy") core="arduous_libretro";;
*"TOSEC/Arduboy/Arduboy/Games/[HEX]") core="arduous_libretro";;
*"No-Intro/Welback - Mega Duck") core="mame megaduck -cart";;
*"No-Intro/Bit Corporation - Gamate") core="mame gamate -cart";;
*"TOSEC/Bit Corporation/Gamate/Games") core="mame gamate -cart";;
*"No-Intro/Hartung - Game Master") core="mame gmaster -cart";;
*"TOSEC/Hartung/Game Master/Games") core="mame gmaster -cart";;
*"No-Intro/Tiger - Game.com") core="mame gamecom -cart1";;
*"TOSEC/Tiger Electronics/Game.com/Games") core="mame gamecom -cart1";;
*"No-Intro/GamePark - GP32") core="mame gp32 -memc";;
*"TOSEC/Game Park/GP32/Games/[SMC]") core="mame gp32 -memc";;
*"TOSEC/Amstrad/CPC/Games/[DSK]") core="cap32_libretro";;
*"TOSEC/Amstrad/CPC/Games/[CDT]") core="cap32_libretro";;
*"TOSEC/Amstrad/CPC/Games/[SNA]") core="cap32_libretro";;
*"TOSEC/Amstrad/GX4000/Games") core="cap32_libretro";;
*"TOSEC/Sinclair/ZX81/Games/[P]") core="81_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Games/[DSK]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Games/[SCL]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Games/[TAP]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Games/[TRD]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Games/[TZX]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Games/[Z80]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Educational/[TAP]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Educational/[TZX]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Educational/[Z80]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Applications/[TAP]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Applications/[TZX]") core="fuse_libretro";;
*"TOSEC/Sinclair/ZX Spectrum/Applications/[Z80]") core="fuse_libretro";;
*"TOSEC/Spectravideo/SVI-318 & SVI-328/Various/[CAS]") core="bluemsx_libretro";;
*"TOSEC/MGT/Sam Coupe/Games/[DSK]") core="simcoupe";;
*"TOSEC/MGT/Sam Coupe/Games/[SAD]") core="simcoupe";;
*"TOSEC/Tangerine/Oric-1 & Oric Atmos/Games/[DSK]") core="clksignal --quickload";;
*"TOSEC/Tangerine/Oric-1 & Oric Atmos/Games/[TAP]") core="clksignal --quickload";;
*"No-Intro/Bally - Astrocade") core="mame astrocde -cart";;
*"TOSEC/Bally/Professional Arcade & Astrocade/Games/[BIN]") core="mame astrocde -cart";;
*"No-Intro/APF - MP-1000") core="mame apfm1000 -cart";;
*"TOSEC/APF/M-1000/Games") core="mame apfm1000 -cart";;
*"No-Intro/Entex - Adventure Vision") core="mame advision -cart";;
*"TOSEC/Entex/Adventure Vision/Games") core="mame advision -cart";;
*"No-Intro/VTech - CreatiVision") core="mame crvision -cart";;
*"TOSEC/VTech/Laser 2001 & CreatiVision/Games") core="mame crvision -cart";;
*"No-Intro/VTech - V.Smile") core="mame vsmile -cart";;
*"TOSEC/VTech/V.Smile Motion/Games/[BIN]") core="mame vsmile -cart";;
*"No-Intro/Emerson - Arcadia 2001") core="mame arcadia -cart";;
*"TOSEC/Emerson/Arcadia 2001/Games") core="mame arcadia -cart";;
*"No-Intro/Casio - PV-1000") core="mame pv1000 -cart";;
*"TOSEC/Casio/PV-1000/Games") core="mame pv1000 -cart";;
*"No-Intro/Funtech - Super Acan") core="mame supracan -cart";;
*"TOSEC/Funtech/Super A'can/Games") core="mame supracan -cart";;
*"No-Intro/Interton - VC 4000") core="mame vc4000 -cart";;
*"TOSEC/Tsukuda Original/Othello Multivision/Games") core="gearsystem_libretro";;
*"TOSEC/Tandy Radio Shack/TRS-80 Color Computer/Games/[ROM]") core="mame coco3 -cart";;
*"Redump/Memorex - Visual Information System") core="mame vis -cdrm"; ext="cue";;
*"TOSEC/Acorn/BBC/Games/[SSD]") core="mame bbcb -flop1";;
*"TOSEC/Acorn/Electron/Games/[UEF]") core="mame electron64 -cass";;
*"TOSEC/Acorn/Archimedes/Games/[ADF]") core="mame aa4401 -flop";;
*"No-Intro/Fujitsu - FM-7 (Sector)") core="mame fm7 -flop1";;
*"TOSEC/Fujitsu/FM-7/Games/[D77]") core="mame fm7 -flop1";;
*"Redump/Fujitsu - FM-Towns") core="mame fmtmarty -cdrm";;
*"TOSEC/Tomy/Tutor & Pyuuta/Games") core="mame tutor -cart";;
*"TOSEC/Apple/II/Games/[DSK]") core="mame apple2ee -flop1";;
*"TOSEC/Apple/II/Games/[WOZ]") core="mame apple2ee -flop1";;
*"TOSEC/Apple/II/Educational/[DSK]") core="mame apple2ee -flop1";;
*"TOSEC/Apple/II/Educational/[WOZ]") core="mame apple2ee -flop1";;
*"TOSEC/Apple/II/Applications/[DSK]") core="mame apple2ee -flop1";;
*"TOSEC/Apple/II/Applications/[WOZ]") core="mame apple2ee -flop1";;
*"TOSEC/Thomson/MO5/Games/[K7]") core="theodore_libretro";;
*"TOSEC/Thomson/MO6/Games") core="theodore_libretro";;
*"TOSEC/Thomson/TO7/Games/[K7]") core="theodore_libretro";;
*"TOSEC/Thomson/TO7/Games/[M7]") core="theodore_libretro";;
*"TOSEC/Thomson/TO8, TO8D, TO9, TO9+/Games/[FD]") core="theodore_libretro";;
*"TOSEC/Thomson/TO8, TO8D, TO9, TO9+/Games/[K7]") core="theodore_libretro";;
*"TOSEC/Thomson/TO8, TO8D, TO9, TO9+/Games/[SAP]") core="theodore_libretro";;
*"No-Intro/Nintendo - Nintendo Entertainment System (Headered)") core="nestopia_libretro";;
*"TOSEC/Nintendo/Famicom & Entertainment System/Games/[NES]") core="nestopia_libretro";;
*"No-Intro/Nintendo - Family Computer Disk System (FDS)") core="nestopia_libretro";;
*"TOSEC/Nintendo/Famicom Disk System/Games/[FDS]") core="nestopia_libretro";;
*"No-Intro/Nintendo - Super Nintendo Entertainment System") core="snes9x_libretro";;
*"TOSEC/Nintendo/Super Famicom & Super Entertainment System/Games") core="snes9x_libretro";;
*"No-Intro/Nintendo - Satellaview") core="snes9x_libretro";;
*"No-Intro/Nintendo - Sufami Turbo") core="snes9x_libretro";;
*"TOSEC/Nintendo/Sufami Turbo/Games") core="snes9x_libretro";;
*"No-Intro/Nintendo - Nintendo 64 (ByteSwapped)") core="mupen64plus_next_libretro";;
*"TOSEC/Nintendo/64/Games") core="mupen64plus_next_libretro";;
*"Redump/Nintendo - GameCube - NKit RVZ [zstd-19-128k]") core="dolphin_libretro"; ext="rvz";;
*"TOSEC-ISO/Nintendo/GameCube/Games") core="dolphin_libretro"; ext="iso";;
*"No-Intro/Unofficial - Nintendo - Wii (Digital) (Deprecated) (WAD)") core="dolphin_libretro"; ext="wad";;
*"Redump/Nintendo - Wii - NKit RVZ [zstd-19-128k]") core="dolphin_libretro"; ext="rvz";;
*"Redump/Nintendo - Wii U - WUX") core="cemu -g"; ext="wux";;
*"No-Intro/Nintendo - Pokemon Mini") core="pokemini_libretro";;
*"TOSEC/Nintendo/Pokemon Mini/Games") core="pokemini_libretro";;
*"No-Intro/Nintendo - Virtual Boy") core="mednafen_vb_libretro";;
*"TOSEC/Nintendo/Virtual Boy/Games") core="mednafen_vb_libretro";;
*"No-Intro/Nintendo - Game Boy") core="sameboy_libretro";;
*"TOSEC/Nintendo/Game Boy/Games") core="sameboy_libretro";;
*"No-Intro/Nintendo - Game Boy Color") core="sameboy_libretro";;
*"TOSEC/Nintendo/Game Boy Color/Games") core="sameboy_libretro";;
*"No-Intro/Nintendo - Game Boy Advance") core="mgba_libretro";;
*"TOSEC/Nintendo/Game Boy Advance/Games") core="sameboy_libretro";;
*"No-Intro/Nintendo - Nintendo DS (Decrypted)") core="melonds_libretro";;
*"No-Intro/Nintendo - Nintendo DS (Download Play)") core="melonds_libretro";;
*"TOSEC/Nintendo/DS/Games") core="melonds_libretro";;
*"No-Intro/Nintendo - Nintendo DSi (Decrypted)") core="melondsds_libretro";;
*"No-Intro/Nintendo - Nintendo 3DS (Decrypted)") core="citra_libretro"; ext="3ds";;
*"No-Intro/Sega - SG-1000") core="genesis_plus_gx_libretro";;
*"TOSEC/Sega/Game 1000/Games") core="genesis_plus_gx_libretro";;
*"No-Intro/Sega - Master System - Mark III") core="genesis_plus_gx_libretro";;
*"TOSEC/Sega/Mark III & Master System/Games") core="genesis_plus_gx_libretro";;
*"No-Intro/Sega - Mega Drive - Genesis") core="genesis_plus_gx_libretro";;
*"TOSEC/Sega/Mega Drive & Genesis/Games/[BIN]") core="genesis_plus_gx_libretro";;
*"No-Intro/Sega - PICO") core="picodrive_libretro";;
*"TOSEC/Sega/Pico/Educational") core="picodrive_libretro";;
*"No-Intro/Sega - 32X") core="picodrive_libretro";;
*"TOSEC/Sega/32X/Games") core="picodrive_libretro";;
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
*"TOSEC/Sega/Game Gear/Games") core="genesis_plus_gx_libretro";;
*"Redump/Sony - PlayStation") core="pcsx_rearmed_libretro"; ext="cue";;
*"No-Intro/Non-Redump - Sony - PlayStation") core="pcsx_rearmed_libretro"; ext="cue";;
*"Redump/Sony - PlayStation 2") core="pcsx2"; ext="iso";;
*"No-Intro/Non-Redump - Sony - PlayStation 2") core="pcsx2"; ext="iso";;
*"Redump/Sony - PlayStation Portable") core="ppsspp_libretro"; ext="iso";;
*"No-Intro/Non-Redump - Sony - PlayStation Portable") core="ppsspp_libretro"; ext="iso";;
*"No-Intro/Unofficial - Sony - PlayStation Portable (PSN) (Decrypted)") core="ppsspp_libretro"; ext="iso";;
*"TOSEC-ISO/Sony/PlayStation Portable/Games/[ISO]") core="ppsspp_libretro"; ext="iso";;
*"No-Intro/NEC - PC Engine - TurboGrafx-16") core="mednafen_pce_fast_libretro";;
*"TOSEC/NEC/PC-Engine & TurboGrafx-16/Games") core="mednafen_pce_fast_libretro";;
*"Redump/NEC - PC Engine CD & TurboGrafx CD") core="mednafen_pce_fast_libretro"; ext="cue";;
*"TOSEC-ISO/NEC/PC-Engine CD & TurboGrafx-16 CD/Games/[IMG]") core="mednafen_pce_fast_libretro"; ext="cue";;
*"No-Intro/NEC - PC Engine SuperGrafx") core="mednafen_supergrafx_libretro";;
*"TOSEC/NEC/SuperGrafx/Games") core="mednafen_supergrafx_libretro";;
*"Redump/NEC - PC-FX & PC-FXGA") core="mednafen_pcfx_libretro"; ext="cue";;
*"TOSEC-ISO/NEC/PC-FX/Games") core="mednafen_pcfx_libretro"; ext="cue";;
*"Redump/Philips - CD-i") core="same_cdi_libretro"; ext="cue";;
*"No-Intro/Non-Redump - Philips - CD-i") core="same_cdi_libretro"; ext="cue";;
*"TOSEC-ISO/Philips/CD-i/Games") core="same_cdi_libretro"; ext="cue";;
*"Redump/Panasonic - 3DO Interactive Multiplayer") core="opera_libretro"; ext="cue";;
*"No-Intro/Non-Redump - Panasonic - 3DO Interactive Multiplayer") core="opera_libretro"; ext="cue";;
*"TOSEC-ISO/3DO/3DO Interactive Multiplayer/Games") core="opera_libretro"; ext="cue";;
*"roms/MS-DOS eXoDOS") core="dosbox_pure_libretro";;
*"TOSEC/IBM/PC Compatibles/Games/[IMG]") core="dosbox_pure_libretro";;
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
*"TOSEC/MSX/MSX/Games/[DSK]") core="bluemsx_libretro";;
*"No-Intro/Microsoft - MSX2") core="bluemsx_libretro";;
*"TOSEC/MSX/MSX2/Games/[DSK]") core="bluemsx_libretro";;
*"TOSEC/MSX/MSX2+/Games") core="bluemsx_libretro";;
*"TOSEC/MSX/TurboR/Games") core="bluemsx_libretro";;
*"TOSEC/Commodore/PET/Games/[PRG]") core="vice_xpet_libretro";;
*"No-Intro/Commodore - Plus-4") core="vice_xplus4_libretro";;
*"TOSEC/Commodore/C16, C116 & Plus-4/Games/[PRG]") core="vice_xplus4_libretro";;
*"TOSEC/Commodore/C16, C116 & Plus-4/Games/[TAP]") core="vice_xplus4_libretro";;
*"No-Intro/Commodore - VIC-20") core="vice_xvic_libretro";;
*"TOSEC/Commodore/VIC20/Games/[CRT]/Singlepart") core="vice_xvic_libretro";;
*"TOSEC/Commodore/VIC20/Games/[D64]") core="vice_xvic_libretro";;
*"TOSEC/Commodore/VIC20/Games/[PRG]/Singlepart") core="vice_xvic_libretro";;
*"TOSEC/Commodore/VIC20/Games/[TAP]") core="vice_xvic_libretro";;
*"No-Intro/Commodore - Commodore 64") core="vice_x64sc_libretro";;
*"No-Intro/Commodore - Commodore 64 (PP)") core="vice_x64sc_libretro";;
*"No-Intro/Commodore - Commodore 64 (Tapes)") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Adventure/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Arcade/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Boulder Dash/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Cards/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Gambling/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Misc/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Racing/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Shoot'em Up/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Simulation/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Sports/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Games/Strategy/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Educational/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C64/Applications/[D64]") core="vice_x64sc_libretro";;
*"TOSEC/Commodore/C128/Games/[D64]") core="vice_x128_libretro";;
*"No-Intro/Commodore - Amiga") core="puae_libretro";;
*"TOSEC/Commodore/Amiga/Games/[ADF]") core="puae_libretro";;
*"TOSEC/Commodore/Amiga/Games/[Unofficial IPF]") core="puae_libretro";;
*"TOSEC/Commodore/Amiga/Games/Public Domain/[ADF]") core="puae_libretro";;
*"TOSEC/Commodore/Amiga/Games/SPS") core="puae_libretro";;
*"TOSEC/Commodore/Amiga/Educational/[ADF]") core="puae_libretro";;
*"TOSEC/Commodore/Amiga/Applications/[ADF]") core="puae_libretro";;
*"Redump/Commodore - Amiga CD32") core="puae_libretro"; ext="cue";;
*"TOSEC-ISO/Commodore/Amiga CD32/Games/[ISO]") core="puae_libretro"; ext="cue";;
*"Redump/Commodore - Amiga CDTV") core="puae_libretro"; ext="cue";;
*"TOSEC-ISO/Commodore/Amiga CDTV/Games/[ISO]") core="puae_libretro"; ext="cue";;
*"TOSEC/NEC/PC-8801/Games/[D88]") core="quasi88_libretro";;
*"TOSEC/NEC/PC-9801/Games/[FDD]") core="np2kai_libretro";;
*"TOSEC/Sharp/X1/Games/[2D]") core="x1_libretro";;
*"TOSEC/Sharp/X1/Games/[D88]") core="x1_libretro";;
*"TOSEC/Sharp/X68000/Games/[DIM]") core="px68k_libretro";;
*"Internet Archive/chadmaster/mame-merged/mame-merged") core="mame";;
*"Internet Archive/chadmaster/fbnarcade-fullnonmerged/arcade") core="fbneo_libretro";;
*"Internet Archive/chadmaster/segamodel3/ROMs") core="supermodel";;
*"Redump/SNK - Neo Geo CD") core="neocd_libretro"; ext="cue";;
*"TOSEC-ISO/SNK/Neo-Geo CD/Games/[ISO]") core="neocd_libretro"; ext="cue";;
*"No-Intro/SNK - NeoGeo Pocket") core="mednafen_ngp_libretro";;
*"TOSEC/SNK/Neo-Geo Pocket/Games") core="mednafen_ngp_libretro";;
*"No-Intro/SNK - NeoGeo Pocket Color") core="mednafen_ngp_libretro";;
*"TOSEC/SNK/Neo-Geo Pocket Color/Games") core="mednafen_ngp_libretro";;
*"Neo Geo") core="fbneo_libretro";;
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
