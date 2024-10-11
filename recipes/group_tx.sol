// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }

    function increase(uint data) public pure returns (uint) {
        return data+1;
    }
}

contract StorageChanges {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }

    function decrease(uint data) public pure returns (uint) {
        return data-1;
    }
}

contract Util {
    StorageChanges public storageChanges;
    SimpleStorage public simpleStorage;

    constructor() {
        storageChanges = new StorageChanges();
        simpleStorage = new SimpleStorage();
    }

    function group_tx(uint arg1, uint arg2) public view returns (uint, uint) {
        return (storageChanges.decrease(arg1), simpleStorage.increase(arg2));
    }
}