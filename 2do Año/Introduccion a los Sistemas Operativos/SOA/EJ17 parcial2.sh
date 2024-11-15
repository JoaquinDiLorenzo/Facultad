#!/bin/bash

users=$(cat /etc/passwd)

echo > /var/listado.txt

for userPass in $users; do
    userName=$(echo "$userPass" | cut -d: -f 1)
    userHome=$(echo "$userPass" | cut -d: -f 6)
    userShell=$(echo "$userPass" | cut -d: -f 7)

        
    if  [ -d "$userHome/mailDir" ] &&
        [ "$userShell" = "bin/bash" ]; then

        echo "$userName" >> /var/listado.txt

    fi

done