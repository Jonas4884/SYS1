#!/bin/bash

#Mettre en backup les donnees d'access_log
cp --backup access.log

#verifier chaque log qui utilise des cron
#Recuperer tous les adresses clients renvoyant 404(qui on rencontrer des srawlers
awk '($9 ~ /404/)' /var/log/httpd/access_log | awk '{print $9,$7}' | sort | sed -n '/404$/p'|\ awk '{print $1} |tail -f  ;
#Bloquer les crawlers
do iptables -A INPUT -s $1 -j DROP  
crontab -r  $3 
done
