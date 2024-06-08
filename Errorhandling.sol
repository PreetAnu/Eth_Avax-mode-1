// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//implementation of the require(), assert(), and revert() functions 
contract ErrorHandling {

    address public owner;
    uint public value ;

    constructor() {
        owner = msg.sender;
    }

    function setValue(uint _value) public {
        require(_value > 0, "Value must be greater than zero");
        value = _value;
    }

    function checkOwner() public view {
        assert(owner != address(0));
    }

    function triggerRevert() public pure {
        revert("This function always reverts");
    }
}
