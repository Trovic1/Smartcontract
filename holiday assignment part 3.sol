// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
contract AdvancedSyntax{
    address public owner;
    
    event Resolutioncreated(address indexed user, string content);
    constructor(){
        owner = msg.sender;
    }  

    modifier Onlyowner(){
    require (msg.sender ==owner , "You are not the owner");
    _;
    }

    function addResolution(string calldata _content) public payable {
        require(msg.value == 0.01 ether, "Pay 0.01 ETH");
        require(bytes(_content).length > 0, "Empty Resolution");

        
         emit Resolutioncreated(msg.sender, _content);
    }
}