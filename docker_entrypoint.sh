#!/bin/bash

set -a

echo "Configuring Jet..."
JET_BOT=$(yq e '.bot.enable' /root/start9/config.yaml)
if [ "$JET_BOT" = "enable" ]; then
	JET_TOKEN=$(yq e '.bot.token' /root/start9/config.yaml)
	echo "Jet Bot Enabled..."
else
	echo "Jet Bot Disabled..."
fi

#Configuring Lightning Jet
sed -i 's/.*"macaroonPath":.*/  "macaroonPath": "\/mnt\/lnd\/admin.macaroon",/' ./api/config.json
sed -i 's/.*"tlsCertPath":.*/  "tlsCertPath": "\/mnt\/lnd\/tls.cert",/' ./api/config.json
sed -i '/.*"macaroonPath":.*/a \ \ "serverAddress": "lnd.embassy:10009",' ./api/config.json
sed -i '/.*"rebalancer":.*/a \ \ \  "minCapacity": 50000,' ./api/config.json
if [ "$JET_BOT" = "enable" ]; then
    sed -i '/.*"debugMode":.*/a  \ \ "telegramToken": "'$JET_TOKEN'",' ./api/config.json
fi
echo "export PATH=$PATH:/app" >> ./.profile
source ./.profile
chmod +r /mnt/lnd/readonly.macaroon

#Starting Lightning Jet
echo "Starting Jet..."
jet start daddy

# Starting command line
while true;
do jet peers;
sleep 2000;
done

