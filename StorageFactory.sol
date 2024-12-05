// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.2;
// StorageFactory birden fazla SimpleStorage contract deploy etmek icin olusturulmus bir contract.

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;
// SimpleStorage.sol kontratini iceri aktarmak icin import kullaniyorum.
// import kullanirken her zaman sol dosyasindaki spesifik kontrati belirt. 
// Cost Efficiency acisindan import {contrat ismi} from "kontratlar.sol"; seklinde kullan.

import {SimpleStorage} from "./Contracts/SimpleStorage.sol";

contract StorageFactory {
// uint256 public favoritenumber
// type     visibility  name 
     SimpleStorage[] public ListOfSimpleStorageContracts;
   // address[] public ListOfSimpleStorageAddresses;
// Bu satırda, sözleşme içinde simpleStorage adında bir durum değişkeni (state variable) tanımlanmış. 
// Türü ise SimpleStorage. public belirteci sayesinde bu değişkene sözleşme dışından da erişilebilir.
// Ancak burada simpleStorage henüz bir kontrata işaret etmiyor; sadece bu değişkenin hangi türde olduğu belirtiliyor.
// Değişkene bir değer (örneğin bir kontrat adresi) atanmadan kullanılamaz.

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        ListOfSimpleStorageContracts.push(newSimpleStorageContract);
    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // kontrat ile iletisime gecmek icin address ve ABI (Application Binary Interface) gerekir.
       // SimpleStorage mySimpleStorage = ListOfSimpleStorageContracts[_simpleStorageIndex];
        
       ListOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);

    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        return ListOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}