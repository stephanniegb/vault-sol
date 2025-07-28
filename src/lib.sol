// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SimpleMath - A library for safe math operations
library SimpleMath {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        require(b <= a, "Underflow!");
        return a - b;
    }
} 