#!/data/data/com.termux/files/usr/bin/bash
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

LOG_FILE="$HOME/termux-setup.log"
exec 1> >(tee -a "$LOG_FILE")
exec 2>&1

check_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ $1 - OK${NC}"
    else
        echo -e "${RED}❌ $1 - FALHOU${NC}"
        exit 1
    fi
}

print_step() { echo -e "${BLUE}==>${NC} ${GREEN}$1${NC}"; }

# Backup
BACKUP_DIR="$HOME/.termux-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"
[ -f ~/.bashrc ] && cp ~/.bashrc "$BACKUP_DIR/" 2>/dev/null || true
[ -f ~/.zshrc ] && cp ~/.zshrc "$BACKUP_DIR/" 2>/dev/null || true
print_step "Backup criado em: $BACKUP_DIR"

# 1. Update
print_step "Atualizando Termux e repositórios..."
pkg update -y && pkg upgrade -y
check_status "Atualização do Termux"

# 2. Storage
print_step "Configurando acesso ao storage..."
if [ ! -d "$HOME/storage" ]; then termux-setup-storage; fi
check_status "Storage configurado"

# 3. Pacotes essenciais (38 pacotes)
print_step "Instalando pacotes essenciais..."
pkg install git nodejs python clang vim nano tmux curl wget proot openssh zsh htop bat fzf ripgrep exa jq unzip neofetch imagemagick ffmpeg taskwarrior termux-api termux-tools man tree ncdu nmap python-cryptography libxml2-utils pv -y
check_status "Instalação de pacotes"

# 4. Oh My Zsh
print_step "Instalando Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
check_status "Oh My Zsh"

# 5. Oh My Posh v14.10.0 (versão compatível)
print_step "Instalando Oh My Posh v14.10.0..."
cd $PREFIX/bin
wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v14.10.0/posh-linux-arm64" -O oh-my-posh
chmod +x oh-my-posh
mkdir -p ~/.poshthemes
cd ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v14.10.0/themes.zip
unzip -o themes.zip && rm themes.zip
check_status "Oh My Posh v14.10.0"

# Finalização
chsh -s zsh
print_step "✅ TERMUX SUPREMO INSTALADO! Reinicie o app Termux."
