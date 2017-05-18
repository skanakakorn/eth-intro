# Ethereum programming: Introduction

Copyright by Suttipong Kanakakorn 2017.

Please ask permission to distribute this document by sending email to this 
address bbdada@gmail.com.

This tutorial guides you to create very first Ethereum contract and introduce
you to programming on Ethereum platform.

The tutorial is written for Ethereum Homestead using Ubuntu 16.04. 
For non-Ubuntu specific, this works on Mac OS X as well.

## Using Ethereum

### Managing your account
When you create your account, it will ask your password to encrypt your private key. 
If you lose the password you use to encrypt your account, you will 
not be able to access that account. For study purpose, I use 
password as "password1" for most accounts.

### Creating a new account

Creates a new account and prints the address.
On the console, use:

```
> personal.newAccount("password1")

> personal.newAccount()
Passphrase: 
Repeat passphrase: 
"0x257918acc909e5eaf049fe4eb6aff9d6d3529b1f"
```

You have now created 2 accounts.

From shell prompt, use:
```
geth account new
```

### Listing your accounts

```
> personal.listAccounts
> eth.accounts
["0xb662c5bebd681fb6e297153b05bfd4330d193429", "0xdf1865f76485cf468449dce2754fd9335053c274", "0x257918acc909e5eaf049fe4eb6aff9d6d3529b1f"]
```


### Sending Ether

From geth console
```javascript
personal.unlockAccount(eth.accounts[0],"password1", 6000)
sender = eth.accounts[0];
receiver = eth.accounts[1];
amount = web3.toWei(0.0001, "ether")
tx = eth.sendTransaction({from:sender, to:receiver, value: amount})
```

You can look at the transaction detail like this:
```
> eth.getTransaction(tx)
or
> eth.getBlock("pending", true).transactions
or
> eth.pendingTransactions
```

This output indicates that there is one transaction pending.
```
[{
    blockHash: "0xb036f95c268223255d5c60b440de20c365c3fcc07fea5de187f88aea67e3fde6",
    blockNumber: 17,
    from: "0xb662c5bebd681fb6e297153b05bfd4330d193429",
    gas: 90000,
    gasPrice: 20000000000,
    hash: "0xebdd63695acd7be2a92cd3748480d9af55cc3bbe5b433e96f96c472391550045",
    input: "0x",
    nonce: 1,
    to: "0xdf1865f76485cf468449dce2754fd9335053c274",
    transactionIndex: 0,
    value: 100000000000000
}]
```

If your transaction is pending forever, why ?

If you running your nodes on testnet check your transaction, balances, block,
and etc.  http://testnet.etherscan.io

Getting account balances. Try this one line at at time.
```javascript
eth.getBalance(eth.accounts[1])
web3.fromWei(eth.getBalance(eth.accounts[1]))
for (e in eth.accounts) { console.log(eth.getBalance(eth.accounts[e])) };
loadScript('gethutil.js')
checkAllBalances()
```

Sending ether via javascript. Make sure you modify your port in send_ether.js
properly.
```
nodejs send_ether.js --to ADDRESS
```

Geth can execute java script directly.
```
$ geth --exec 'loadScript("checkbalances.js")' attach http://localhost:8545
```

## Your first contract

### Writing your first contract
```
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
```

This is stored in a file called contract_1st.sol.

Compiling your first contract.

Open up a browser tab for online compiler here
https://ethereum.github.io/browser-solidity/#version=0.3.6
Copy the contract code to the window of compiler.

Bring up a file create_contract1.js, replace some code with code from “Web3
deploy”.

Execute the contract creation script.
```
nodejs create_contract1.js
```

Notice the contract address ? You’ll need it. Save it somewhere.

Verify that contract has been created.
On test net, goto http://testnet.etherscan.io

### Interacting with your 1st contract

Let’s copy and paste this to geth console line by line so we can interact with
the contract more.
```javascript
accounts = web3.eth.accounts;
// unlock from_account 600 secs
web3.personal.unlockAccount(accounts[0],"password1",6000)
from_account = accounts[0];
```

Replace the contract address with the one you created. If you don't replace,
you'd use my contract.

```javascript
contract_address = "0xa957F6211F48baD6ACdFb5aCC68E1F98A8596303"
```

Replace this abi with the correct abi from the “Interface” output of online
compiler.
```javascript
abi = [{"constant":false,"inputs":[{"name":"s","type":"string"}],"name":"set","outputs":[],"type":"function"},{"constant":true,"inputs":[],"name":"get","outputs":[{"name":"retVal","type":"string"}],"type":"function"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":false,"name":"s","type":"string"}],"name":"Set","type":"event"}]
```

Try chainging message from "Nick One" to something else.
```javascript
contract = web3.eth.contract(abi).at(contract_address)
msg = "Nick One"
tx_hash = contract.set.sendTransaction(msg,{from: from_account})
```

Check if your message is correct.
```javascript
tx_data = web3.eth.getTransaction(tx_hash)
console.log(contract.get())
```

console.log(contract.get())
```javascript
tx_data = web3.eth.getTransaction(tx_hash)
console.log(contract.get())
```

All of the codes for interacting with contract are in the file
call_contract.js.

