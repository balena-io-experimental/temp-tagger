#!/bin/bash

TTN_EUI=$(cat /sys/class/net/eth0/address | sed -r 's/[:]+//g' | sed -e 's#\(.\{6\}\)\(.*\)#\1FFFE\2#g')

echo $TTN_EUI

while : ; do
	TEMP=$(expr $(cat /sys/class/thermal/thermal_zone0/temp) / 1000)
	#DATAJSON="{\"data\":{\"path\":\"/example/path\", \"method\": \"POST\",\"body\":{\"temp\":\"$TEMP\", \"deviceId\":\"$TTN_EUI\"} }, \"applicationId\": \"5ef35e4682043900066427db\", \"applicationName\": \"Balena/Losant Template\", \"triggerId\":\"5ef361350515e2000662a99a\", \"triggerType\":\"webhook\", \"flowId\":\"5ef361ec0515e2000662a99e\", \"flowName\":\"Rpi Temp\", \"globals\":{}  }"
	DATAJSON="{\"data\":{\"method\": \"POST\",\"body\":{\"temp\":\"$TEMP\", \"deviceId\":\"$TTN_EUI\"} } }"

	echo $TEMP

	LOSANT_CURL=$(curl --write-out "%{http_code}" -sX POST "$LOSANT_WEBHOOK" \
	-H "Content-Type: application/json" \
	--data "$DATAJSON" > /dev/null)

	sleep 60
done

