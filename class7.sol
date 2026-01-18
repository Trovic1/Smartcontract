// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
contract Chatroom{

    address  owner;
    event MessageSent(address indexed user, string message);
    
    function sendMessage(string memory _message) public {
    emit  MessageSent(msg.sender, _message);
    }
}