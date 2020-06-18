#!/bin/bash
TAG_KEY="CPU_Temp"

while : ; do
	TEMP=$(expr $(cat /sys/class/thermal/thermal_zone0/temp) / 1000)
	echo $TEMP

	DATAJSON="{\"data\":{\"path\":\"cpu_temp\", \"method\": \"post\",\"body\":{\"temp\":\"$TEMP\"} }, \"applicationId\": \"\", \"applicationName\": \"Humpback_flow\", \"triggerId\":\"\", \"triggerType\":\"\", \"flowId\":\"\", \"flowName\":\"\", \"globals\":{}  }"

	echo $DATAJSON

	curl -sX POST \
	"https://triggers.losant.com/webhooks/5QoLVhYVZREuKZO9oKqvk5F-UVgjOiOj-tlDwFegaA1$" \
	-H "Content-Type: application/json" \
	--data ${DATAJSON} 

	sleep 60
done

