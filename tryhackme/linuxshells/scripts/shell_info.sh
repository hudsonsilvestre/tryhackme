#!/bin/bash
# Script para exibir informações sobre shells
# Uso: ./shell_info.sh

echo "════════════════════════════════════════════════════════════"
echo "     INFORMAÇÕES SOBRE SHELLS DO SISTEMA"
echo "════════════════════════════════════════════════════════════"
echo ""

# Shell atual
echo "🔹 SHELL ATUAL:"
echo "   Shell: $SHELL"
echo "   PID: $$"
echo ""

# Shells disponíveis
echo "🔹 SHELLS DISPONÍVEIS NO SISTEMA:"
cat /etc/shells
echo ""

# Informações de ambiente
echo "🔹 VARIÁVEIS DE AMBIENTE PRINCIPAIS:"
echo "   HOME: $HOME"
echo "   USER: $USER"
echo "   PWD: $PWD"
echo "   LOGNAME: $LOGNAME"
echo "   LANG: $LANG"
echo "   TERM: $TERM"
echo ""

# Versão do bash
echo "🔹 VERSÃO DO BASH:"
bash --version | head -1
echo ""

# Número de shells disponíveis
echo "🔹 CONTAGEM:"
echo "   Total de shells disponíveis: $(cat /etc/shells | wc -l)"
echo ""

echo "════════════════════════════════════════════════════════════"
