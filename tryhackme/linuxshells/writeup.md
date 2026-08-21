# Writeup - Linux Shells

## 📝 Guia Completo da Room Linux Shells

### Visão Geral

Esta room ensina sobre shells em Linux - a interface entre o usuário e o sistema operacional. É um conceito fundamental para qualquer pessoa trabalhando com Linux/Unix.

## 🏫 Passos Principais

### Passo 1: Conectar à Máquina

Primeiro, conecte à máquina do TryHackMe:

```bash
# Usando a interface web ou VPN do TryHackMe
# Abra o terminal disponibilizado
```

### Passo 2: Explorar Shells Disponíveis

**Verificar shell atual:**
```bash
echo $SHELL
# Saída: /bin/bash (ou outro shell)
```

**Listar todos os shells disponíveis:**
```bash
cat /etc/shells
```

**Exemplo de saída:**
```
/bin/sh
/bin/bash
/usr/bin/zsh
/usr/bin/fish
/usr/bin/ksh
```

### Passo 3: Trocar Entre Shells

**Trocar para o shell sh:**
```bash
sh
echo $0  # Mostra o shell atual
exit    # Sair do shell
```

**Trocar para bash:**
```bash
bash
echo $0
exit
```

**Trocar para zsh (se disponível):**
```bash
zsh
echo $0
exit
```

### Passo 4: Trabalhar com Variáveis

**Criar uma variável local:**
```bash
MEU_VAR="Olá"
echo $MEU_VAR
```

**Criar uma variável de ambiente:**
```bash
export MEU_ENV="Mundo"
echo $MEU_ENV
```

**Verificar variáveis de ambiente:**
```bash
env
# ou
env | grep MEU
```

**Variáveis de ambiente padrão:**
```bash
echo $HOME    # Diretório home
echo $USER    # Usuário atual
echo $PATH    # Caminho dos executáveis
echo $PWD     # Diretório atual
echo $SHELL   # Shell padrão
```

### Passo 5: Criar e Executar Scripts

**Criar um script simples:**
```bash
cat > hello.sh << 'EOF'
#!/bin/bash
echo "Olá, Mundo!"
EOF
```

**Dar permissão de execução:**
```bash
chmod +x hello.sh
```

**Executar o script:**
```bash
./hello.sh
# Saída: Olá, Mundo!
```

### Passo 6: Trabalhar com Argumentos

**Criar script com argumentos:**
```bash
cat > args.sh << 'EOF'
#!/bin/bash
echo "Nome do script: $0"
echo "Primeiro argumento: $1"
echo "Segundo argumento: $2"
echo "Número de argumentos: $#"
echo "Todos os argumentos: $@"
EOF
```

**Dar permissão e executar:**
```bash
chmod +x args.sh
./args.sh arg1 arg2 arg3
```

**Saída esperada:**
```
Nome do script: ./args.sh
Primeiro argumento: arg1
Segundo argumento: arg2
Número de argumentos: 3
Todos os argumentos: arg1 arg2 arg3
```

### Passo 7: Condicionais e Loops

**Script com condicional:**
```bash
cat > check_idade.sh << 'EOF'
#!/bin/bash
IDADE=25

if [ $IDADE -lt 18 ]; then
    echo "Menor de idade"
elif [ $IDADE -eq 18 ]; then
    echo "Exatamente 18 anos"
else
    echo "Maior de idade"
fi
EOF
```

**Script com loop for:**
```bash
cat > loop.sh << 'EOF'
#!/bin/bash
echo "Contando de 1 a 5:"
for i in 1 2 3 4 5; do
    echo "Número: $i"
done
EOF
```

**Script com loop while:**
```bash
cat > while_loop.sh << 'EOF'
#!/bin/bash
contador=1
while [ $contador -le 5 ]; do
    echo "Contador: $contador"
    ((contador++))
done
EOF
```

### Passo 8: Funções em Shell Scripts

**Script com funções:**
```bash
cat > functions.sh << 'EOF'
#!/bin/bash

# Definir função
saudacao() {
    echo "Olá, $1!"
}

# Definir função que retorna valor
somar() {
    return $(($1 + $2))
}

# Chamar funções
saudacao "João"
somar 5 3
echo "5 + 3 = $?"
EOF
```

