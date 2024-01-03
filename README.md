# DP---Implementation-of-the-mobile-agent
Implementation of mobile agent (e.g. virus/malware, information search agent) (Shell+netcat)

## Launching the application - simpler way
1. First, position yourself on the Desktop directory.
2. Just download the start.sh script and place it on your Desktop.
3. Give it access rights: chmod +x ./start.sh
4. Run the script: ./start.sh

[NOTE] - Follow the execution of the script, because it is important to enter the password of the user on your operating system, as well as confirm some steps with yes during installation sudo apt install git and sudo apt update.

## Launching the application
1. First of all, it is necessary to give authority to the .sh scripts as follows:
   
            • chmod +x ./encrypt.sh
            
            • chmod +x ./decrypt.sh
            
            • chmod +x ./netcat.sh
   
            • chmod +x ./detect.sh

3. Run this command: ./encrypt.sh
4. Run this command: ./decrypt.sh - phrase is "dp"
5. Run this command: ./detect.sh
6. Netcat - **first terminal**: - nc -lnvp 12345, **second terminal**: ./netcat.sh

[NOTE] - You need to move to the "Implementation" directory
