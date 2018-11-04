#!/bin/sh

PDNS_CONFD="/etc/pdns/conf.d"

API_FILE="$PDNS_CONFD/10-api.conf"
WEBSERVER_FILE="$PDNS_CONFD/20-webserver.conf"
AXFR_FILE="$PDNS_CONFD/30-axfr.conf"


if [ ! -z "$WEBSERVER" ] && [ $WEBSERVER = "yes" ]
then
	echo "Webserver enabled."
	echo "webserver=yes" > $WEBSERVER_FILE

	[[ ! -z "$WEBSERVER_ADDRESS" ]] && echo "webserver-address=$WEBSERVER_ADDRESS" >> $WEBSERVER_FILE
	[[ ! -z "$WEBSERVER_ALLOW_FROM" ]] && echo "webserver-allow-from=$WEBSERVER_ALLOW_FROM" >> $WEBSERVER_FILE
	[[ ! -z "$WEBSERVER_PASSWORD" ]] && echo "webserver-password=$WEBSERVER_PASSWORD" >> $WEBSERVER_FILE
	[[ ! -z "$WEBSERVER_PORT" ]] && echo "webserver-port=$WEBSERVER_PORT" >> $WEBSERVER_FILE


else
	echo "Webserver disabled."
fi

if [ ! -z "$API" ] && [ $API = "yes" ]
then
	echo "API enabled."
	if [ -z "$API_KEY" ]
	then
		echo "Set api key!"
		exit 1;
	else
		echo "api=yes" > $API_FILE
		echo "api-key=$API_KEY" >> $API_FILE
	fi

else
	echo "API disabled."
fi


if [ ! -z "$AXFR_IPS" ]
then
	echo "AXFR enabled: $AXFR_IPS"
	echo "allow-axfr-ips=$AXFR_IPS" > $AXFR_FILE
else
	echo "AXFR disabled."
fi




/entrypoint_stage2.sh