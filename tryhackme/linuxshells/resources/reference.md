# Referência Rápida - Linux Shells

## 📋 Cheat Sheet

### Shells Disponíveis

```bash
# Ver shell atual
echo $SHELL

# Ver shell do processo
echo $0

# Listar todos os shells
cat /etc/shells

# Trocar para bash
bash

# Trocar para sh
sh

# Trocar para zsh
zsh

# Sair do shell
exit
```

### Variáveis

```bash
# Variável local
VAR="valor"

# Variável de ambiente
export VAR="valor"

# Ver todas as variáveis de ambiente
env

# Ver valor da variável
echo $VAR

# Usar variável em string
echo "Valor: $VAR"

# Usar variável com segurança
echo "${VAR}"
```

### Argumentos de Script

```bash
$0      # Nome do script
$1      # Primeiro argumento
$2      # Segundo argumento
$#      # Número de argumentos
$@      # Todos os argumentos
$*      # Todos os argumentos (sem preservar espaços)
$?      # Status do último comando (0=sucesso)
$$      # PID do shell/script
```

### Condicionais

```bash
# If-else simples
if [ condição ]; then
    echo "Verdadeiro"
else
    echo "Falso"
fi

# If-elif-else
if [ condição1 ]; then
    echo "Condição 1"
elif [ condição2 ]; then
    echo "Condição 2"
else
    echo "Nenhuma"
fi

# Switch/case
case $VAR in
    "valor1")
        echo "É valor1"
        ;;
    "valor2")
        echo "É valor2"
        ;;
    *)
        echo "Outro valor"
        ;;
esac
```

### Comparações Numéricas

```bash
[ $A -eq $B ]   # Igual
[ $A -ne $B ]   # Não igual
[ $A -lt $B ]   # Menor que
[ $A -le $B ]   # Menor ou igual
[ $A -gt $B ]   # Maior que
[ $A -ge $B ]   # Maior ou igual
```

### Comparações de Strings

```bash
[ "$A" = "$B" ]   # Igual
[ "$A" != "$B" ]  # Não igual
[ -z "$A" ]        # String vazia
[ -n "$A" ]        # String não vazia
```

### Testes de Arquivo

```bash
[ -f arquivo ]      # Arquivo existe
[ -d diretório ]    # Diretório existe
[ -L arquivo ]      # Symlink existe
[ -r arquivo ]      # Arquivo legível
[ -w arquivo ]      # Arquivo gravável
[ -x arquivo ]      # Arquivo executável
[ -s arquivo ]      # Arquivo não vazio
[ arquivo1 -nt arquivo2 ]  # arquivo1 é mais novo
[ arquivo1 -ot arquivo2 ]  # arquivo1 é mais antigo
```

### Operadores Lógicos

```bash
[ cond1 ] && [ cond2 ]   # AND
[ cond1 ] || [ cond2 ]   # OR
[ ! cond ]               # NOT

# Exemplos
if [ $IDADE -gt 18 ] && [ $IDADE -lt 65 ]; then
    echo "Trabalhável"
fi
```

### Loops

```bash
# For loop com lista
for item in 1 2 3 4 5; do
    echo $item
done

# For loop com range
for i in {1..5}; do
    echo $i
done

# For loop com comando
for arquivo in $(ls *.txt); do
    echo $arquivo
done

# While loop
while [ $contador -lt 10 ]; do
    echo $contador
    ((contador++))
done

# Until loop
until [ $contador -eq 10 ]; do
    echo $contador
    ((contador++))
done

# Loop infinito
while true; do
    echo "Infinito"
    sleep 1
done

# Break e continue
for i in {1..10}; do
    if [ $i -eq 3 ]; then
        continue  # Pula
    fi
    if [ $i -eq 8 ]; then
        break  # Sai
    fi
    echo $i
done
```

### Funções

```bash
# Definir função
minha_funcao() {
    echo "Olá, $1"
}

# Chamar função
minha_funcao "João"

# Função com retorno
dobrar() {
    return $((2 * $1))
}

dobrar 5
echo "Resultado: $?"

# Função com variáveis locais
minha_funcao() {
    local var_local="local"
    var_global="global"
}
```

### Aritmética

```bash
# Sintaxe 1: $(( ))
resultado=$((5 + 3))
echo $resultado  # 8

# Sintaxe 2: let
let resultado=5+3
echo $resultado  # 8

# Incremento
((contador++))
((contador--))

# Operações
$((A + B))      # Adição
$((A - B))      # Subtração
$((A * B))      # Multiplicação
$((A / B))      # Divisão
$((A % B))      # Módulo
```

### Manipulação de Strings

```bash
STR="Hello World"

# Comprimento
${#STR}          # Número de caracteres

# Substring
${STR:0:5}       # Primeiros 5 caracteres
${STR:6}         # A partir do 6º caractere

# Substituição
${STR/World/Universe}    # Substituir primeira ocorrência
${STR//o/0}              # Substituir todas as ocorrências

# Maiúsculas/Minúsculas
${STR^^}         # Converter para maiúsculas
${STR,,}         # Converter para minúsculas
```

### Redirecionamento

```bash
# Saída
echo "texto" > arquivo.txt      # Sobrescrever
echo "texto" >> arquivo.txt     # Anexar

# Entrada
comando < arquivo.txt

# Pipe
comando1 | comando2

# Erros
comando 2> erro.txt             # Redirecionar erros
comando > saida.txt 2>&1        # Saída e erros no mesmo arquivo
comando 2>/dev/null             # Descartar erros
```

### Permissões de Execução

```bash
# Tornar executável
chmod +x script.sh

# Usando números
chmod 755 script.sh    # rwxr-xr-x
chmod 700 script.sh    # rwx------

# Verificar permissões
ls -l script.sh
```

### Executar Scripts

```bash
# Usando bash
bash script.sh

# Usando sh
sh script.sh

# Executar diretamente
./script.sh           # Requer chmod +x

# Executar no shell atual
source script.sh
. script.sh
```

### Variáveis de Ambiente Comuns

```bash
echo $HOME      # Diretório home do usuário
echo $USER      # Nome do usuário
echo $PATH      # Diretório dos executáveis
echo $PWD       # Diretório atual
echo $OLDPWD    # Diretório anterior
echo $SHELL     # Shell padrão
echo $LOGNAME   # Nome de login
echo $HOSTNAME  # Nome da máquina
echo $LANG      # Idioma
echo $TERM      # Tipo de terminal
echo $EDITOR    # Editor padrão
```

### Dicas Úteis

```bash
# Verificar sintaxe
bash -n script.sh

# Modo debug
bash -x script.sh

# Combinar condições
if [ $A -gt 10 ] && [ $B -lt 5 ]; then
    echo "Ambas verdadeiras"
fi

# Testar antes de usar
if [ -x "$HOME/bin/meu_comando" ]; then
    "$HOME/bin/meu_comando"
fi

# Usar aspas para segurança
echo "$VAR"     # Seguro (expande variáveis)
echo '$VAR'     # Literal (não expande)
```

### Estrutura Recomendada de Script

```bash
#!/bin/bash
# Comentário descritivo
# Autor: Nome
# Data: 2026-08-21

set -e              # Parar se houver erro
set -u              # Erro se usar variável indefinida
set -o pipefail     # Erro se pipe falhar

# Variáveis
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Funções
minha_funcao() {
    local arg1=$1
    echo "$arg1"
}

# Main
main() {
    echo "Iniciando..."
    minha_funcao "teste"
}

# Executar
main "$@"
```

---

**Última Atualização:** 21 de Agosto de 2026
