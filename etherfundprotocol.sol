// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Etherfund{
    address public owner;
    struct Campaign{
        address payable creator;
        uint256 goal;
        uint256 pledged;
        bool isClaimed;
    }

    Campaign[] public campaigns;
    mapping(uint256=>  mapping(address=>uint256)) public donations;

    modifier Onlycreator(uint256 _id){
        require(_id < campaigns.length, "Invalid Campaign");
        require(msg.sender == campaigns[_id].creator, "Not campaign creator");
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    function createCampaigns(uint256 _goal) external{

        require(_goal > 0, "Goal must be greater than 0");

     campaigns.push(Campaign({creator : payable(msg.sender)
     , goal : _goal
     , pledged : 0
     , isClaimed : false
        }));
    }

    function donate ( uint256 _id) external payable{
         require(_id < campaigns.length, "Invalid campaign ID");
         require(msg.value > 0, "Donation MUST be GREATER thsn zero" );

         Campaign storage campaign = campaigns[_id];
         campaign.pledged += msg.value;
         donations[_id][msg.sender] += msg.value;


    }

    function withdrawFunds(uint256 _id) public Onlycreator(_id) {
        Campaign storage campaign = campaigns[_id];
        require(campaign.pledged >= campaign.goal, "Goal not reached");
        require(!campaign.isClaimed, "Funds already claimed");

        campaign.isClaimed = true;

       (bool success, ) = campaign.creator.call{value: campaign.pledged}("");
        require(success, "Transfer failed");

    }
}