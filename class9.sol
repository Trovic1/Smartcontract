// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract SafeMath{
   
    function divide(uint a, uint b) public pure returns (uint result) {
        require(b != 0, "division by zero");
         result = a/b;
      
    
        assert(result <= a);
          return result;
    }
}