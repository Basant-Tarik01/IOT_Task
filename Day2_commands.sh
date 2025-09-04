cd ~/iot_logger
touch logs/temperature.log 
touch scripts/sensor_script.py

cp /etc/services data/ 

grep "ssh" data/services 
grep "http" data/services
grep "^t" data/services
grep "[0-9]" data/services

find ~ -name "*.txt"

ln logs/temperature.log temp_hardlink.log 
ln -s logs/temperature.log temp_symlink.log 

tree ~/iot_logger


