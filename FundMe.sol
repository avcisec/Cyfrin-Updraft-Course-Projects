// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {priceConverter} from "./priceConverter.sol";
//810.110 gas
//constant belirleyince 790.152 gas 
contract FundMe {
// MIMIMUM_USD cagirildiginda 351 gas
    using priceConverter for uint256;
    // constant sabit degerler icin gas efficient cozum. 
    // isimlendirmeyi buyuk harflerle yapmaliyiz.
    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // address veri tipinde owner isminde degisken tanimliyoruz.
    address public owner;
    // constructor kontrat gonderildikten hemen sonra icerigindeki kosulu veya fonksiyonu yerine getirir.
    constructor() {
        // msg.sender owner olarak tanimlandi.
        owner = msg.sender;
    }

    function fund() public payable  {

        // kullanicilarin para gonderebilmesine izin ver
        // minimum tutar belirle
        // Bir sayinin ussunu belirtirken ** kullaniriz.

     require(msg.value.getConversionRate() >= MINIMUM_USD, "didn't send enough ETH");   // 1e18 = 1 ETH = = 1000000000000000000 = 1 * 10 ** 18
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
    // addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    // addressToAmountFunded[msg.sender] += msg.value;
    // yukaridaki 2 satir ayni anlama geliyor
    }
        function withdraw() public only0wner {
            // her fonksiyon icin tek tek asagidaki kosulu eklemek yerine solidity modifiers kullanacagiz.
            // require(msg.sender == owner, "only contract deployer can withdraw.");
            //for loop
            // for (/* starting index, ending index, step amount */)
            //funderIndex = funderIndex +1  yerine funderIndex++ kullanabiliriz. For dongusune 1 ekleyerek devam eder.
            for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
                address funder = funders[funderIndex];
                addressToAmountFunded[funder] = 0;
            }
            funders = new address[](0);
            // reset the array
            // withdraw the funds

            // transfer
            // payable(msg.sender) = payable address
            // payable(msg.sender).transfer(address(this).balance);
             // send
             //  bool sendSuccess = payable(msg.sender).send(address(this).balance);
             // require(sendSuccess, "Send Transaction failed");

             // call
            // bytes memory dataReturned 2 adet veri doner ancak dataReturned bizi simdilik ilgilendirmiyor. sadece callSuccess bool donecek.
                // Bircok senaryoda native token veya eth gondermenin etkili ve guclu olan yontemi asagidaki call fonksiyonu ile gondermektir.
            /*------------------------------------------------------------------------------------ */
            (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
            require(callSuccess, "call failed");
            /* ------------------------------------------------------------------------------------- */

        }
        // modifier tanimladik. Daha sonra ihtiyacimiz olan her fonksiyona keyword olarak only0wner ekleyecegiz. _; require oncesinde eklenirse, 
        // only0wner kosulunu ekledigimiz fonksiyon once calisir ve daha sonra kosul tanimlanir.
        modifier only0wner() {
            require(msg.sender == owner, "you are not the owner");
            _;
        }

 

}