wget -nv https://github.com/WizzardSK/gameflix/raw/refs/heads/main/gameflix.zip
wget -nv https://github.com/WizzardSK/gameflix/raw/refs/heads/main/fantasy/lowresnx.zip
wget -nv https://github.com/WizzardSK/gameflix/raw/refs/heads/main/fantasy/tic80.zip
wget -nv https://github.com/WizzardSK/gameflix/raw/refs/heads/main/fantasy/uzebox.zip
wget -nv https://github.com/WizzardSK/gameflix/raw/refs/heads/main/fantasy/wasm4.zip
unzip -o gameflix.zip
rm gameflix.zip
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git add .
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
git push
