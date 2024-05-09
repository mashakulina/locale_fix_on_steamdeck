#!/bin/bash

# Check if the new value is already present in environment
if grep -q "$ locale" /etc/environment; then
    echo "The locale present in environment"
    sleep 3
else
  # Backup the original file
  echo "Backup environment..."
  sleep 1
  cp /etc/environment /etc/environment.bak

  echo "Adding parameter in environment..."
  PS3="Select an option to switch layouts: "
select opt in Russian German French Spanish Spanish_Mexico Italian Portuguese Portuguese_Brazil Chinese Japanese; do
  case $opt in

     Russian)
      echo "Your chose is Russian"
      sed -i '5 a\$ locale\nLANG=ru_RU.UTF-8\nLANGUAGE=ru_RU:ru:en_GB:en\nLC_CTYPE="ru_RU.UTF-8"\nLC_NUMERIC="ru_RU.UTF-8"\nLC_TIME="ru_RU.UTF-8"\nLC_COLLATE="ru_RU.UTF-8"\nLC_MONETARY="ru_RU.UTF-8"\nLC_MESSAGES="ru_RU.UTF-8"\nLC_PAPER="ru_RU.UTF-8"\nLC_NAME="ru_RU.UTF-8"\nLC_ADDRESS="ru_RU.UTF-8"\nLC_TELEPHONE="ru_RU.UTF-8"\nLC_MEASUREMENT="ru_RU.UTF-8"\nLC_IDENTIFICATION="ru_RU.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    German)
      echo "Your chose is German"
      sed -i '5 a\$ locale\nLANG=de_DE.UTF-8\nLANGUAGE=de_DE:de:en_GB:en\nLC_CTYPE="de_DE.UTF-8"\nLC_NUMERIC="de_DE.UTF-8"\nLC_TIME="de_DE.UTF-8"\nLC_COLLATE="de_DE.UTF-8"\nLC_MONETARY="de_DE.UTF-8"\nLC_MESSAGES="de_DE.UTF-8"\nLC_PAPER="de_DE.UTF-8"\nLC_NAME="de_DE.UTF-8"\nLC_ADDRESS="de_DE.UTF-8"\nLC_TELEPHONE="de_DE.UTF-8"\nLC_MEASUREMENT="de_DE.UTF-8"\nLC_IDENTIFICATION="de_DE.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    French)
      echo "Your chose is French"
      sed -i '5 a\$ locale\nLANG=fr_FR.UTF-8\nLANGUAGE=fr_FR:fr:en_GB:en\nLC_CTYPE="fr_FR.UTF-8"\nLC_NUMERIC="fr_FR.UTF-8"\nLC_TIME="fr_FR.UTF-8"\nLC_COLLATE="fr_FR.UTF-8"\nLC_MONETARY="fr_FR.UTF-8"\nLC_MESSAGES="fr_FR.UTF-8"\nLC_PAPER="fr_FR.UTF-8"\nLC_NAME="fr_FR.UTF-8"\nLC_ADDRESS="fr_FR.UTF-8"\nLC_TELEPHONE="fr_FR.UTF-8"\nLC_MEASUREMENT="fr_FR.UTF-8"\nLC_IDENTIFICATION="fr_FR.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    Spanish)
      echo "Your chose is Spanish"
      sed -i '5 a\$ locale\nLANG=es_ES.UTF-8\nLANGUAGE=es_ES:es:en_GB:en\nLC_CTYPE="es_ES.UTF-8"\nLC_NUMERIC="es_ES.UTF-8"\nLC_TIME="es_ES.UTF-8"\nLC_COLLATE="es_ES.UTF-8"\nLC_MONETARY="es_ES.UTF-8"\nLC_MESSAGES="es_ES.UTF-8"\nLC_PAPER="es_ES.UTF-8"\nLC_NAME="es_ES.UTF-8"\nLC_ADDRESS="es_ES.UTF-8"\nLC_TELEPHONE="es_ES.UTF-8"\nLC_MEASUREMENT="es_ES.UTF-8"\nLC_IDENTIFICATION="es_ES.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    Spanish_Mexico)
      echo "Your chose is Spanish_Mexico"
      sed -i '5 a\$ locale\nLANG=es_MX.UTF-8\nLANGUAGE=es_MX:es:en_GB:en\nLC_CTYPE="es_MX.UTF-8"\nLC_NUMERIC="es_MX.UTF-8"\nLC_TIME="es_MX.UTF-8"\nLC_COLLATE="es_MX.UTF-8"\nLC_MONETARY="es_MX.UTF-8"\nLC_MESSAGES="es_MX.UTF-8"\nLC_PAPER="es_MX.UTF-8"\nLC_NAME="es_MX.UTF-8"\nLC_ADDRESS="es_MX.UTF-8"\nLC_TELEPHONE="es_MX.UTF-8"\nLC_MEASUREMENT="es_MX.UTF-8"\nLC_IDENTIFICATION="es_MX.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    Italian)
      echo "Your chose is Italian"
      sed -i '5 a\$ locale\nLANG=it_IT.UTF-8\nLANGUAGE=it_IT:it:en_GB:en\nLC_CTYPE="it_IT.UTF-8"\nLC_NUMERIC="it_IT.UTF-8"\nLC_TIME="it_IT.UTF-8"\nLC_COLLATE="it_IT.UTF-8"\nLC_MONETARY="it_IT.UTF-8"\nLC_MESSAGES="it_IT.UTF-8"\nLC_PAPER="it_IT.UTF-8"\nLC_NAME="it_IT.UTF-8"\nLC_ADDRESS="it_IT.UTF-8"\nLC_TELEPHONE="it_IT.UTF-8"\nLC_MEASUREMENT="it_IT.UTF-8"\nLC_IDENTIFICATION="it_IT.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    Portuguese)
      echo "Your chose is Portuguese"
      sed -i '5 a\$ locale\nLANG=pt_PT.UTF-8\nLANGUAGE=pt_PT:pt:en_GB:en\nLC_CTYPE="pr_PT.UTF-8"\nLC_NUMERIC="pr_PT.UTF-8"\nLC_TIME="pr_PT.UTF-8"\nLC_COLLATE="pr_PT.UTF-8"\nLC_MONETARY="pr_PT.UTF-8"\nLC_MESSAGES="pr_PT.UTF-8"\nLC_PAPER="pr_PT.UTF-8"\nLC_NAME="pr_PT.UTF-8"\nLC_ADDRESS="pr_PT.UTF-8"\nLC_TELEPHONE="pr_PT.UTF-8"\nLC_MEASUREMENT="pr_PT.UTF-8"\nLC_IDENTIFICATION="pr_PT.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    Portuguese_Brazil)
      echo "Your chose is Portuguese_Brazil"
      sed -i '5 a\$ locale\nLANG=pt_BR.UTF-8\nLANGUAGE=pt_BR:pt:en_GB:en\nLC_CTYPE="pr_BR.UTF-8"\nLC_NUMERIC="pr_BR.UTF-8"\nLC_TIME="pr_BR.UTF-8"\nLC_COLLATE="pr_BR.UTF-8"\nLC_MONETARY="pr_BR.UTF-8"\nLC_MESSAGES="pr_BR.UTF-8"\nLC_PAPER="pr_BR.UTF-8"\nLC_NAME="pr_BR.UTF-8"\nLC_ADDRESS="pr_BR.UTF-8"\nLC_TELEPHONE="pr_BR.UTF-8"\nLC_MEASUREMENT="pr_BR.UTF-8"\nLC_IDENTIFICATION="pr_BR.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    Chinese)
      echo "Your chose is Chinese"
      sed -i '5 a\$ locale\nLANG=zh_CN.UTF-8\nLANGUAGE=zh_CN:zh:en_GB:en\nLC_CTYPE="zh_CN.UTF-8"\nLC_NUMERIC="zh_CN.UTF-8"\nLC_TIME="zh_CN.UTF-8"\nLC_COLLATE="zh_CN.UTF-8"\nLC_MONETARY="zh_CN.UTF-8"\nLC_MESSAGES="zh_CN.UTF-8"\nLC_PAPER="zh_CN.UTF-8"\nLC_NAME="zh_CN.UTF-8"\nLC_ADDRESS="zh_CN.UTF-8"\nLC_TELEPHONE="zh_CN.UTF-8"\nLC_MEASUREMENT="zh_CN.UTF-8"\nLC_IDENTIFICATION="zh_CN.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    Japanese)
      echo "Your chose is Japanese"
      sed -i '5 a\$ locale\nLANG=ja_JP.UTF-8\nLANGUAGE=ja_JP:ja:en_GB:en\nLC_CTYPE="ja_JP.UTF-8"\nLC_NUMERIC="ja_JP.UTF-8"\nLC_TIME="ja_JP.UTF-8"\nLC_COLLATE="ja_JP.UTF-8"\nLC_MONETARY="ja_JP.UTF-8"\nLC_MESSAGES="ja_JP.UTF-8"\nLC_PAPER="ja_JP.UTF-8"\nLC_NAME="ja_JP.UTF-8"\nLC_ADDRESS="ja_JP.UTF-8"\nLC_TELEPHONE="ja_JP.UTF-8"\nLC_MEASUREMENT="ja_JP.UTF-8"\nLC_IDENTIFICATION="ja_JP.UTF-8"\nLC_ALL=\n' /etc/environment
      break
      ;;
    *)
      ;;
  esac
done

  # Reboot after a countdown
  for i in {3..1}; do
    echo "Reboot in $i seconds..."
    sleep 1
  done

echo "Reboot!"
shutdown now -r
fi