### Passo 9: Operadores de Comparação

**Operadores numéricos:**
```bash
# -eq : igual
# -ne : não igual
# -lt : menor que
# -le : menor ou igual
# -gt : maior que
# -ge : maior ou igual

if [ 5 -gt 3 ]; then
    echo "5 é maior que 3"
fi
```

**Operadores de string:**
```bash
# = : igual
# != : não igual
# -z : string vazia
# -n : string não vazia

STR="teste"
if [ "$STR" = "teste" ]; then
    echo "String é 'teste'"
fi
```

**Operadores de arquivo:**
```bash
# -f : arquivo existe
# -d : diretório existe
# -r : arquivo é legível
# -w : arquivo é gravável
# -x : arquivo é executável

if [ -f arquivo.txt ]; then
    echo "arquivo.txt existe"
fi
```

### Passo 10: Redirecionamento e Pipes

**Redirecionamento de saída:**
```bash
echo "Texto" > arquivo.txt      # Sobrescreve
echo "Mais texto" >> arquivo.txt # Adiciona
```

**Redirecionamento de entrada:**
```bash
cat < arquivo.txt
```

**Pipes:**
```bash
echo "teste" | grep "es"
ls -la | grep ".sh"
```

## 🔑 Conceitos-Chave Resumidos

### Shells Comuns
- **sh** - Bourne Shell (simples, portável)
- **bash** - Bourne Again Shell (padrão em Linux)
- **zsh** - Z Shell (poderoso, plugins)
- **fish** - Friendly Interactive Shell (fácil de usar)

### Variáveis Importantes
- `$HOME` - Diretório do usuário
- `$USER` - Nome do usuário
- `$PATH` - Caminho dos executáveis
- `$PWD` - Diretório atual
- `$SHELL` - Shell padrão

### Estrutura de Script
```bash
#!/bin/bash           # Shebang

# Variáveis
VAR="valor"

# Funções
minha_funcao() {
    echo "Função"
}

# Condicionais
if [ condicao ]; then
    echo "Verdadeiro"
fi

# Loops
for i in 1 2 3; do
    echo "$i"
done
```

### Executar Scripts
```bash
bash script.sh              # Usar bash explicitamente
./script.sh                 # Executar diretamente (requer chmod +x)
sh script.sh                # Usar sh
source script.sh            # Executar no shell atual
```

## 💻 Exemplos Práticos

### Exemplo 1: Backup de Arquivos
```bash
#!/bin/bash
# Criar backup de um arquivo com timestamp

ARQUIVO=$1
if [ -f "$ARQUIVO" ]; then
    cp "$ARQUIVO" "${ARQUIVO}.backup.$(date +%s)"
    echo "Backup criado com sucesso"
else
    echo "Arquivo não encontrado"
fi
```

### Exemplo 2: Verificar Espaço em Disco
```bash
#!/bin/bash
# Verificar uso de espaço em disco

df -h | grep -E '(Filesystem|/$)'
```

### Exemplo 3: Processar Lista de Arquivos
```bash
#!/bin/bash
# Contar linhas em todos os .txt

for arquivo in *.txt; do
    if [ -f "$arquivo" ]; then
        linhas=$(wc -l < "$arquivo")
        echo "$arquivo: $linhas linhas"
    fi
done
```

## ✅ Checklist de Conclusão

- [x] Entender o que é um shell
- [x] Conhecer diferentes tipos de shells
- [x] Trabalhar com variáveis locais e de ambiente
- [x] Criar e executar shell scripts
- [x] Usar argumentos de linha de comando
- [x] Implementar condicionais e loops
- [x] Criar e usar funções
- [x] Trabalhar com redirecionamento e pipes
- [x] Compreender permissões de execução

## 🎓 Conhecimentos Adquiridos

✅ Shells são interfaces entre usuário e kernel
✅ Existem vários tipos de shells com recursos diferentes
✅ Variáveis locais vs variáveis de ambiente
✅ Shell scripting é poderoso para automação
✅ Estruturas de controle (if/while/for) em bash
✅ Funções podem ser reutilizadas em scripts
✅ Redirecionamento permite processar dados eficientemente

---

**Room Completada:** ✅
**Data de Conclusão:** August 21, 2026
