#!/bin/bash

if [ -e "/conf/cli-wallet/wallet.json" ]; then
 echo "Copying predefined wallet.json file"
 cp -v /conf/cli-wallet/wallet.json /wallet.json
fi


 cli_wallet \
     -s ws://127.0.0.1:8090\
     -H 0.0.0.0:8092 \
     -d
