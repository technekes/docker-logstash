#! /bin/sh
/opt/logstash/set_dns.sh
ACCESS_KEY_ESCAPED=$(echo $AWS_SECRET_ACCESS_KEY | sed 's!/!\\/!g')
sed -i "s/{LS_ES_HOST}/$LS_ES_HOST/g" logstash.conf
sed -i "s/{AWS_ACCESS_KEY_ID}/$AWS_ACCESS_KEY_ID/g" logstash.conf
sed -i "s/{AWS_SECRET_ACCESS_KEY}/$ACCESS_KEY_ESCAPED/g" logstash.conf

/opt/logstash/bin/logstash -f /opt/logstash/logstash.conf
