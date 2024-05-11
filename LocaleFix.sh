#!/bin/bash

# if a password was set, this will run when the program closes
temp_pass_cleanup() {
  echo $PASS | sudo -S -k passwd -d deck
}

# removes unhelpful GTK warnings
zen_nospam() {
  zenity 2> >(grep -v 'Gtk' >&2) "$@"
}

# if the script is not root yet, get the password and rerun as root
if (( $EUID != 0 )); then
    PASS_STATUS=$(passwd -S deck 2> /dev/null)

    # get password
    while [ "$PASSWORD" != "true" ]; do
        PASS=$(zen_nospam --title="Adding a locale" --width=300 --height=100 --entry --hide-text --text="Enter your sudo/admin password")
    if ( echo "$PASS" | sudo -S -k true ); then
        PASSWORD="true"
    else
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Incorrect Password"
    fi
  done
  echo "$PASS" | sudo -S -k bash "$0" "$@" # rerun script as root
  exit 1
fi

# if locale is already present in environment, then add 'recovery' option
if grep -q "$ locale" /etc/environment ; then
    OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=200 --list --radiolist --text "The locale is already added\nSelect Option:" --hide-header --column "Buttons" --column "Choice"\
    TRUE "Recovery system file" \
    )
else
    OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=350 --list --radiolist --text "Select language to install:" --hide-header --column "Buttons" --column "Choice"\
    TRUE "Russian" \
    FALSE "German" \
    FALSE "French" \
    FALSE "Spanish" \
    FALSE "Spanish (Mexico)" \
    FALSE "Italian" \
    FALSE "Portuguese" \
    FALSE "Portuguese (Brazil)" \
    FALSE "Chinese" \
    FALSE "Japanese"
    )
fi

# Recovery system file if recovery option was selected
if [ "$OPTION" == "Recovery system file" ] ; then
    (
    echo "Delete old Environment...";
    sudo rm /etc/environment
    echo "Environment recovery from bakup...";
    sudo mv /etc/environment.bak /etc/environment

    # Reboot/Later
    OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
    TRUE "Reboot now" \
    FALSE "Reboot later")

    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "Russian" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=ru_RU.UTF-8\nLANGUAGE=ru_RU:ru:en_GB:en\nLC_CTYPE="ru_RU.UTF-8"\nLC_NUMERIC="ru_RU.UTF-8"\nLC_TIME="ru_RU.UTF-8"\nLC_COLLATE="ru_RU.UTF-8"\nLC_MONETARY="ru_RU.UTF-8"\nLC_MESSAGES="ru_RU.UTF-8"\nLC_PAPER="ru_RU.UTF-8"\nLC_NAME="ru_RU.UTF-8"\nLC_ADDRESS="ru_RU.UTF-8"\nLC_TELEPHONE="ru_RU.UTF-8"\nLC_MEASUREMENT="ru_RU.UTF-8"\nLC_IDENTIFICATION="ru_RU.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "German" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=de_DE.UTF-8\nLANGUAGE=de_DE:de:en_GB:en\nLC_CTYPE="de_DE.UTF-8"\nLC_NUMERIC="de_DE.UTF-8"\nLC_TIME="de_DE.UTF-8"\nLC_COLLATE="de_DE.UTF-8"\nLC_MONETARY="de_DE.UTF-8"\nLC_MESSAGES="de_DE.UTF-8"\nLC_PAPER="de_DE.UTF-8"\nLC_NAME="de_DE.UTF-8"\nLC_ADDRESS="de_DE.UTF-8"\nLC_TELEPHONE="de_DE.UTF-8"\nLC_MEASUREMENT="de_DE.UTF-8"\nLC_IDENTIFICATION="de_DE.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "French" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=fr_FR.UTF-8\nLANGUAGE=fr_FR:fr:en_GB:en\nLC_CTYPE="fr_FR.UTF-8"\nLC_NUMERIC="fr_FR.UTF-8"\nLC_TIME="fr_FR.UTF-8"\nLC_COLLATE="fr_FR.UTF-8"\nLC_MONETARY="fr_FR.UTF-8"\nLC_MESSAGES="fr_FR.UTF-8"\nLC_PAPER="fr_FR.UTF-8"\nLC_NAME="fr_FR.UTF-8"\nLC_ADDRESS="fr_FR.UTF-8"\nLC_TELEPHONE="fr_FR.UTF-8"\nLC_MEASUREMENT="fr_FR.UTF-8"\nLC_IDENTIFICATION="fr_FR.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "Spanish" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=es_ES.UTF-8\nLANGUAGE=es_ES:es:en_GB:en\nLC_CTYPE="es_ES.UTF-8"\nLC_NUMERIC="es_ES.UTF-8"\nLC_TIME="es_ES.UTF-8"\nLC_COLLATE="es_ES.UTF-8"\nLC_MONETARY="es_ES.UTF-8"\nLC_MESSAGES="es_ES.UTF-8"\nLC_PAPER="es_ES.UTF-8"\nLC_NAME="es_ES.UTF-8"\nLC_ADDRESS="es_ES.UTF-8"\nLC_TELEPHONE="es_ES.UTF-8"\nLC_MEASUREMENT="es_ES.UTF-8"\nLC_IDENTIFICATION="es_ES.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "Spanish (Mexico)" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=es_MX.UTF-8\nLANGUAGE=es_MX:es:en_GB:en\nLC_CTYPE="es_MX.UTF-8"\nLC_NUMERIC="es_MX.UTF-8"\nLC_TIME="es_MX.UTF-8"\nLC_COLLATE="es_MX.UTF-8"\nLC_MONETARY="es_MX.UTF-8"\nLC_MESSAGES="es_MX.UTF-8"\nLC_PAPER="es_MX.UTF-8"\nLC_NAME="es_MX.UTF-8"\nLC_ADDRESS="es_MX.UTF-8"\nLC_TELEPHONE="es_MX.UTF-8"\nLC_MEASUREMENT="es_MX.UTF-8"\nLC_IDENTIFICATION="es_MX.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "Italian" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=it_IT.UTF-8\nLANGUAGE=it_IT:it:en_GB:en\nLC_CTYPE="it_IT.UTF-8"\nLC_NUMERIC="it_IT.UTF-8"\nLC_TIME="it_IT.UTF-8"\nLC_COLLATE="it_IT.UTF-8"\nLC_MONETARY="it_IT.UTF-8"\nLC_MESSAGES="it_IT.UTF-8"\nLC_PAPER="it_IT.UTF-8"\nLC_NAME="it_IT.UTF-8"\nLC_ADDRESS="it_IT.UTF-8"\nLC_TELEPHONE="it_IT.UTF-8"\nLC_MEASUREMENT="it_IT.UTF-8"\nLC_IDENTIFICATION="it_IT.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "Portuguese" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=pt_PT.UTF-8\nLANGUAGE=pt_PT:pt:en_GB:en\nLC_CTYPE="pr_PT.UTF-8"\nLC_NUMERIC="pr_PT.UTF-8"\nLC_TIME="pr_PT.UTF-8"\nLC_COLLATE="pr_PT.UTF-8"\nLC_MONETARY="pr_PT.UTF-8"\nLC_MESSAGES="pr_PT.UTF-8"\nLC_PAPER="pr_PT.UTF-8"\nLC_NAME="pr_PT.UTF-8"\nLC_ADDRESS="pr_PT.UTF-8"\nLC_TELEPHONE="pr_PT.UTF-8"\nLC_MEASUREMENT="pr_PT.UTF-8"\nLC_IDENTIFICATION="pr_PT.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "Portuguese (Brazil)" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=pt_BR.UTF-8\nLANGUAGE=pt_BR:pt:en_GB:en\nLC_CTYPE="pr_BR.UTF-8"\nLC_NUMERIC="pr_BR.UTF-8"\nLC_TIME="pr_BR.UTF-8"\nLC_COLLATE="pr_BR.UTF-8"\nLC_MONETARY="pr_BR.UTF-8"\nLC_MESSAGES="pr_BR.UTF-8"\nLC_PAPER="pr_BR.UTF-8"\nLC_NAME="pr_BR.UTF-8"\nLC_ADDRESS="pr_BR.UTF-8"\nLC_TELEPHONE="pr_BR.UTF-8"\nLC_MEASUREMENT="pr_BR.UTF-8"\nLC_IDENTIFICATION="pr_BR.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "Chinese" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=zh_CN.UTF-8\nLANGUAGE=zh_CN:zh:en_GB:en\nLC_CTYPE="zh_CN.UTF-8"\nLC_NUMERIC="zh_CN.UTF-8"\nLC_TIME="zh_CN.UTF-8"\nLC_COLLATE="zh_CN.UTF-8"\nLC_MONETARY="zh_CN.UTF-8"\nLC_MESSAGES="zh_CN.UTF-8"\nLC_PAPER="zh_CN.UTF-8"\nLC_NAME="zh_CN.UTF-8"\nLC_ADDRESS="zh_CN.UTF-8"\nLC_TELEPHONE="zh_CN.UTF-8"\nLC_MEASUREMENT="zh_CN.UTF-8"\nLC_IDENTIFICATION="zh_CN.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi

