// SPDX-License-Identifier:MIT

pragma solidity ^0.8.17;

contract Counter{
    uint public count;

    function incerement() external {
        count += 1;
    }
}


//interface -> blueprint -> taslak
/*Bir Interface, diger sözlesmeler tarafindan cagirabilecek fonksiyon adlarini
,parametrelerini ve genel türlerini icerir,*/

interface ICounter{ // islevleri yok , sadece contracti özetliyor.
    function count() external view returns(uint);
    function incerement() external;

}

contract ExampleCounter{
    ICounter public counter;//interface tipindeki degisken

    constructor(address _counterContractAddress){ // kullanici counter contractinin adresini girmeli
        counter = ICounter(_counterContractAddress);
    }

    function incerementFunc() external returns(uint){
        counter.incerement(); // en yukaradaki fonksiyonu aldik
        uint currentCount = counter.count();//en yukardaki count sayisini aldik
        
        return currentCount;
    }
}