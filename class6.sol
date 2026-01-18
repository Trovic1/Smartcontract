// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
contract VIPLounge{
    address private   owner;
    uint256 entryfee;

    constructor(uint256 _entryfee) {
        owner = msg.sender;
        entryfee = _entryfee;
    }

    modifier Onlyowner() {
        require(msg.sender == owner, "You are not owner");
        _;
    }

    function changeFee(uint _newFee) public Onlyowner() {
        entryfee = _newFee;
    }
}