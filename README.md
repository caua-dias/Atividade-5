# 🛠️ Atividade de Sistemas Operacionais – Código em Assembly (32 bits)

Este repositório contém um exemplo de código em Assembly x86 (sintaxe Intel), desenvolvido como parte da disciplina **Sistemas Operacionais**, com foco em manipulação de memória e estruturas de dados básicas (como matrizes).

Autor: **Cauã Souza Dias**  
Curso: **BCC - Ciências da Computação**

---

## 📌 Pré-requisitos

Antes de compilar e executar o código, é necessário configurar seu ambiente para suportar compilação de código Assembly de 32 bits no Ubuntu.

Execute os comandos abaixo:

```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install gcc-multilib libc6-dev-i386 libgcc-13-dev:i386
```
--- 

## ⚙️ Compilação

### ✔️ Exercício padrão:

```bash
gcc -m32 nome_do_arquivo.s -o nome_do_arquivo
⚠️ Avisos (warnings) podem aparecer, mas o binário será gerado corretamente se não houver erros.
```

### ✔️ Exercício 2 (com manipulação de endereços fixos)

Use a flag `-no-pie` para garantir que o binário seja gerado com **endereços absolutos fixos** — essencial para o funcionamento correto com acesso direto a variáveis na seção `.data`:

```bash
gcc -m32 -no-pie nome_do_arquivo.s -o nome_do_arquivo
```

### ▶️ Execução

Após a compilação, execute o programa com:

```bash
./nome_do_arquivo
```

---

### 🧠 Nota sobre `-no-pie`

A flag `-no-pie` (*No Position Independent Executable*) é necessária quando usamos **endereçamento absoluto** no Assembly.  
Sem essa flag, o sistema pode carregar o programa em posições aleatórias de memória, o que quebra o acesso correto às variáveis na seção `.data`, causando comportamentos incorretos, como dados zerados ou trocados.
