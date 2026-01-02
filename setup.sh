#!/data/data/com.termux/files/usr/bin/bash
# ============================================
# TERMUX SUPREMO - Setup Inicial Completo
# ============================================
# Este script configura o Termux do ZERO com
# todas as ferramentas para desenvolvimento
# full-stack no Android.
# ============================================

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Arquivo de log
LOG_FILE="$HOME/termux-supremo-setup.log"
exec 1> >(tee -a "$LOG_FILE")
exec 2>&1

# Funções auxiliares
print_header() {
    echo -e "\n${CYAN}========================================${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}========================================${NC}\n"
}

print_step() {
    echo -e "${BLUE}==>${NC} ${GREEN}$1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

check_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ $1 - OK${NC}"
    else
        echo -e "${RED}❌ $1 - FALHOU${NC}"
        echo -e "${RED}Verifique o log em: $LOG_FILE${NC}"
        exit 1
    fi
}

# Banner inicial
clear
print_header "🚀 TERMUX SUPREMO - INSTALAÇÃO INICIAL"
echo -e "${CYAN}Configurando seu Termux do ZERO para desenvolvimento full-stack!${NC}\n"
echo -e "${YELLOW}Este processo pode levar alguns minutos...${NC}\n"
sleep 2

# Backup de configurações existentes (se houver)
print_step "Criando backup de configurações existentes..."
BACKUP_DIR="$HOME/.termux-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"
[ -f ~/.bashrc ] && cp ~/.bashrc "$BACKUP_DIR/" 2>/dev/null || true
[ -f ~/.zshrc ] && cp ~/.zshrc "$BACKUP_DIR/" 2>/dev/null || true
[ -f ~/.termux/termux.properties ] && cp ~/.termux/termux.properties "$BACKUP_DIR/" 2>/dev/null || true
echo -e "${GREEN}Backup salvo em: $BACKUP_DIR${NC}"

# 1. Atualização do sistema
print_header "📦 ETAPA 1/7: Atualizando Sistema"
print_step "Atualizando repositórios e pacotes do Termux..."
pkg update -y && pkg upgrade -y
check_status "Atualização do sistema"

# 2. Configuração de storage
print_header "💾 ETAPA 2/7: Configurando Acesso ao Storage"
print_step "Solicitando permissão de acesso ao armazenamento..."
if [ ! -d "$HOME/storage" ]; then
    termux-setup-storage
    sleep 2
fi
check_status "Configuração de storage"

# 3. Instalação de pacotes essenciais
print_header "🔧 ETAPA 3/7: Instalando Pacotes Essenciais"
print_step "Instalando 38 pacotes fundamentais..."
echo -e "${CYAN}Pacotes: git, nodejs, python, zsh, vim, tmux, bat, fzf, ripgrep, exa e mais...${NC}"
pkg install -y \
    git \
    nodejs \
    python \
    clang \
    vim \
    nano \
    tmux \
    curl \
    wget \
    proot \
    openssh \
    zsh \
    htop \
    bat \
    fzf \
    ripgrep \
    exa \
    jq \
    unzip \
    neofetch \
    imagemagick \
    ffmpeg \
    taskwarrior \
    termux-api \
    termux-tools \
    man \
    tree \
    ncdu \
    nmap \
    python-cryptography \
    libxml2-utils \
    pv
check_status "Instalação de pacotes essenciais"

# 4. Instalação do Oh My Zsh
print_header "🎨 ETAPA 4/7: Instalando Oh My Zsh"
print_step "Configurando shell Zsh com Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    check_status "Instalação do Oh My Zsh"
else
    echo -e "${YELLOW}Oh My Zsh já instalado, pulando...${NC}"
fi

# 5. Instalação de plugins do Zsh
print_header "🔌 ETAPA 5/7: Instalando Plugins do Zsh"
print_step "Instalando zsh-autosuggestions..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
check_status "zsh-autosuggestions"

print_step "Instalando zsh-syntax-highlighting..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
check_status "zsh-syntax-highlighting"

# 6. Instalação do Oh My Posh v14.10.0
print_header "✨ ETAPA 6/7: Instalando Oh My Posh"
print_step "Baixando Oh My Posh v14.10.0 (versão compatível com Termux)..."
cd $PREFIX/bin
wget -q "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v14.10.0/posh-linux-arm64" -O oh-my-posh
chmod +x oh-my-posh
check_status "Download do Oh My Posh"

print_step "Baixando temas do Oh My Posh..."
mkdir -p ~/.poshthemes
cd ~/.poshthemes
wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v14.10.0/themes.zip
unzip -o themes.zip && rm themes.zip
check_status "Temas do Oh My Posh"

# 7. Configuração do .zshrc
print_header "⚙️  ETAPA 7/7: Configurando Shell"
print_step "Criando arquivo .zshrc personalizado..."

cat > ~/.zshrc << 'EOF'
# ============================================
# TERMUX SUPREMO - Configuração Zsh
# ============================================

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
    command-not-found
)

source $ZSH/oh-my-zsh.sh

# Oh My Posh (descomente e escolha um tema)
# eval "$(oh-my-posh init zsh --config ~/.poshthemes/atomic.omp.json)"

# Aliases úteis
alias ll='exa -lah --icons'
alias ls='exa --icons'
alias cat='bat'
alias grep='rg'
alias find='fd'
alias top='htop'
alias cls='clear'
alias update='pkg update && pkg upgrade'
alias storage='cd ~/storage/downloads'

# Configurações
export EDITOR='nano'
export VISUAL='nano'

# Mensagem de boas-vindas
echo "🚀 Termux Supremo ativo!"
EOF

check_status "Configuração do .zshrc"

# Configurar Zsh como shell padrão
print_step "Definindo Zsh como shell padrão..."
chsh -s zsh
check_status "Shell padrão alterado para Zsh"

# Finalização
print_header "✅ INSTALAÇÃO CONCLUÍDA COM SUCESSO!"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}🎉 Seu Termux está pronto para desenvolvimento!${NC}\n"
echo -e "${YELLOW}📋 Próximos passos:${NC}"
echo -e "  ${BLUE}1.${NC} Feche e reabra o Termux para aplicar as mudanças"
echo -e "  ${BLUE}2.${NC} Execute ${GREEN}neofetch${NC} para ver as informações do sistema"
echo -e "  ${BLUE}3.${NC} Veja os comandos úteis em: ${GREEN}COMMANDS.md${NC}"
echo -e "  ${BLUE}4.${NC} Configure o Git: ${GREEN}git config --global user.name \"Seu Nome\"${NC}"
echo -e "  ${BLUE}5.${NC} Configure o Git: ${GREEN}git config --global user.email \"seu@email.com\"${NC}\n"
echo -e "${YELLOW}📝 Log salvo em:${NC} $LOG_FILE"
echo -e "${YELLOW}💾 Backup em:${NC} $BACKUP_DIR\n"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}Desenvolvido com ❤️  para a comunidade Termux${NC}\n"
