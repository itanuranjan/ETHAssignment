// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    string public tokenName = "META";
    string public tokenAbbrv = "MTA";
    uint256 public totalSupply = 0;
    mapping(address => uint256) public balances;

    function mint(address recipient, uint256 value) public {
        require(value > 0, "Value must be greater than 0");
        totalSupply += value;
        balances[recipient] += value;
    }

    function burn(uint256 value) public {
        require(balances[msg.sender] >= value, "Insufficient balance");
        require(value > 0, "Value must be greater than 0");
        totalSupply -= value;
        balances[msg.sender] -= value;
    }
}
