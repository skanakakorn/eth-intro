#!/bin/bash
$HOME/geth \
--identity "node4" \
--datadir "$HOME/myetherdata/testdata4" \
--ipcpath ~/Library/Ethereum/geth.ipc \
--rpccorsdomain "*" --rpc \
--rpcport 8545 \
--rpcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" \
--autodag --networkid 1900 --nat "any" $*
