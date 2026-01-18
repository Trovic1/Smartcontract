// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract VendingMachine{
    mapping (address => uint) public cupcakeBalances;
    error NotenoughMoney(uint sent, uint required);

    function buycupcake() public payable{

        if (msg.value < 0.1 ether){
          revert NotenoughMoney(msg.value, 0.1 ether);
        }
         cupcakeBalances[msg.sender] += 1;
    }
}