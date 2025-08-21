#!/bin/bash

while true; do

	if [ "$1" == "" ]
	then
		echo -e "\e[35m======================================\e[0m"
		echo -e "\e[31m ARGUMENTO INVÁLIDO \e[0m"
		echo -e "\e[35m======================================\e[0m"
		echo -e "\e[32mExemplo de URL:\e[0m exemplo.com"
		echo -e "\e[35m======================================\e[0m"

	else
		echo -e "\e[35m=====================================================================\e[0m"
		echo ""
		echo -e " \e[32m[+] Resolvendo URLs em: \e[36m$1\e[0m "
		echo ""
		echo -e "\e[35m=====================================================================\e[0m"
		echo ""

		url=$1
		wget -q --no-check-certificate -O index.html "$url" 2>/dev/null
		grep -oP '(?<=href=["'\'']).*?(?=["'\''])' index.html | cut -d "/" -f 3 | grep -E '^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' | sort -u > lista
		rm -rf index.html
		echo -e "\e[31m[+] Concluído: Salvando os resultados em: $1.ip.txt\e[0m"
		echo -e "\e[35m=====================================================================\e[0m"
		printf "\t%-8s\t%-15s\t%-20s\n" "Line" "IP" "ADDRESS"
		echo -e "\e[35m=====================================================================\e[0m"

		resultadoFinal=""
		count=1

		if [ ! -s lista ]; then
		 echo -e "\e[32mNenhum domínio válido encontrado em $url\e[0m"
		else
		 for url2 in $(cat lista); do
			ip=$(host $url2 | grep "has address" | awk '{print $4}' | paste -sd "," -)
			if [ -n "$ip" ]; then
				resultado=$(printf "\t%2d\t%-15s\t%-20s\n" "$count" "$ip" "$url2")
				count=$((count + 1))
				echo "$resultado"
				resultadoFinal+="$resultado"
			fi
		 done
		fi

		echo -e "\e[35m=====================================================================\e[0m"
		echo -e "$resultadoFinal" > teste.txt
		awk '{
    			for(i=1;i<=NF;i+=3){
        		print $i, $(i+1), $(i+2)
    			}
              	}' teste.txt > $1.ip.txt
		rm -rf lista
		rm -rf teste.txt

		echo -e "\e[32m- Nova pesquisa? (y/n):\e[0m "
		read resposta
		if [[ "$resposta" != "y" && "$resposta" != "Y" ]]; then
			echo -e "\e[31mEncerrando...\e[0m"
			break
	        fi
	fi

    read -p "Digite a nova URL: " novaURL
    set -- "$novaURL"

done
