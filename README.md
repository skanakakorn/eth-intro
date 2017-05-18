# Ethereum programming: Introduction

Copyright by Suttipong Kanakakorn 2017.

Please ask permission to distribute this document by sending email to this 
address bbdada@gmail.com.

This tutorial guides you to create very first Ethereum contract and introduce
you to programming on Ethereum platform.

The tutorial is written for Ethereum Homestead using Ubuntu 16.04. 
For non-Ubuntu specific, this works on Mac OS X as well.

### Install Ethereum
```
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum
```

### Install nodejs and npm
```
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo apt-get -y install git
sudo apt install npm  # This can take a while
```

### Install other node modules
```
npm init -y
npm install web3
npm install minimist
```

### Install Solidity (optional)
```
npm install solc
```

### Setup Ethereum to run as private blockchain
https://docs.google.com/document/d/1wf58CgA5oROtGgKfv5XtbnZUcYfMhf4MfTNK9xHYgqs/edit#

### Useful links
* http://www.ethdocs.org/en/latest/
* https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts
