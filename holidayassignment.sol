// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Shop{

    struct Item{
        uint256 price;
        uint256 quantity;
        string name;
    }

    Item[] public items;
    function additem(uint256 _price, uint256 _quantity, string memory _name) public{

        items.push(Item(_price, _quantity, _name));
    }

    function buyitem(uint _Index, uint256 _quantity) public payable{
        Item storage item = items[_Index];
        require(item.quantity >=_quantity, "Out of Stock");
        require(msg.value == item.price * _quantity, "Incorrect Amount");
        item.quantity -= _quantity;
    }

    function TotalItems() public view returns ( uint256){
        return items.length;
}
}