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

Exit from console and shutdown the node.
```
>exit
```

If you need log information, start with:
```
./ge.sh --verbosity 5 console 2>>/tmp/eth.log
```

Mute your log, start with:
```
./ge.sh console 2>/dev/null
```

Connect to the local node. Do this on a separate ssh prompt.
```
geth attach http://localhost:8545
geth attach ipc://$HOME/.ethereum/testnet/geth.ipc
```

Link: https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console

Questions:
Try these commands.
```
geth attach
geth attach http://localhost:8500
```

Why did they fail ?

What should I do to connect via http to work if I want to use port 8500 ?

