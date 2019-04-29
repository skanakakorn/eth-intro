/* 
 *
 * By Suttipong Kanakakorn
 *
 * API From
 * https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console
 * https://github.com/ethereum/wiki/wiki/JavaScript-API
*/

if (typeof web3 == 'undefined') {
  // This is likely the case when running from nodejs
  var Web3 = require('web3');
  // set the provider you want from Web3.providers
  var web3 = new Web3(new
    Web3.providers.HttpProvider("http://localhost:8545"));
} 

var argv = require('minimist')(process.argv.slice(2));

console.log(argv)
/*if (! from_address_index) {
  from_address_index = 0
  console.log("Using address index " + from_address_index) 
}*/


accounts = web3.eth.accounts;
// unlock from_account 600 secs
// web3.personal.unlockAccount(accounts[from_address_index],"",6000)
from_account = accounts[0];
console.log("Using account: " + from_account)

// Replace the contract address with the one you created.
// This is not the account address
tweet_contract_address = "0xbb29cc74cbf9c621bc0d442f86f1196a6bd6caa1"

// this fixes errors on dev network
web3.eth.isSyncing(() => console.log('sync'))

// replace this abi with the correct abi from the “Interface” output of online
// compiler.
tweet_abi = [{"constant":true,"inputs":[],"name":"getOwnerAddress","outputs":[{"name":"adminAddress","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getLatestTweet","outputs":[{"name":"tweetString","type":"string"},{"name":"numberOfTweets","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"isAdmin","outputs":[{"name":"isAdmin","type":"bool"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"tweetId","type":"uint256"}],"name":"getTweet","outputs":[{"name":"tweetString","type":"string"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getNumberOfTweets","outputs":[{"name":"numberOfTweets","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"tweetString","type":"string"}],"name":"tweet","outputs":[{"name":"result","type":"int256"}],"payable":false,"type":"function"},{"inputs":[],"payable":false,"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":false,"name":"s","type":"string"},{"indexed":false,"name":"_tweetCount","type":"uint256"}],"name":"Tweet","type":"event"}]

tweet_contract = web3.eth.contract(tweet_abi).at(tweet_contract_address)
console.log("Number of tweets:" + tweet_contract.getNumberOfTweets())

if (argv['latest']) {
  console.log("Latest tweets:" + tweet_contract.getLatestTweet())
}
