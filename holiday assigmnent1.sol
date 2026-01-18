// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherResolutions {

    address public owner;

    struct Resolution {
        string content;    
        bool isCompleted;    
        uint256 timestamp;   
    }

    mapping(address => Resolution[]) public resolutions;

    constructor() {
        owner = msg.sender;
    }

    function addresolution(string calldata _content) public {
        Resolution memory Newresolution = Resolution({
            content: _content,
            isCompleted: false,
            timestamp: block.timestamp
        });
        resolutions[msg.sender].push(Newresolution);
    }

    function getResolution(address _user, uint256 _index) public view returns (string memory, bool, uint256){
        Resolution storage res = resolutions[_user][_index];
        return (res.content, res.isCompleted, res.timestamp);
    }

    function markcompleted(uint256 _index) public {
        Resolution storage res = resolutions[msg.sender][_index];
        res.isCompleted = true;
    }
}