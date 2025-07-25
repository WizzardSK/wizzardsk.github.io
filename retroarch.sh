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
