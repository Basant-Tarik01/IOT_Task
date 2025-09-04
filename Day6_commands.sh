echo -e "/home/basant/iot_logger/logs/temperature.log {\n\
    maxsize 1M\n\
    rotate 5\n\
    compress\n\
    copytruncate\n\
}" | sudo tee /etc/logrotate.d/iot_logger
/home/basant/iot_logger/logs/temperature.log {
    maxsize 1M
    rotate 5
    compress
    copytruncate
}

sudo logrotate --force --verbose /etc/logrotate.d/iot_logger
ls -lh /home/basant/iot_logger/logs/

echo "*/5 * * * * /usr/bin/python3 /home/basant/iot_logger/temperature_logger.py" > mycron
crontab mycron
rm mycron
crontab -l

ls -lh /home/basant/iot_logger/logs/
tail -n 20 /home/basant/iot_logger/logs/temperature.log

today=$(date +%F)
archive_name="temperature_logs_$today.tar.gz"
tar -czvf /home/basant/iot_logger/data/$archive_name \
    /home/basant/iot_logger/logs/*.gz
tar: Removing leading `/' from member names
/home/basant/iot_logger/logs/temperature.log.1.gz

ls -lh /home/basant/iot_logger/data/

cp /home/basant/iot_logger/data/$archive_name /home/basant/server/
ls -lh /home/basant/server/


