#!/bin/bash


sudo apt update
sudo apt install git

TARGET_DIR="./DP-projekt"
URL2="https://github.com/ababic20/DP-Ransomware.git"

git clone "$URL2" "./DP-Ransomware"

IMPLEMENTATION_PATH="./DP-Ransomware/Implementation"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "-----ISPIS SADRŽAJA NA POČETKU-----"

cd $SCRIPT_DIR/$IMPLEMENTATION_PATH && echo -e "\nSadrzaj prvog file-a je: " && cat Text.txt && echo -e "\nSadrzaj drugog file-a je: " && cat Text2.txt && echo -e "\n";

sleep 5

echo "-----ENKRIPCIJA-----"

cd $SCRIPT_DIR/$IMPLEMENTATION_PATH && ./encrypt.sh

cd $SCRIPT_DIR/$IMPLEMENTATION_PATH && echo -e "\nSadrzaj prvog file-a je: " && cat Text.txt && echo -e "\nSadrzaj drugog file-a je: " && cat Text2.txt && echo -e "\n";

sleep 5

echo "-----DEKRIPCIJA-----"

cd $SCRIPT_DIR/$IMPLEMENTATION_PATH && ./decrypt.sh

cd $SCRIPT_DIR/$IMPLEMENTATION_PATH && echo -e "\nSadrzaj prvog file-a je: " && cat Text.txt && echo -e "\nSadrzaj drugog file-a je: " && cat Text2.txt && echo -e "\n";

sleep 5

encrypt_script_path="$SCRIPT_DIR/$IMPLEMENTATION_PATH/encrypt.sh"
netcat_script_path="$SCRIPT_DIR/$IMPLEMENTATION_PATH/netcat.sh"
test_detect_path="$SCRIPT_DIR/$IMPLEMENTATION_PATH/test_detect/"

if [ -f "$encrypt_script_path" ]; then
    cp "$encrypt_script_path" "$test_detect_path"
    cp "$netcat_script_path" "$test_detect_path"
    
    echo "Datoteka encrypt.sh uspješno kopirana u $test_detect_path."
    echo "Sadržaj direktorija $test_detect_path:"
    ls -l "$test_detect_path"
else
    echo "Datoteka encrypt.sh nije pronađena u $encrypt_script_path."
fi

sleep 5

echo "-----Pronalazak enkripcije, brisanje-----"

cd $SCRIPT_DIR/$IMPLEMENTATION_PATH && ./detect.sh

sleep 10
if command -v dirname &> /dev/null && command -v gnome-terminal &> /dev/null; then
    gnome-terminal --tab --title="Poslužitelj" -- bash -c "cd $SCRIPT_DIR/$IMPLEMENTATION_PATH && nc -lnvp 12345; exec bash"
fi
sleep 5
if command -v dirname &> /dev/null && command -v gnome-terminal &> /dev/null; then
    gnome-terminal --tab --title="Klijent" -- bash -c "cd $SCRIPT_DIR/$IMPLEMENTATION_PATH && ./netcat.sh; exec bash"
fi

