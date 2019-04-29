#!/bin/bash
/usr/bin/geth --testnet --syncmode "fast" \
--rpccorsdomain "*" --rpc \
--rpcport 8545 \
--rpcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" $*
