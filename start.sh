#!/bin/bash
TAG_KEY="CPU_Temp"

while : ; do
	TEMP=$(expr $(cat /sys/class/thermal/thermal_zone0/temp) / 1000)

	curl -sX POST \
	"https://triggers.losant.com/webhooks/5QoLVhYVZREuKZO9oKqvk5F-UVgjOiOj-tlDwFegaA1$" \
	-H "Content-Type: application/json" \
	--data "{ \"device\": \"$ID\", \"tag_key\": \"$TAG_KEY\", \"value\": \"$TEMP\" }" > /dev/null

	sleep 60
done

