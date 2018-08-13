pragma solidity ^0.4.23;

contract New {
  
   string storedData;
    
    function set(string data) public {
        storedData = data;
    }

    function get() constant returns (string) {
        return storedData;
    }
}