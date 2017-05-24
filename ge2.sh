#!/bin/bash
geth --dev --identity "node2" \
  --datadir "$HOME/myetherdata/testdata2" \
  --rpc --rpcport "8102" --rpccorsdomain "*" --port "30402" --nodiscover \
  --ipcpath "$HOME/myetherdata/testdata2/geth.ipc" \
  --rpcapi "admin,db,eth,debug,miner,net,ssh,txpool,personal,web3" \
  --rpcaddr "0.0.0.0" \
  --networkid 1900 --nat "any" $*


