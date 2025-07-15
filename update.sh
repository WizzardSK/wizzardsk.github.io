wget -nv https://github.com/WizzardSK/gameflix/raw/refs/heads/main/gameflix.zip
unzip -o gameflix.zip
rm gameflix.zip
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git add .
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
git push
