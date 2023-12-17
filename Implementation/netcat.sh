#!/bin/bash

if [ -e "Text.txt" ]; then
    file_content_1=$(cat "Text.txt")

    if [ -e "Text2.txt" ]; then
        file_content_2=$(cat "Text2.txt")
        echo "Sadržaj fileova je pročitan te ih šaljem poslužitelju:"
        echo "Sadržaj prvog filea je: $file_content_1"
        echo "Sadržaj drugog filea je: $file_content_2"
        {
            echo "Prvi file - primljeno: $file_content_1"
            echo "Drugi file - primljeno: $file_content_2"
        } | nc 127.0.0.1 12345
    else
        echo "Datoteka 'Text2.txt' ne postoji."
    fi
else
    echo "Datoteka 'Text.txt' ne postoji."
fi