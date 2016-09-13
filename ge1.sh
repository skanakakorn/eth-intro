#!/bin/bash
geth --identity "node1" \
  --datadir "$HOME/myetherdata/testdata1" \
  --rpc --rpcport "8101" --rpccorsdomain "*" --port "30401" --nodiscover \
  --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" \
  --ipcpath "$HOME/myetherdata/testdata1/geth.ipc" \
  --rpcapi "admin,db,eth,debug,miner,net,ssh,txpool,personal,web3" \
  --autodag --networkid 1900 --nat "any" $*


