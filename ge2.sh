#!/bin/bash
geth --identity "node2" \
  --datadir "$HOME/myetherdata/testdata2" \
  --rpc --rpcport "8102" --rpccorsdomain "*" --port "30402" --nodiscover \
  --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" \
  --ipcpath "$HOME/myetherdata/testdata2/geth.ipc" \
  --rpcapi "admin,db,eth,debug,miner,net,ssh,txpool,personal,web3" \
  --autodag --networkid 1900 --nat "any" $*


