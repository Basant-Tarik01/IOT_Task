ls -lh /home/basant/iot_logger/logs/

echo -e "/home/basant/iot_logger/logs/temperature.log {\n\
    size 1M\n\
    rotate 5\n\
    compress\n\
    copytruncate\n\
    su basant basant\n\
}" | sudo tee /etc/logrotate.d/iot_logger


base64 /dev/urandom | head -c 1500000 >> /home/basant/iot_logger/logs/temperature.log
ls -lh /home/basant/iot_logger/logs/temperature.log

sudo logrotate -v /etc/logrotate.d/iot_logger
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


