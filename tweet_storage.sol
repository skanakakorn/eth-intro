// "class" TweetStorage
contract TweetStorage {
  
  // "array" of all tweets of this account: maps the tweet id to the actual tweet
  mapping (uint => string) _tweets;
  
  // total number of tweets in the above _tweets mapping
  uint _tweetCount;
  
  // "owner" of this account
  address _adminAddress;

  event Tweet(  
    address indexed _from,
    string s,
    int _tweetCount
  );

  // constructor
  function TweetStorage() {
    _tweetCount = 0;
    _adminAddress = msg.sender;
  }
  
  // returns true if caller of function ("sender") is admin
  function isAdmin() constant returns (bool isAdmin) {
    return msg.sender == _adminAddress;
  }
  
  // create new tweet
  function tweet(string tweetString) returns (int result) {
    if (bytes(tweetString).length > 256) {
      // limit to 256 bytes
      result = -3;
    } else {
      _tweets[_tweetCount] = tweetString;
      _tweetCount++;
      result = 0; // success
    }
    Tweet(msg.sender, tweetString, _tweetCount)
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

  function adminDeleteAccount() {
    if (isAdmin()) {
      // Deletes the contract and returns all funds to the owner's address
      suicide(_adminAddress); 
    }
  } 
}
