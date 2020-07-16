#!/bin/bash

while : ; do
	TEMP=$(expr $(cat /sys/class/thermal/thermal_zone0/temp) / 1000)
	DATAJSON="{\"temp\":\"$TEMP\", \"balena-uuid\":\"$BALENA_DEVICE_UUID\", \"balena-name\":\"$BALENA_DEVICE_NAME_AT_INIT\"}"

	echo $TEMP

	LOSANT_CURL=$(curl --write-out "%{http_code}" -sX POST "$LOSANT_WEBHOOK" \
	-H "Content-Type: application/json" \
	--data "$DATAJSON" > /dev/null)

	sleep $SLEEPING_TIME
done

