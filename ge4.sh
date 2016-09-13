#!/bin/bash
geth --identity "node4" \
  --datadir "$HOME/myetherdata/testdata4" \
  --rpc --rpcport "8104" --rpccorsdomain "*" --port "30404" --nodiscover \
  --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" \
  --ipcpath "$HOME/myetherdata/testdata4/geth.ipc" \
  --rpcapi "admin,db,eth,debug,miner,net,ssh,txpool,personal,web3" \
  --autodag --networkid 1900 --nat "any" $*


