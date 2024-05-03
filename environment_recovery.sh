#!/bin/bash

# Check if the RU locale is present in environment
if grep -q "$ locale" /etc/environment; then
  # Delete old Environment
  echo "Delete old Environment..."  
  sleep 1
  rm /etc/environment
  
  #Environment recovery from bakup
  echo "Environment recovery from bakup..."  
  sleep 1  
  mv /etc/environment.bak /etc/environment

  # Reboot after recovery
  for i in {3..1}; do
    echo "Reboot in $i seconds..."
    sleep 1
  done
echo "Reboot!"
shutdown now -r  

else
  # RU locale has already been deleted
  echo "RU locale has already been deleted..."
  sleep 3
fi