#!/bin/bash
# Builds the site from the current main of WizzardSK/gameflix (its gamelist.sh
# runs generate.sh) and commits the result here, with the EmulationStation
# gamelists as gamelist.zip, which batocera.sh downloads.
site="$PWD"
git clone -q --depth 1 https://github.com/WizzardSK/gameflix.git ~/gameflix-src
cd ~/gameflix-src
bash ./gamelist.sh

cp -r ~/gameflix/. "$site/"
cp fantasy/lowresnx.zip fantasy/wasm4.zip "$site/"
cd ~/gamelists
rm -f "$site/gamelist.zip"
zip -q -r "$site/gamelist.zip" *

cd "$site"
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git add .
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
git push
