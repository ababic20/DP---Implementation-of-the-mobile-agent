#!/bin/bash

target_directory="$HOME/Desktop/DP-Ransomware/Implementation/test_detect/"
keyword="encrypt"
trash_directory="$HOME/Desktop/DP-Ransomware/Implementation/trash/"

echo "-----------------------------"
echo "Entering the folder: $(basename "$target_directory")"
encryption_found=false
empty_directory=true

for file in "$target_directory"*; do
    if [ -f "$file" ]; then
        empty_directory=false 
        if grep -q "$keyword" "$file"; then
            encryption_found=true
            echo "Warning!!! Encryption found in file: $(basename "$file")"
            grep "$keyword" "$file"
            
            mv "$file" "$trash_directory"
            echo "File moved to trash directory."
            sleep 5
            rm "$trash_directory/$(basename "$file")"
            echo "File deleted from trash directory."
        else
            echo "No encryption found in file: $(basename "$file")"
        fi
        echo "-----------------------------"
    fi
done

if [ "$empty_directory" = true ]; then
    echo "There are no files in the folder: $(basename "$target_directory")"
fi

if [ "$encryption_found" = false ]; then
    echo "No files contain the keyword: $keyword"
fi
