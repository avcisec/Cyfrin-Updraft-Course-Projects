// SPDX-License-Identifier: MIT
pragma solidity  0.8.24;
// StorageFactory birden fazla SimpleStorage contract deploy etmek icin olusturulmus bir contract.

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;
// SimpleStorage.sol kontratini iceri aktarmak icin import kullaniyorum.
// import kullanirken her zaman sol dosyasindaki spesifik kontrati belirt. 
// Cost Efficiency acisindan import {contrat ismi} from "kontratlar.sol"; seklinde kullan.

import {SimpleStorage, SimpleStorage2} from "./Contracts/SimpleStorage.sol";

contract StorageFactory{
// uint256 public favoritenumber
// type     visibility  name 
    SimpleStorage public simpleStorage;
// Bu satırda, sözleşme içinde simpleStorage adında bir durum değişkeni (state variable) tanımlanmış. 
// Türü ise SimpleStorage. public belirteci sayesinde bu değişkene sözleşme dışından da erişilebilir.
// Ancak burada simpleStorage henüz bir kontrata işaret etmiyor; sadece bu değişkenin hangi türde olduğu belirtiliyor.
// Değişkene bir değer (örneğin bir kontrat adresi) atanmadan kullanılamaz.
    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }

}