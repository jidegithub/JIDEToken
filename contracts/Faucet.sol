// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Our first contract is a faucet!
contract Faucet {
	// Give out ether to anyone who asks
	function withdraw(uint withdraw_amount) public {

    // Limit withdrawal amount
    require(withdraw_amount <= 100000000000000000);

    // Send the amount to the address that requested it
    (bool success, ) = msg.sender.call{value: withdraw_amount}("");
    require(success, "Transfer failed.");
  }

	// Accept any incoming amount of Ether
  receive() external payable {}
}