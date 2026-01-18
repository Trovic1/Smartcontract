// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;
contract Logger{
    event Log(address sender, uint amount); // event to log messages

    function logDeposit( address _sender, uint _amount) public virtual {
        emit Log(_sender, _amount);
    }
}

contract Wallet is Logger{
    receive() external payable {
        logDeposit(msg.sender, msg.value);
     }

     function logDeposit(address _sender, uint _amount) public override {
        require(_amount > 0, "Amount must be greater than 0");
        emit Log(_sender, _amount);
}

}