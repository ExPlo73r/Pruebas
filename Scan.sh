else
    nmaptest
    clear
    iptest
    while true; do
      echo -e "\n1) Escaneo rapido(pero más ruidoso que tu ex xD cuando te funó)"
      echo "2) Escaneo Normal x defecto"
      echo "3) Escaneo silencioso (Algo slowpoke)"
      echo "4) Escaneo de serviciosos y versiones"
      echo "5) WhatWeb"
      echo "6) Salir"
      echo -ne "$greenColour\n[?]$grayColour Seleccione una opcion: " && read opcion
      case $opcion in
       1)
       clear && echo "Escaneando..." && nmap -p- --open --min-rate 5000 -T5 -sS -Pn -n -v $ip | grep -E "^[0-9]+\/[a-z]+\s+open\s+[a-z]+"
       ;;
       2)
       clear && echo "Escaneando..." && nmap -p- --open $ip | grep -E "^[0-9]+\/[a-z]+\s+open\s+[a-z]+"
       ;;
       3)
       clear && echo "Escaneando..." && nmap -p- -T2 -sS -Pn -f $ip | grep -E "^[0-9]+\/[a-z]+\s+open\s+[a-z]+"
       ;;
       4)
       clear && echo "Escaneando..." && nmap -sV -sC $ip		
       ;;
       5)
       whatweb $ip
       ;;
       6)
       break
       ;;
       *)
        echo -e "\n$redColour[!]$grayColour Opcion no encontrada"
        ;;
      esac
    done
fi

finish() {
    echo -e "\n$redColour[!]$grayColour Cerrando el script..."
    exit 
}

trap finish SIGINT
