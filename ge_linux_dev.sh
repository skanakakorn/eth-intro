#!/bin/bash
/usr/bin/geth --dev \
--datadir "$HOME/myetherdata/devdata" \
--rpc --rpcaddr "0.0.0.0" \
--rpcport 8545 --rpcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" $*
