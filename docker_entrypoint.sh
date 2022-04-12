#!/bin/bash

# Display current installed version and help
echo "Balance of Satoshis - Version: "
./bos --version
mkdir -p /root/.bos/embassy
chmod -R a+x /root/.bos

mv ../credentials.json /root/.bos/embassy/credentials.json
chmod a+x /root/.bos/embassy/credentials.json

# Starting command line
while true;
do ./bos nodes;
sleep 2000;
done

