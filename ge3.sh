#!/bin/bash
geth --identity "node3" \
  --datadir "$HOME/myetherdata/testdata3" \
  --rpc --rpcport "8103" --rpccorsdomain "*" --port "30403" --nodiscover \
  --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" \
  --ipcpath "$HOME/myetherdata/testdata3/geth.ipc" \
  --rpcapi "admin,db,eth,debug,miner,net,ssh,txpool,personal,web3" \
  --autodag --networkid 1900 --nat "any" $*


