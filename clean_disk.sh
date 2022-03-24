#!/bin/bash

#Para que se ejecute diariamente recuerda agregarlo a tu crontab:
#echo "30 23   * * 0   root    sudo sh /root/clean_disk.sh" >> /etc/crontab
#Te recomiendo manter tu script sobre esa ruta sobre ~ o cambiarla a una de tu preferencia.

#Script para limpiar espacio en disco>

#Limpieza de kernel:
sudo apt-get -y autoremove
#Limpiar paquetes obsoletos:
sudo apt-get -y autoclean
#Limpieza de caché
sudo apt-get -y clean

#limpieza de logs:
rm /var/log/turn_*.log
rm /var/log/apport*.log
rm -r /var/log/alternatives.log.*.gz
rm /var/log/apt*
rm /var/log/auth.log*
rm /var/log/btmp*
rm /var/log/chrony*
rm /var/log/cloud-init-output*.log
rm /var/log/cloud-init*.log
rm /var/log/dist-upgrade*
rm /var/log/dpkg.log*
rm /var/log/fail2ban.log*
rm /var/log/fontconfig.log*
rm /var/log/kern.log*
rm /var/log/landscape
rm /var/log/lastlog*
rm /var/log/mail.err*
rm /var/log/mail.log*
rm /var/log/syslog
rm /var/log/syslog.*.gz
rm /var/log/ufw.log*
rm /var/log/wtmp.l

#logs y paquetes especificos de servidores con uContact
#logs
rm /var/log/IntegraServer.log.*
rm /var/log/UpdateIntegra.log.*
rm /var/log/asterisk
rm /var/log/asterisk/full.*
rm /var/log/asterisk/messages.*
#Cdr originario de asterisk pero versiones antiguas:
rm /var/log/asterisk/cdr-custom/Master.csv.*
#Paquetes de instalacion antiguos de uContact:
rm /root/6.*.zip
#---------------------------------------------
#Logs especificos de servidor que tenga cliente Telegraf
rm /var/log/telegraf*

#Limpieza de servidores con INFLUXDB instalados (Grafana por ejemplo).
TODAYASYYYYMMDD=$(date +'%Y-%m-%d')
influx -database 'telegraf' -execute "DELETE WHERE time < '$TODAYASYYYYMMDD'"
#En caso de querer limpiar un registro particular
#Debemos ejecutar el siguiente comando reemplazanado HOSTNAME por el nombre que aparece por instancia.
#influx -database 'telegraf' -execute "DROP SERIES WHERE 'host' = 'HOSTNAME'"