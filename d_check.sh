#!/bin/bash

dysk=$(df -h / | grep / | awk '{print $5}' | tr -d "%")

for i in {1..10}; do 
  data=$(date)
  if (( dysk >= 90 )); then
    echo "KRYTYCZNY: DYSK ZAPELNIONY W: $dysk%  DATA: $data" >> /var/log/d_check.log
  elif (( dysk >= 80 )); then
   echo "OSTRZEZENIE: DYSK ZAPELNIONY W: $dysk%  DATA: $data" >> /var/log/d_check.log
  else
   echo "OK: DYSK ZAPELNIONY W: $dysk%  DATA: $data" >> /var/log/d_check.log
fi
sleep 1800
done
