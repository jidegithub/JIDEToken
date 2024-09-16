const JEToken = artifacts.require("JEToken");

module.exports = function(deployer) {
  // Adjust supply as needed
  // const initialSupply = web3.utils.toWei('1000', 'ether');
  const initialSupply = 2000;
  const decimals = 3; // Custom decimal places
  // Deploy the JIDEToken contract as our only task
  deployer.deploy(JEToken, initialSupply, decimals);
};

// In this case, it converts 1000 Ether worth of tokens to Wei, which is 1000 * 10^18. 
// This is helpful because the token standard typically deals in large units (like Wei in Ether) due to the decimals.
// toWei('1000', 'ether') means that the 1000 tokens being minted are equivalent to 1000 * 10^18 base units (smallest denomination of the token), 
// assuming decimals = 18.

// This defines the decimal places that the token will use. Most ERC-20 tokens, including Ether, have 18 decimal places. 
// By setting decimals = 18, it means that the token can be divided down to 18 decimal places, making the token highly divisible.
// If you were to set this to 8, for example, the token would have fewer subdivisions (like Bitcoin).


// 1000×10^18 is equal to 1,000,000,000,000,000,000,000 (1 quintillion). 
// This is the base unit that will be used for the token supply when you deploy the contract with 18 decimal places.