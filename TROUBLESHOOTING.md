# 🔧 Troubleshooting - Termux Supremo

Guia de solução de problemas comuns durante a instalação.

---

## ❌ "Repository is under maintenance" ou "Connection timeout"

**Causa:** Repositórios do Termux estão fora do ar ou lentos.

**Solução:**
```bash
termux-change-repo
```
Escolha um espelho alternativo:
- **Grimler** (recomendado)
- **Albatross**
- **Mirrors by BFSU**

---

## ❌ Oh My Posh não inicia ou mostra erro

**Causa:** Versões mais recentes do Oh My Posh não são compatíveis com Android.

**Solução:** O script instala automaticamente a **v14.10.0** que é a última versão compatível. Se você instalou manualmente outra versão:

```bash
cd $PREFIX/bin
rm oh-my-posh
wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v14.10.0/posh-linux-arm64" -O oh-my-posh
chmod +x oh-my-posh
```

---

## ❌ Permissões de storage negadas

**Causa:** Permissão de acesso ao armazenamento não foi concedida.

**Solução:**
```bash
termux-setup-storage
```
Quando aparecer o popup no Android, clique em **"Permitir"**.

---

## ❌ "pkg: command not found" após instalação

**Causa:** O Termux não foi reiniciado após a instalação.

**Solução:** Feche completamente o app Termux e abra novamente.

---

## ❌ Zsh não inicia automaticamente

**Causa:** O shell padrão não foi alterado corretamente.

**Solução:**
```bash
chsh -s zsh
```
Depois, feche e reabra o Termux.

---

## ❌ Plugins do Zsh não funcionam

**Causa:** Plugins não foram carregados no `.zshrc`.

**Solução:** Verifique se os plugins estão listados no `~/.zshrc`:
```bash
nano ~/.zshrc
```
Procure pela linha:
```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

---

## ❌ "No space left on device"

**Causa:** Espaço insuficiente no dispositivo.

**Solução:**
1. Libere espaço no Android
2. Execute: `pkg clean` para limpar cache
3. Tente a instalação novamente

---

## ❌ Erro ao baixar pacotes (404, 403)

**Causa:** Repositório específico está com problemas.

**Solução:**
```bash
pkg clean
pkg update
termux-change-repo  # Escolha outro espelho
```

---

## ❌ Git clone falha com erro de SSL

**Causa:** Certificados SSL desatualizados.

**Solução:**
```bash
pkg update ca-certificates
```

---

## 📝 Log de Instalação

O script gera um log completo em:
```
~/termux-supremo-setup.log
```

Para visualizar:
```bash
cat ~/termux-supremo-setup.log
```

---

## 🆘 Ainda com problemas?

1. Verifique o log de instalação
2. Abra uma [Issue no GitHub](https://github.com/lucasrdsved/termux-supremo/issues)
3. Inclua:
   - Versão do Android
   - Mensagem de erro completa
   - Conteúdo do log (se relevante)

---

## 🔄 Reinstalação Limpa

Se nada funcionar, faça uma reinstalação limpa:

```bash
# Backup de dados importantes primeiro!
cd ~
rm -rf .oh-my-zsh .zshrc .poshthemes
pkg uninstall zsh oh-my-posh -y

# Clone e instale novamente
cd ~
git clone https://github.com/lucasrdsved/termux-supremo
cd termux-supremo
chmod +x setup.sh
./setup.sh
```

---

**Dica:** Sempre use o Termux do F-Droid, nunca da Play Store!
