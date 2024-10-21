# bash_http_cgi

Este repositório contém scripts Bash que simulam um servidor HTTP básico com suporte a execução de comandos via CGI. O servidor escuta na porta 8080 e permite a execução de um comando específico através de uma interface web simples.

## Estrutura do Repositório

A pasta `bash_http_cgi` contém os seguintes arquivos:

- **start.sh**: Script principal que inicia o servidor HTTP.
- **run.sh**: Script CGI que executa um comando e retorna o resultado.
- **index.html**: Página HTML inicial que permite ao usuário executar o comando.

## Descrição dos Arquivos

### start.sh

Este script inicia um servidor HTTP na porta 8080. Ele escuta requisições e processa duas rotas:

1. **/ (raiz)**: Retorna o conteúdo de `index.html`.
2. **/run**: Executa o script `run.sh` e retorna o resultado.

```bash
#!/bin/sh
while true; do
    {
        # Escuta na porta 8080 e processa a requisição
        { echo -ne "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"; cat index.html; } | nc -l -p 8080 -q 1;

        # Verifica se a requisição é para "/run"
        { echo -ne "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"; ./run.sh; } | nc -l -p 8080 -q 1;
    }
done
```

## run.sh

Este script é chamado quando a rota `/run` é acessada. Ele executa um comando e retorna o resultado em formato HTML.

```bash
#!/bin/bash
echo "HTTP/1.1 200 OK"
echo "Content-type: text/html"
echo ""
echo "<html><body><h1>Resultado do Comando:</h1><pre>$(echo $SHELL)</pre></body></html>"
```

##index.html

Esta é a página inicial que apresenta um link para executar o comando.

```bash
<html>
<body>
<h1>Executar Comando</h1>
<a href="/run">Clique aqui para executar o comando</a>
</body>
</html>
```

##Como Usar

Clone este repositório:

```bash
git clone https://github.com/seu_usuario/bash_http_cgi.git
cd bash_http_cgi
```

Dê permissão de execução ao script start.sh:

```bash
chmod +x start.sh
```

Inicie o servidor:

```bash
./start.sh
```

Acesse http://localhost:8080 em seu navegador para ver a página inicial. Clique no link para executar o comando e visualizar o resultado.

##Observações

Certifique-se de ter o netcat (nc) instalado, pois ele é utilizado para escutar as requisições HTTP.
Este servidor é apenas uma simulação e não deve ser utilizado em ambientes de produção, pois não possui medidas de segurança adequadas.
