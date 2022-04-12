# Instructions for Balance of Satoshis

Balance of Satoshis is command line only. SSH is required to use this service.

## Setup 

1. SSH into this Embassy (add a new SSH Key if needed)



2. Run the following command to enter the `balanceofsatoshis.embassy` container:

    `docker exec -it balanceofsatoshis.embassy /bin/bash`

3. Run the following command to set the default LND node to be this Embassy:

    `export BOS_DEFAULT_SAVED_NODE=embassy`


## You should now be able to run Balance of Satoshis commands. 

## Use `./bos help` for more information.