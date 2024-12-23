// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {priceConverter} from "./priceConverter.sol";

contract FundMe {

    using priceConverter for uint256;
    
    uint256 public minimumUsd = 50e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable  {

        // kullanicilarin para gonderebilmesine izin ver
        // minimum tutar belirle
        // Bir sayinin ussunu belirtirken ** kullaniriz.

     require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");   // 1e18 = 1 ETH = = 1000000000000000000 = 1 * 10 ** 18
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }
        // function withdraw() public {}

 

}