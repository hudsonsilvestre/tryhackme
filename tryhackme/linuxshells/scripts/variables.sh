#!/bin/bash
# Script demonstrando variáveis locais e de ambiente
# Uso: ./variables.sh

echo "════════════════════════════════════════════════════════════"
echo "     TRABALHANDO COM VARIÁVEIS"
echo "════════════════════════════════════════════════════════════"
echo ""

# Variáveis locais
echo "🔹 VARIÁVEIS LOCAIS (Shell Atual):"
MEU_VAR="Valor Local"
echo "   MINHA_VAR = $MEU_VAR"
echo ""

# Variáveis de ambiente
echo "🔹 CRIANDO VARIÁVEL DE AMBIENTE:"
export MEU_ENV="Valor de Ambiente"
echo "   MEU_ENV = $MEU_ENV"
echo "   (Esta variável será acessível em subshells)"
echo ""

# Variáveis especiais
echo "🔹 VARIÁVEIS ESPECIAIS:"
echo "   \$0 = $0 (nome do script)"
echo "   \$$ = $$ (PID do script)"
echo "   \$? = $? (status do último comando)"
echo "   \$# = $# (número de argumentos: $#)"
echo ""

# Argumentos
if [ $# -gt 0 ]; then
    echo "🔹 ARGUMENTOS PASSADOS:"
    echo "   Número de argumentos: $#"
    for i in $(seq 1 $#); do
        eval arg=\$$i
        echo "   Argumento $i: $arg"
    done
    echo ""
else
    echo "🔹 ARGUMENTOS:"
    echo "   Nenhum argumento foi passado."
    echo "   Uso: $0 arg1 arg2 arg3"
    echo ""
fi

# Concatenação de variáveis
echo "🔹 CONCATENAÇÃO DE VARIÁVEIS:"
NOME="João"
SOBRENOME="Silva"
NOME_COMPLETO="$NOME $SOBRENOME"
echo "   Nome: $NOME"
echo "   Sobrenome: $SOBRENOME"
echo "   Nome Completo: $NOME_COMPLETO"
echo ""

# Aritmética
echo "🔹 OPERAÇÕES ARITMÉTICAS:"
A=10
B=3
echo "   A = $A"
echo "   B = $B"
echo "   A + B = $((A + B))"
echo "   A - B = $((A - B))"
echo "   A * B = $((A * B))"
echo "   A / B = $((A / B))"
echo "   A % B = $((A % B))"
echo ""

# Verificar se variável está vazia
echo "🔹 VERIFICAÇÃO DE VARIÁVEIS VAZIAS:"
VAR_CHEIA="tem conteúdo"
VAR_VAZIA=""

if [ -z "$VAR_VAZIA" ]; then
    echo "   VAR_VAZIA está vazia"
fi

if [ -n "$VAR_CHEIA" ]; then
    echo "   VAR_CHEIA não está vazia"
fi
echo ""

echo "════════════════════════════════════════════════════════════"
