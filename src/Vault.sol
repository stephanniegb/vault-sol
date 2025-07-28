// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./lib.sol";

/// @title VaultBase - Base contract storing shared vault logic
contract VaultBase {
    using SimpleMath for uint256;

    mapping(address => uint256) internal balances;

    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);
}

/// @title VaultManager - Manages deposits and withdrawals
contract VaultManager is VaultBase {
    function deposit() external payable {
        require(msg.value > 0, "Cannot deposit 0 ETH");
        balances[msg.sender] = SimpleMath.add(balances[msg.sender], msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdraw amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] = SimpleMath.sub(balances[msg.sender], amount);
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}