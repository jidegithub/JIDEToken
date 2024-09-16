// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JEToken is ERC20 {
	address public owner;
	string public constant token_name = 'Jide Ethereum Token';
  string public constant token_symbol = 'JET';
  uint8 private _decimals;

	constructor(uint256 initialSupply, uint8 decimals_) ERC20(token_name, token_symbol) {
		owner = msg.sender;
		_decimals = decimals_;
		// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/6edb6dd1ca43d05a762d84c688116b3327f5e490/contracts/token/ERC20/ERC20.sol#L251-L261
    // increases `msg.sender`'s balance, total supply, and emits the `Transfer` event
		// _mint(msg.sender, initialSupply* (10 ** uint256(_decimals)));
		_mint(msg.sender, initialSupply);
	}

	function decimals() public view virtual override returns (uint8) {
    return _decimals;
  }

	modifier onlyOwner() {
    // if (msg.sender == owner) _;
		require(msg.sender == owner, "Only the owner can mint tokens");
		_;
  }

	function mint(address to, uint256 amount) public onlyOwner {
		_mint(to, amount * (10 ** uint256(_decimals)));
	}

	function burn(uint256 amount) public {
		_burn(msg.sender, amount);
	}
}


// Explanation:
// ERC20: The contract imports the ERC-20 implementation from OpenZeppelin.
// owner: The address that deploys the contract becomes the owner.
// _mint: Initially mints tokens to the owner on deployment and allows the owner to mint additional tokens.
// burn: Any token holder can burn their tokens if needed.
