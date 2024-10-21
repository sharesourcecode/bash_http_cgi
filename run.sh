#!/bin/bash
echo "HTTP/1.1 200 OK"
echo "Content-type: text/html"
echo ""
echo "<html><body><h1>Resultado do Comando:</h1><pre>$(echo $SHELL)</pre></body></html>"
