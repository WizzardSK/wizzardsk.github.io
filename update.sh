wget -nv -O lowresnx.zip https://github.com/WizzardSK/gameflix/raw/refs/heads/main/fantasy/lowresnx.zip
wget -nv -O tic80.zip https://github.com/WizzardSK/gameflix/raw/refs/heads/main/fantasy/tic80.zip
wget -nv -O uzebox.zip https://github.com/WizzardSK/gameflix/raw/refs/heads/main/fantasy/uzebox.zip
wget -nv -O wasm4.zip https://github.com/WizzardSK/gameflix/raw/refs/heads/main/fantasy/wasm4.zip

wget -nv -O atari2600.zip https://github.com/WizzardSK/Atari_-_2600/raw/refs/heads/main/indexes.zip
unzip -q -o atari2600.zip -d atari2600
rm atari2600.zip

wget -nv https://github.com/WizzardSK/gameflix/raw/refs/heads/main/gameflix.zip
unzip -q -o gameflix.zip
rm gameflix.zip

git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git add .
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
git push