if [[ "$OPTION" == "Japanese" ]]; then
  (
  echo "Backup environment..."
  sudo cp /etc/environment /etc/environment.bak
  echo "Adding parameter in environment..."
  sudo sed -i '5 a\$ locale\nLANG=ja_JP.UTF-8\nLANGUAGE=ja_JP:ja:en_GB:en\nLC_CTYPE="ja_JP.UTF-8"\nLC_NUMERIC="ja_JP.UTF-8"\nLC_TIME="ja_JP.UTF-8"\nLC_COLLATE="ja_JP.UTF-8"\nLC_MONETARY="ja_JP.UTF-8"\nLC_MESSAGES="ja_JP.UTF-8"\nLC_PAPER="ja_JP.UTF-8"\nLC_NAME="ja_JP.UTF-8"\nLC_ADDRESS="ja_JP.UTF-8"\nLC_TELEPHONE="ja_JP.UTF-8"\nLC_MEASUREMENT="ja_JP.UTF-8"\nLC_IDENTIFICATION="ja_JP.UTF-8"\nLC_ALL=\n' /etc/environment

  # Reboot/Later
  if grep -q "$ locale" /etc/environment ; then
      OPTION=$(zen_nospam --title="Adding a locale" --width=350 --height=100 --list --radiolist --text "Reboot system:" --hide-header --column "Buttons" --column "Choice"\
      TRUE "Reboot now" \
      FALSE "Reboot later"
      )
  fi
    # Reboot later
    if [ "$OPTION" == "Reboot later" ]; then
        zen_nospam --title="Adding a locale" --width=150 --height=40 --info --text "Don't forget to reboot your system later"
        exit 0
    else
    # Reboot after recovery
        echo "Reboot!"
        shutdown now -r
    fi
  )
fi
