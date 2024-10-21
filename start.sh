#!/bin/sh
while true; do
    {
        # Escuta na porta 8080 e processa a requisição
        { echo -ne "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"; cat index.html; } | nc -l -p 8080 -q 1;

        # Verifica se a requisição é para "/run"
        { echo -ne "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"; ./run.sh; } | nc -l -p 8080 -q 1;
    }
done
