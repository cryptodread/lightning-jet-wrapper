#!/bin/bash

sed -i 's/.*"macaroonPath":.*/"macaroonPath": "/mnt/lnd/readonly.macaroon",/' api/config.json
sed -i 's/.*"tlsCertPath":.*/"tlsCertPath": "/mnt/lnd/tls.cert",' api/config.json
sed -i 's/export PATH=/export PATH="$HOME/lightning-jet:' ./.profile
echo "export PATH=$HOME/lightning-jet:$PATH" >> ./.profile
. /.profile

# Display current installed version and help
echo "Lightning Jet - Version: "
jet -v

# Start Jet
echo "Starting Jet Daddy"
jet start daddy

# Starting command line
while true;
do jet peers;
sleep 2000;
done

