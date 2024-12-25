// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract FallbackExample {
    // receive fonksiyonu kontrata dogrudan gelen ETH veya native tokeni alir ve icerisindeki kosulu yerine getirir. 
    // calldata icini bos birakip 0 eth gondersek bile ayni sonuc cikar.
    // calldata icerisine veri eklersek, solidity para veya token degil data gonderdigimizi anlar ve islemi geri cevirir.
    // cunku para degilde data kabul etmek icin fallback fonksiyonunu kullanmamiz gerekir. Receive() data icin degildir.
    // receive(), fallback() ve constructor() fonksiyonlari ozel fonksiyonlardir. function kelimesini kullanmayiz.
    uint256 public result;
    receive() external payable {
        result = 1;
    }

    fallback() external payable {
        result = 2;
    }
}