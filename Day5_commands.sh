export SENSOR_TYPE="Temperature"
echo $SENSOR_TYPE

cat > ~/iot_logger/scripts/sensor_script.py
import time, random, os
while True:
    value = random.randint(20, 30)
    timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
    print(f"{timestamp} - {sensor}: {value}")
    time.sleep(5)

python3 ~/iot_logger/scripts/sensor_script.py >> ~/iot_logger/logs/temperature.log &

ps aux | grep sensor_script.py

ls -l /proc/2980/fd

grep "25" ~/iot_logger/logs/temperature.log > ~/iot_logger/logs/temp_filtered.log

cp ~/iot_logger/logs/* ~/iot_logger/data/

unset SENSOR_TYPE

(ls -l | grep .py; sleep 100) &
ls -l /proc/3021/fd

for i in 1 2 3 4 5
do   
   echo "Number $i"
done

echo "Enter first number:"
read a
echo "Enter second number:"
read b
echo "Enter operation (+ or -):"
read op
if [ "$op" = "+" ]
then   
   echo "Result = $((a + b))"
elif [ "$op" = "-" ]
then   
   echo "Result = $((a - b))"
else   
   echo "Unknown operation"
fi

