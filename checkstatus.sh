#!/bin/sh
#
# Check Sip peers
#
hora=$(date  "+%b %d %R" -d "1 min ago")


mensaje0="UNREACHABLE"
mensaje1="UNKNOWN"
destinatario="correo@mail.com"


correo=$(echo "WARNING" )
asunto=$(echo "Extensiones caídas")

rm -f /var/www/html/statusext/SipPeersC1

grep -E "$hora" /var/log/asterisk/messages | grep $mensaje0 >>/var/www/html/statusext/SipPeersC1

if [ -s "/var/www/html/statusext/SipPeersC1" ]; then
        echo $correo | mail -s "$asunto" $destinatario </var/www/html/statusext/SipPeersC1
fi
