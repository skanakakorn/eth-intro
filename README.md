# eth-intro

This tutorial guides you to create very first Ethereum contract and introduce
you to programming on Ethereum platform.

The tutorial is written with Ethereum Homestead using Ubuntu 14.04. It's
copyrighted and intend for students which I give permission to use only.

Installation on Ubuntu 14.04

Install Ethereum
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum-dev
sudo apt-get update
sudo apt-get install ethereum

Install Solidity
npm install solc

Install nodejs
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo apt-get -y install git
npm install web3

Useful links
http://www.ethdocs.org/en/latest/

Sending Ether

From geth console
sender = eth.accounts[0];
receiver = eth.accounts[1];
amount = web3.toWei(0.01, "ether")
eth.sendTransaction({from:sender, to:receiver, value: amount})

Using javascript via nodejs
edit send_ether.js
change number of ether from 2 to 0.000003
$ nodejs send_ether.js —to address

Check your transaction, balances, block, and etc.
http://testnet.etherscan.io

Geth can execute java script directly
$ .geth --exec 'loadScript("checkbalances.js")' attach http://localhost:8545

Writing your first contract

contract MessageStorage {
    string storedData;

    event Set(
        address indexed _from,
        string s
    );

    function set(string s) {
        storedData = s;
        Set(msg.sender, s);
    }

    function get() constant returns (string retVal) {
        return storedData;
    }
}

This is stored in a file called contract_1st.sol

Compiling your first contract

Open up a browser tab for online compiler here
https://ethereum.github.io/browser-solidity/#version=0.3.6
Copy the contract code to the window of compiler

Bring up a file create_contract1.js, replace some code with code from “Web3
deploy”.

Execute the contract creation script
$ nodejs create_contract1.js

Notice the contract address ? You’ll need it. Save it somewhere.

Verify that contract has been created with http://testnet.etherscan.io

