const JEToken = artifacts.require("JEToken");
const JETFaucet = artifacts.require("JETFaucet");

module.exports = async function(deployer) {
  // Adjust supply as needed
  const initialSupply = 2000;
  const decimals = 3; // Custom decimal places

  // Get the owner account from web3.eth.getAccounts()
  const accountsList = await web3.eth.getAccounts();
  const owner = accountsList[0]; // First account is typically used as the owner

  await deployer.deploy(JEToken, initialSupply, decimals);
  // console.log("Owner address:", owner);
  
  // Then deploy JETFaucet and pass the address of JEToken and the
  // address of the owner of all the JET who will approve JETFaucet
  // Then deploy JETFaucet and pass the address of JEToken and the
  // address of the owner of all the JET who will approve JETFaucet
  await deployer.deploy(JETFaucet, JEToken.address, owner);
};