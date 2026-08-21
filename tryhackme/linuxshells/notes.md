# Notas - Linux Shells

## 📚 Notas Detalhadas da Room

### O que é um Shell?

Um **shell** é um programa que atua como intermediário entre o usuário e o kernel do sistema operacional. Ele interpreta comandos digitados pelo usuário e os passa ao kernel para execução.

**Analogia:**
- Kernel = núcleo do sistema (realiza as operações)
- Shell = interface de comunicação (traduz comandos do usuário)

### Tipos de Shells

#### 1. **Bourne Shell (sh)**
- Shell original do Unix
- Muito simples e portável
- Encontrado em quase todos os sistemas Unix/Linux
- Comando: `sh`

#### 2. **Bash (Bourne Again Shell)**
- Versão melhorada do Bourne Shell
- Shell padrão em muitos sistemas Linux
- Suporta histórico de comandos
- Suporta tab completion
- Comando: `bash`

#### 3. **Zsh (Z Shell)**
- Shell muito poderoso com muitos recursos
- Autocomplete inteligente
- Temas e plugins (oh-my-zsh)
- Comando: `zsh`

#### 4. **Fish (Friendly Interactive Shell)**
- Foco em facilidade de uso
- Sugestões automáticas
- Sintaxe mais intuitiva
- Comando: `fish`

#### 5. **Ksh (Korn Shell)**
- Desenvolvido por David Korn
- Compatível com sh, mas com recursos adicionais
- Comando: `ksh`

#### 6. **Tcsh (TENEX C Shell)**
- Versão melhorada de csh
- Suporta C-like syntax
- Comando: `tcsh`

### Shell Variables vs Environment Variables

#### **Shell Variables (Variáveis Locais)**
```bash
# Definir variável local
MEU_VAR="valor"

# Acessar variável
echo $MEU_VAR

# A variável existe apenas no shell atual
# Não é acessível em subshells ou processos filhos
```

#### **Environment Variables (Variáveis de Ambiente)**
```bash
# Definir e exportar variável de ambiente
export MINHA_VAR="valor"

# Ou
MINHA_VAR="valor"
export MINHA_VAR

# A variável é acessível em todos os subshells e processos filhos
```

#### **Variáveis de Ambiente Comuns**

| Variável | Descrição |
|----------|----------|
| `$HOME` | Diretório home do usuário |
| `$PATH` | Caminho para executáveis |
| `$USER` | Nome do usuário atual |
| `$SHELL` | Shell padrão do usuário |
| `$PWD` | Diretório de trabalho atual |
| `$LOGNAME` | Nome de login do usuário |
| `$LANG` | Idioma do sistema |
| `$TERM` | Tipo de terminal |

### Shell Scripting Básico

#### **Estrutura de um Shell Script**

```bash
#!/bin/bash
# Shebang - especifica qual shell usar

# Comentário
echo "Olá, Mundo!"
```

#### **Variáveis em Scripts**

```bash
#!/bin/bash

# Definir variáveis
NOME="João"
IDADE=25

# Usar variáveis
echo "Nome: $NOME"
echo "Idade: $IDADE"

# Argumentos de linha de comando
echo "Primeiro argumento: $1"
echo "Segundo argumento: $2"
echo "Número de argumentos: $#"
echo "Todos os argumentos: $@"
```

#### **Condicionais**

```bash
#!/bin/bash

IDADE=15

if [ $IDADE -lt 18 ]; then
    echo "Você é menor de idade"
elif [ $IDADE -eq 18 ]; then
    echo "Você tem exatamente 18 anos"
else
    echo "Você é maior de idade"
fi
```

#### **Loops**

```bash
#!/bin/bash

# Loop for
for i in 1 2 3 4 5; do
    echo "Número: $i"
done

# Loop while
contador=0
while [ $contador -lt 5 ]; do
    echo "Contador: $contador"
    ((contador++))
done

# Loop until
contador=0
until [ $contador -eq 5 ]; do
    echo "Contador: $contador"
    ((contador++))
done
```

#### **Funções**

```bash
#!/bin/bash

# Definir função
saudacao() {
    echo "Olá, $1!"
}

# Chamar função
saudacao "Maria"
```

### Executar Comandos no Shell

#### **Modo Interativo**
```bash
bash
# Agora você está em um novo shell bash
exit
```

#### **Executar Script**
```bash
# Opção 1: bash nome_script.sh
bash meu_script.sh

# Opção 2: sh nome_script.sh
sh meu_script.sh

# Opção 3: ./nome_script.sh (requer permissão de execução)
chmod +x meu_script.sh
./meu_script.sh
```

#### **Permissões de Execução**
```bash
# Dar permissão de execução
chmod +x script.sh

# Ou com números
chmod 755 script.sh

# Verificar permissões
ls -l script.sh
```

### Verificar Qual Shell Você Está Usando

```bash
# Ver shell atual
echo $SHELL

# Ver lista de todos os shells disponíveis
cat /etc/shells

# Ver processo do shell
ps $$
```

### Trocar de Shell

```bash
# Trocar para bash
bash

# Trocar para zsh
zsh

# Trocar para sh
sh

# Para sair do novo shell
exit
```

## 💡 Dicas Práticas

1. **Sempre comece scripts com shebang:** `#!/bin/bash`
2. **Use aspas duplas para variáveis com espaços:** `"$VARIAVEL"`
3. **Teste seus scripts antes de usar em produção**
4. **Use `set -e` para parar o script se um comando falhar**
5. **Comente seu código para facilitar manutenção**
6. **Use funções para reutilizar código**
7. **Trate erros com `$?` ou `||`**

## 🔗 Referências

- Bash Manual: https://www.gnu.org/software/bash/manual/
- ShellCheck: https://www.shellcheck.net/ (valida scripts)
- explainshell: https://explainshell.com/ (explica comandos)
