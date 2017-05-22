#!/bin/bash
geth --preload gethutil.js attach ipc://$HOME/.ethereum/testnet/geth.ipc console
