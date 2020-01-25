#!/bin/bash
TAG_KEY="CPU_Temp"

ID=$(curl -sX GET "https://api.balena-cloud.com/v5/device?\$filter=uuid%20eq%20'$BALENA_DEVICE_UUID'" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $BALENA_API_KEY" | \
jq ".d | .[0] | .id")

curl -sX POST \
"https://api.balena-cloud.com/v5/device_tag" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $BALENA_API_KEY" \
--data "{ \"device\": \"$ID\", \"tag_key\": \"$TAG_KEY\", \"value\": \"--\" }" > /dev/null

while : ; do
  TEMP=$(expr $(cat /sys/class/thermal/thermal_zone0/temp) / 1000)
  
  curl -sX PATCH \
  "https://api.balena-cloud.com/v5/device_tag?\$filter=(device%20eq%20'$ID')%20and%20(tag_key%20eq%20'$TAG_KEY')" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $BALENA_API_KEY" \
  --data "{ \"device\": \"$ID\", \"tag_key\": \"$TAG_KEY\", \"value\": \"$TEMP°C\" }" > /dev/null
  
  sleep 60
done