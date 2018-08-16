pragma solidity 0.4.21;

import "./Storage.sol";


contract InfoManager {

    Storage private _dataStore;

    uint private _lastAdded;

    function InfoManager(Storage dataStore) public {
        _dataStore = dataStore;
    }

    function addData(string key, string value) public returns (bool success) {
        require((now - 1 days) > _lastAdded);
        _dataStore.addData(key, value);
        return true;
    }

}