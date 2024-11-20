// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {SimpleStorage} from "Contracts/SimpleStorage.sol";

contract AddTwentyStorage is SimpleStorage {
// overrides 
    function store(uint256 _newNumber) public override {
        favoriteNumber = _newNumber + 20;
    }

}