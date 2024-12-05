// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe {
    function fund() public payable  {
// kullanicilarin para gonderebilmesine izin ver
// minimum tutar belirle
// Bir sayinin ussunu belirtirken ** kullaniriz.


    require(msg.value > 1e18, "didn't send enough ETH");   // 1e18 = 1 ETH = = 1000000000000000000 = 1 * 10 ** 18

    }
 //   function withdraw() public {}


}