#!/bin/bash
# Script básico demonstrando estruturas de controle
# Uso: ./basic_script.sh [opção]

echo "════════════════════════════════════════════════════════════"
echo "     SCRIPT BÁSICO DE DEMONSTRAÇÃO"
echo "════════════════════════════════════════════════════════════"
echo ""

# Função para saudação
saudacao() {
    echo "👋 Olá, $1!"
}

# Função para calcular idade
calcular_categoria_idade() {
    local idade=$1
    if [ $idade -lt 13 ]; then
        echo "Criança"
    elif [ $idade -lt 18 ]; then
        echo "Adolescente"
    elif [ $idade -lt 60 ]; then
        echo "Adulto"
    else
        echo "Idoso"
    fi
}

# Função para demonstrar loops
demonstrar_loops() {
    echo "🔹 LOOP FOR (1 a 5):"
    for i in 1 2 3 4 5; do
        echo "   Iteração $i"
    done
    echo ""

    echo "🔹 LOOP WHILE (Contagem 5 a 1):"
    contador=5
    while [ $contador -gt 0 ]; do
        echo "   Contagem: $contador"
        ((contador--))
    done
    echo ""
}

# Função para demonstrar condicionais
demonstrar_condicionais() {
    echo "🔹 COMPARAÇÕES NUMÉRICAS:"
    NUM=15
    if [ $NUM -eq 15 ]; then
        echo "   $NUM é igual a 15"
    fi
    if [ $NUM -gt 10 ]; then
        echo "   $NUM é maior que 10"
    fi
    if [ $NUM -lt 20 ]; then
        echo "   $NUM é menor que 20"
    fi
    echo ""

    echo "🔹 COMPARAÇÕES DE STRINGS:"
    STR="teste"
    if [ "$STR" = "teste" ]; then
        echo "   String é 'teste'"
    fi
    if [ -n "$STR" ]; then
        echo "   String não está vazia"
    fi
    echo ""
}

# Menu principal
show_menu() {
    echo "🔹 MENU DE OPÇÕES:"
    echo "   1. Saudação"
    echo "   2. Categorizar idade"
    echo "   3. Demonstrar loops"
    echo "   4. Demonstrar condicionais"
    echo "   5. Sair"
    echo ""
}

# Script principal
if [ $# -eq 0 ]; then
    # Modo interativo
    while true; do
        show_menu
        read -p "Escolha uma opção: " opcao
        echo ""

        case $opcao in
            1)
                read -p "Digite seu nome: " nome
                saudacao "$nome"
                ;;
            2)
                read -p "Digite uma idade: " idade
                categoria=$(calcular_categoria_idade $idade)
                echo "Categoria: $categoria"
                ;;
            3)
                demonstrar_loops
                ;;
            4)
                demonstrar_condicionais
                ;;
            5)
                echo "Até logo!"
                exit 0
                ;;
            *)
                echo "Opção inválida!"
                ;;
        esac
        echo ""
    done
else
    # Modo com argumentos
    case $1 in
        -h|--help)
            echo "Uso: $0 [opção]"
            echo "Opções:"
            echo "  -h, --help     Mostrar esta mensagem"
            echo "  -v, --version  Mostrar versão"
            echo "  (sem opção)    Modo interativo"
            ;;
        -v|--version)
            echo "Versão 1.0"
            ;;
        *)
            echo "Opção desconhecida: $1"
            echo "Use $0 -h para ajuda"
            ;;
    esac
fi

echo ""
echo "════════════════════════════════════════════════════════════"
