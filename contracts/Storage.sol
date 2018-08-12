pragma solidity ^0.4.21;


contract Storage {

    mapping (string => string) private _store;

    function addData(string key, string value) public {
        require(bytes(_store[key]).length == 0);
        _store[key] = value;
    }

    function removeData(string key) public returns (string) {
        require(bytes(_store[key]).length != 0);
        string prev = _store[key];
        delete _store[key];
        return prev;
    }

    function changeData(string key, string newValue) public {
        require(bytes(_store[key]).length != 0);
        _store[key] = newValue;
    }

}