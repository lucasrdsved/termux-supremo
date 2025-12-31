#!/data/data/com.termux/files/usr/bin/bash
# Instalador Rápido Termux Supremo
pkg install git -y
git clone https://github.com/lucasrdsved/termux-supremo
cd termux-supremo
chmod +x restore.sh
./restore.sh