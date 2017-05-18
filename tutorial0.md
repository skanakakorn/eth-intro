# Ethereum programming: Introduction

Copyright by Suttipong Kanakakorn 2017.

Please ask permission to distribute this document by sending email to this 
address bbdada@gmail.com.

### Starting Ethereum
Starting Ethereum node and connect to public test network
```
cd eth-intro
./ge.sh console
```

Connect to the local node. Do this on a separate ssh prompt.
```
geth attach http://localhost:8545
geth attach ipc://$HOME/.ethereum/testnet/geth.ipc
```
