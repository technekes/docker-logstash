#!/bin/bash   

if [ -n "$HOSTED_ZONE_ID" ]; then
  aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --change-batch '{"Comment": "Registering new IP addresses", "Changes": [{ "Action": "UPSERT","ResourceRecordSet": { "Name": "'$HOSTNAME'", "Type": "A","TTL": 3600,"ResourceRecords": [{"Value": "'$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)'"}]}}]}'
fi
