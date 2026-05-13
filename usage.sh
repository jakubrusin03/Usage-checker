#!/bin/bash

dysk=$(df -h / | grep / | awk '{print $5}' | tr -d "%")
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print int(100 - $8)}')
ram=$(free -m | grep "Mem:" | awk '{print int($3/$2 * 100)}')

for i in {1..10}; do
  data=$(date)
  echo "STAN NA: $data" >> /var/log/usage.log
  echo "-------------" >> /var/log/usage.log
  if (( dysk >= 90 )); then
    echo "KRYTYCZNY: DYSK ZAPELNIONY W: $dysk%" >> var/log/usage.log
  elif (( dysk >= 80 )); then
   echo "OSTRZEZENIE: DYSK ZAPELNIONY W: $dysk%" >> /var/log/usage.log
  else
   echo "OK: DYSK ZAPELNIONY W: $dysk%" >> /var/log/usage.log
  fi
  echo "-------------" >> /var/log/usage.log

  if (( cpu >= 90 )); then
   echo "KRYTYCZNY: CPU UZYWANE W: $cpu%" >> /var/log/usage.log
  elif (( cpu >= 80 )); then
   echo "OSTRZERZENIE: CPU UZYWANE W: $cpu%" >> /var/log/usage.log
  else
   echo "OK: CPU UZYWANE W: $cpu%" >> /var/log/usage.log
  fi
  echo "-------------" >> var/log/usage.log
  if (( ram >= 90 )); then
   echo "KRYTYCZNY: RAM UZYWANE W: $ram%" >> /var/log/usage.log
  elif (( ram >= 80 )); then
   echo "OSTRZERZENIE: RAM UZYWANE W: $ram%" >> /var/log/usage.log
  else
   echo "OK: RAM UZYWANE W: $ram%" >> /var/log/usage.log
  fi
echo " " >> /var/log/usage.log
sleep 1800
done
