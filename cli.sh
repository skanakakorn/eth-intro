#!/bin/bash
#geth --preload gethutil.js attach ipc://$HOME/.ethereum/testnet/geth.ipc console
geth --preload gethutil.js attach http://localhost:8545 console
