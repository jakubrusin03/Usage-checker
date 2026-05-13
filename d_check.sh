#!/bin/bash

dysk=$(df -h / | grep / | awk '{print $5}' | tr -d "%")
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print int(100 - $8)}')
ram=$(free -h | grep "Mem:" | awk '{print $7}' | tr -d "Gi")

for i in {1..10}; do
  data=$(date)
  echo "STAN NA: $data" >> /home/labuser/skrypt_dysk/test.log
  echo "-------------" >> /home/labuser/skrypt_dysk/test.log
  if (( dysk >= 90 )); then
    echo "KRYTYCZNY: DYSK ZAPELNIONY W: $dysk%" >> /home/labuser/skrypt_dysk/test.log #/var/log/d_check.log
  elif (( dysk >= 80 )); then
   echo "OSTRZEZENIE: DYSK ZAPELNIONY W: $dysk%" >> /home/labuser/skrypt_dysk/test.log #/var/log/d_check.log
  else
   echo "OK: DYSK ZAPELNIONY W: $dysk%" >> /home/labuser/skrypt_dysk/test.log #/var/log/d_check.log
  fi
  echo "-------------" >> /home/labuser/skrypt_dysk/test.log

  if (( cpu >= 90 )); then
   echo "KRYTYCZNY: CPU UZYWANE W: $cpu%" >> /home/labuser/skrypt_dysk/test.log
  elif (( cpu >= 80 )); then
   echo "OSTRZERZENIE: CPU UZYWANE W: $cpu%" >> /home/labuser/skrypt_dysk/test.log
  else
   echo "OK: CPU UZYWANE W: $cpu%" >> /home/labuser/skrypt_dysk/test.log
  fi
sleep 1800
done
