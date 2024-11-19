// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity  0.8.24;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {
    uint256 public favoriteNumber;
 // dinamik array
 struct Person {
    uint256 favoriteNumber;
    string name;
 }
 Person[] public listOfPeople;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
// view, pure 
// calldata ve memory gecici depolama icin
// memory ve calldatanin farki memory degistirilebilir manipule edilebilir.
// storage kalici depolama ve modifiye edilebilir
// fonksiyon disinda kontrat icinde bir degisken tanimlarsaniz otomatik olarak storage da depolanir.
// array icin memory kelimesini koymaliyiz. buyuzden string memory yaziyoruz. Cunku string bir  array of bytes bytes ise memoryde depolanir.
// structs, mapping ve arrays memory keywordu gerektirir.
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    function addPerson (string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber,_name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}