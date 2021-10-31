#!/bin/bash
x="teste"
menu ()
{
while true $x != "teste"
do
clear
echo "================================================"
echo "Mini "
echo "Criado por: Joao Victor Fedrice & Leonardo Melo"
echo ""
echo "1)Executar varredura NMAP"
echo""
echo "2)Pesquisa via Google"
echo ""
echo "3)Descobrir IPs associados via Site"
echo ""
echo "4)Executar WhoIS contra um domínio"
echo""
echo "5)Verificar quais hosts estão ativos através de um range de ip"
echo""
echo "6)Informações básicas de um site"
echo""
echo "7)Executar uma wordlist contra um servidor/site/domínio para descobrir diretórios existentes"
echo""
echo "8)Sair"
echo ""
echo "================================================"

echo "Digite a opção desejada:"
read x
echo "Opção informada ($x)"
echo "================================================"

case "$x" in


    1)
      echo "Informe o IP a ser varrido"
      read x
      nmap -Pn $x
      sleep 200

echo "================================================"
;;
    2)
      echo "Digite sua pesquisa com + ao invés de espaço"
      echo "Por exemplo: melhor+pizza+do+mundo"
      read x
      lynx "https://www.google.com/search?q=$x&num=50"    
      sleep 5
echo "================================================"
;;
   3)
      echo "Informe o IP ou Site"
      read x
      dnsenum $x
      sleep 200
echo "================================================"
;;
    4)
       echo "Informe o Site ou IP"
       read x
       whois $x
       sleep 200
echo "================================================"
;;
     5)
       echo "Informe o IP que você quer o verificar com o range de 1-254"
       echo "Exemplo: '1.1.1' (sem o último número de ip)"
       read x
       for i in {1..254} 
       do (ping -c 1 $x.$i > /dev/null);
       if [ $? -eq 0 ]; then
        echo "$x.$i is up";
       else
        echo "$x.$i is down";
       fi
       done
       sleep 200
echo "================================================"
;;
    6)
    echo "Informe o site ou IP"
    read x
    whatweb $x
    sleep 200

echo "================================================"
 ;;
       7)
        echo "Informe o endereço que você quer utilizar"
	read x
	gobuster dir --url $x -w /usr/share/dirb/wordlists/common.txt  -x .php,.txt,.sql,.bkp
	sleep 200 

echo "================================================"
 ;;
       8)
         echo "saindo..."
         sleep 5
         clear;
         exit;
echo "================================================"
;;

*)
        echo "Opção inválida!"
esac
done

}
menu
