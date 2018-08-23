
pragma solidity ^0.4.10;

// "class" TweetStorage
contract TweetStorage {
  
  // "array" of all tweets of this account: maps the tweet id to the actual tweet
  mapping (uint => string) _tweets;
  
   // "array" of all ban addresses; mpas the address to true/false
  mapping (address => bool) _banAddress;
  
  // total number of tweets in the above _tweets mapping
  uint _tweetCount;
  
  // "owner" of this account
  address _adminAddress;

  event Tweet(  
    address indexed _from,
    string s,
    uint256 _tweetCount
  );
  
  event AddBan(  
    address banAddress
  );
  
  event Ban(  
    address banAddress
  );

  // constructor
  function TweetStorage() {
    _tweetCount = 0;
    _adminAddress = msg.sender;
  }
  
  // returns true if caller of function ("sender") is admin
  function isAdmin() constant returns (bool isAdminAddress) {
    return msg.sender == _adminAddress;
  }
  
  function isBan(address addr) constant returns (bool result) {
    return _banAddress[addr] == true;
  }
  
  // create new tweet
  function tweet(string tweetString) returns (int result) {
    if (isBan(msg.sender)) {
      Ban(msg.sender);
      result = -4;
      return result;
    }
    if (bytes(tweetString).length > 256) {
      // limit to 256 bytes
      result = -3;
    } else {
      _tweets[_tweetCount] = tweetString;
      _tweetCount++;
      result = 0; // success
    }
    Tweet(msg.sender, tweetString, _tweetCount);
  }
  
  function getTweet(uint tweetId) constant returns (string tweetString) {
    tweetString = _tweets[tweetId];
  }
  
  function getLatestTweet() constant returns (string tweetString, uint numberOfTweets) {
    tweetString = _tweets[_tweetCount - 1];
    numberOfTweets = _tweetCount;
  }
  
  function getOwnerAddress() constant returns (address adminAddress) {
    return _adminAddress;
  }
  
  function getNumberOfTweets() constant returns (uint numberOfTweets) {
    return _tweetCount;
  }
  
  function setAccountAdministrator(address newAdminAddress) 
        returns (int result) {
	if (isAdmin()) {
	  _adminAddress = newAdminAddress;
	  result = 0;
	} else {
	  result = -1;
	}
  }
  
  function ban(address banAddress) returns (int result) {
    if (!isAdmin()) {
      result = -1;
      return result;
    }
    _banAddress[banAddress] = true;
    AddBan(banAddress);
    result = 0;
    return result;
  }
}
