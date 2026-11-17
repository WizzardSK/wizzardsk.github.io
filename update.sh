#!/bin/bash
# Builds the site from the current main of WizzardSK/gameflix (its gamelist.sh
# runs generate.sh) and commits the result here, with the EmulationStation
# gamelists as gamelist.zip, which batocera.sh downloads. With MAIN_ONLY=true
# (the workflow's main_only input) only the front page is rebuilt.
site="$PWD"
git clone -q --depth 1 https://github.com/WizzardSK/gameflix.git ~/gameflix-src
cd ~/gameflix-src
if [[ "$MAIN_ONLY" == "true" ]]; then
  # Only the front page: main.html, the menu systems.html and index.html,
  # with the game counts of the deployed menu (menu.sh)
  bash ./menu.sh "$site/systems.html" || exit 1
  cp ~/gameflix/main.html ~/gameflix/systems.html ~/gameflix/index.html "$site/"
else
  bash ./gamelist.sh || exit 1

  cp -r ~/gameflix/. "$site/"
  cp fantasy/lowresnx.zip fantasy/wasm4.zip "$site/"
  cd ~/gamelists
  rm -f "$site/gamelist.zip"
  zip -q -r "$site/gamelist.zip" *
fi

cd "$site"
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git add .
git diff --cached --quiet && { echo "nothing changed"; exit 0; }
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
git push
