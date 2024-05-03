#!/bin/bash

# Check if the new value is already present in environment
if grep -q "$ locale" /etc/environment; then
  echo "The RU locale present in environment"
  sleep 3
else
  # Backup the original file
  echo "Backup environment..."
  sleep 1
  cp /etc/environment /etc/environment.bak
  
  # Add the new value to environment
  echo "Adding parameter in environment..."
  sleep 1
  sed -i '5 a\$ locale\nLANG=ru_RU.UTF-8\nLANGUAGE=ru_RU:ru:en_GB:en\nLC_CTYPE="ru_RU.UTF-8"\nLC_NUMERIC="ru_RU.UTF-8"\nLC_TIME="ru_RU.UTF-8"\nLC_COLLATE="ru_RU.UTF-8"\nLC_MONETARY="ru_RU.UTF-8"\nLC_MESSAGES="ru_RU.UTF-8"\nLC_PAPER="ru_RU.UTF-8"\nLC_NAME="ru_RU.UTF-8"\nLC_ADDRESS="ru_RU.UTF-8"\nLC_TELEPHONE="ru_RU.UTF-8"\nLC_MEASUREMENT="ru_RU.UTF-8"\nLC_IDENTIFICATION="ru_RU.UTF-8"\nLC_ALL=\n' /etc/environment
  
  # Update the environment configuration file
  #echo "Update environment..."
  #sleep 1
  #update-environment
  
  # Reboot after a countdown
  for i in {3..1}; do
    echo "Reboot in $i seconds..."
    sleep 1
  done

echo "Reboot!"
shutdown now -r
fi