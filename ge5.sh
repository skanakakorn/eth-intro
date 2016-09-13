#!/bin/bash
geth --identity "node5" \
  --datadir "$HOME/myetherdata/testdata5" \
  --rpc --rpcport "8105" --rpccorsdomain "*" --port "30405" --nodiscover \
  --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" \
  --ipcpath "$HOME/myetherdata/testdata5/geth.ipc" \
  --rpcapi "admin,db,eth,debug,miner,net,ssh,txpool,personal,web3" \
  --autodag --networkid 1900 --nat "any" $*


