#!/usr/bin/env python3
import os

files = []

for file in os.listdir():
	if file == "decrypt.sh" or file == "encrypt.sh" or file == "netcat.sh" or file == "thekey.key":
		continue
	if os.path.isfile(file):
		files.append(file)

print(files)