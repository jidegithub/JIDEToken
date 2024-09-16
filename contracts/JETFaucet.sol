// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JETFaucet {
  ERC20 public JEToken;
  address public JETOwner;

// JETFaucet constructor, provide the address of JEToken contract and
// the owner address we will be approved to transferFrom
  constructor(address _JEToken, address _JETOwner) {
  // Initialize the JIDEToken from the address provided
    JEToken = ERC20(_JEToken);
    JETOwner = _JETOwner;
  }

	// Give out ether to anyone who asks
	function withdraw(uint withdraw_amount) public {

    // Limit withdrawal amount to 10 JET
    require(withdraw_amount <= 1000);

    // Use the transferFrom function of JEToken
    JEToken.transferFrom(JETOwner, msg.sender, withdraw_amount);
  }

	// Reject any incoming amount of Ether
  receive() external payable { revert();}
}