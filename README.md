# Cleaning-My-Ubuntu-Disk-As-Well
Script who can helps to clean your ubuntu disk as well in very simple execute time.

### Way to set up the crontab job
```sh
#Todos los domingos a las 23:30 se ejecutará la limpieza
#      m h dom mon dow user  command
echo "30 23   * * 0   root    sudo sh /root/clean_disk.sh" >> /etc/crontab
```

If you need help with something, you can email me to gaston.nicolas.morales.olivera@gmail.com
## Enjoy!
