/* 
 * Sample code to run by nodejs for transferring Ether.
 *
 * By Suttipong Kanakakorn
 *
 * API From
 * https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console
 * https://github.com/ethereum/wiki/wiki/JavaScript-API
*/

var argv = require('minimist')(process.argv.slice(2), {
  string: 'to'
});

to_account = argv['to']

if (typeof web3 == 'undefined') {
  // This is likely the case when running from nodejs
  var Web3 = require('web3');
  // set the provider you want from Web3.providers
  var web3 = new Web3(new
    Web3.providers.HttpProvider("http://localhost:8545"));
} 


var accounts = web3.eth.accounts;
// unlock from_account 600 secs
web3.personal.unlockAccount(accounts[0],"password1",600)
var from_account = accounts[0];
// var to_account = accounts[1];
// to_account = "0xd249f7f4eea84cd35d0045c0c7b88d4703647339"
amount = web3.toWei(2, "ether")
// amount = 0
console.log('sending from:' + from_account)
console.log('to:' + to_account)
// process.exit(0)
my_text = "Howdy!"
my_data = web3.toHex(my_text)
tx_obj = {
  from: from_account, to: to_account, value: amount,
  data: my_data
}

console.log('Send transaction with data :' + my_text)
tx_hash = web3.eth.sendTransaction(tx_obj)
console.log('tx_hash: ' + tx_hash)
tx_data = web3.eth.getTransaction(tx_hash)
// After certain period, the tx would be processed and we should get tx_receipt
// with the block number
console.log('Got data back :' + web3.toAscii(tx_data.input))
console.log('Getting tx_receipt if block contained tx is mined. Ctrl-c is okay')
// This could be improve by callback when tx is mined rather than sleeping
setTimeout(function(){
  tx_receipt = web3.eth.getTransactionReceipt(tx_hash)
  console.log('Got tx_receipt :' + tx_receipt + 
              'block#: ' + tx_receipt.blockNumber)
  console.log('Goto http://testnet.etherscan.io/block/' + 
               tx_receipt.blockNumber)
}, 30000);
