# 🚀 Termux Supremo

**Setup completo e otimizado para desenvolvimento full-stack no Android.**

Transforme seu Termux em um ambiente de desenvolvimento profissional com uma única linha de comando!

---

## 📦 O que será instalado:

### 🐚 Shell & Terminal
- **Zsh** + **Oh My Zsh** com plugins (autosuggestions, syntax highlighting)
- **Oh My Posh v14.10.0** (versão compatível com Termux)
- Prompt personalizado e colorido

### 💻 Linguagens & Runtime
- **Node.js** (última versão estável)
- **Python 3** com pip
- **Clang** (compilador C/C++)

### 🛠️ Ferramentas de Desenvolvimento
- **Git** - Controle de versão
- **Vim** & **Nano** - Editores de texto
- **Tmux** - Multiplexador de terminal
- **SSH** - Acesso remoto

### ⚡ Utilitários Modernos
- **Bat** - `cat` com syntax highlighting
- **Ripgrep** - Busca ultrarrápida
- **Fzf** - Fuzzy finder interativo
- **Exa** - `ls` moderno com ícones
- **Htop** - Monitor de processos
- **Neofetch** - Info do sistema

### 🎨 Extras
- **ImageMagick** - Manipulação de imagens
- **FFmpeg** - Processamento de vídeo/áudio
- **Taskwarrior** - Gerenciador de tarefas
- **Proot-distro** - Distribuições Linux no Termux

**Total: 38 pacotes essenciais**

---

## 🚀 Instalação (Uma Linha)

```bash
pkg install git -y && git clone https://github.com/lucasrdsved/termux-supremo && cd termux-supremo && chmod +x setup.sh && ./setup.sh
```

### 📋 O que o script faz:

1. ✅ Atualiza o sistema (`pkg update && pkg upgrade`)
2. ✅ Configura acesso ao storage do Android
3. ✅ Instala todos os 38 pacotes essenciais
4. ✅ Configura Oh My Zsh com plugins
5. ✅ Instala Oh My Posh com temas
6. ✅ Cria backup de configurações existentes
7. ✅ Configura aliases úteis
8. ✅ Define Zsh como shell padrão

**Tempo estimado:** 5-10 minutos (depende da conexão)

---

## ⚙️ Pós-Instalação

Após a instalação, **feche e reabra o Termux** para aplicar as mudanças.

### Configure o Git:
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

### Explore os comandos:
```bash
ll              # Lista arquivos com ícones
cat arquivo.txt # Visualiza com syntax highlighting
neofetch        # Mostra info do sistema
```

Veja mais comandos em [`COMMANDS.md`](COMMANDS.md)

---

## 📱 Requisitos

- **Termux** instalado do [F-Droid](https://f-droid.org/packages/com.termux/) (⚠️ **NÃO use a versão da Play Store** - está descontinuada)
- Conexão com internet
- ~500MB de espaço livre

---

## 🔧 Solução de Problemas

Encontrou algum erro? Veja o guia: [`TROUBLESHOOTING.md`](TROUBLESHOOTING.md)

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja [`LICENSE`](LICENSE) para mais detalhes.

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Veja [`CONTRIBUTING.md`](CONTRIBUTING.md) para diretrizes.

---

## ⭐ Apoie o Projeto

Se este projeto foi útil para você, considere dar uma ⭐ no GitHub!

---

**Desenvolvido com ❤️ para a comunidade Termux**
