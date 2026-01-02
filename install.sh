#!/data/data/com.termux/files/usr/bin/bash
# ============================================
# TERMUX SUPREMO - Instalador Rápido
# ============================================
# Este script clona o repositório e inicia
# a instalação completa do Termux Supremo
# ============================================

echo "🚀 Iniciando instalação do Termux Supremo..."
pkg install git -y
git clone https://github.com/lucasrdsved/termux-supremo
cd termux-supremo
chmod +x setup.sh
./setup.sh
