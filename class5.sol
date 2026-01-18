// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
contract PiggyBank{
    uint256 private balance;
    function addmoney() external payable {
        balance += msg.value;
    }

    function CheckSavings () public view returns(uint256){
        return balance;
    }

    function weiToEither(uint256 _wei) private pure returns (uint256){
        return _wei/1e18;
    }
}