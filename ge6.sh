#!/bin/bash
geth --identity "node6" \
  --datadir "$HOME/myetherdata/testdata6" \
  --rpc --rpcport "8106" --rpccorsdomain "*" --port "30406" --nodiscover \
  --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" \
  --ipcpath "$HOME/myetherdata/testdata6/geth.ipc" \
  --rpcapi "admin,db,eth,debug,miner,net,ssh,txpool,personal,web3" \
  --autodag --networkid 1900 --nat "any" $*


