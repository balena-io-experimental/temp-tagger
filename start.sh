#!/bin/bash
REQ="POST"

ID=$(curl -sX GET "https://api.balena-cloud.com/v5/device?\$filter=uuid%20eq%20'$BALENA_DEVICE_UUID'" \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $BALENA_API_KEY" | \
jq ".d | .[0] | .id")

while : ; do
  TEMP=$(expr $(cat /sys/class/thermal/thermal_zone0/temp) / 1000)
  
  curl -sX $REQ \
  "https://api.balena-cloud.com/v5/device_tag" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $BALENA_API_KEY" \
  --data "{ \"device\": \"$ID\", \"tag_key\": \"CPU_Temp\", \"value\": \"$TEMP°C\" }"
  
  REQ="PATCH"
  sleep 60
done