sudo groupadd IOT_Team
sudo usermod -aG iot_team $USER

sudo adduser developer
sudo usermod -aG IOT_Team developer

sudo chown -R developer:I0T_Team iot_logger

sudo chmod ug+rwx iot_logger/logs
sudo chmod o-rwx iot_logger/logs
sudo chmod -R 770 iot_logger/logs

su - developer
cd /home/basant/iot_logger/logs
exit
sudo deluser developer
