# Eth+Avax:Intermediate: module-1
This Solidity program demonstrates the use of require(), assert(), and revert() functions for error handling in smart contracts. The purpose of this program is to serve as a practical example for those who are learning about error handling in Solidity.
## Description
This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract includes functions that illustrate the usage of require(), assert(), and revert() statements to handle errors and validate conditions within smart contracts. This program serves as an educational tool for understanding basic error handling in Solidity programming.
## Getting Started
### Executing Program
1. To **run this program**, I used Remix, an online Solidity IDE. To get started, go to the Remix website at [Remix Ethereum](https://remix.ethereum.org/).
2. **Create a New File:**
 * Click on the "+" icon in the left-hand sidebar.
 * Save the file with a .sol extension (e.g.,ErrorHandling.sol).
3.  **Copy and Paste the Code**: Copy the following code and paste it into the newly created file:

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    address public owner;
    uint public value;

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
```
### Compile the Code
* Click on the "Solidity Compiler" tab in the left-hand sidebar.
* Make sure the "Compiler" option is set to "0.8.9" (or another compatible version).
* Click on the "Compile ErrorHandling.sol" button or use the shortcut key (Ctrl+s).
### Deploy the Contract
* Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
* Select the "ErrorHandling" contract from the dropdown menu.
* Click on the "Deploy" button.
### Interact with the Contract
* **setValue(uint _value):** This function demonstrates the use of the require statement by ensuring the provided value is greater than zero before setting it. Initially, the value is 0, but you can change it to a value greater than zero using this function.
* **checkOwner():** This function demonstrates the use of the assert statement by verifying that the owner's address is not zero.
* **triggerRevert():** This function demonstrates the use of the revert statement by forcefully reverting the transaction with a custom error message.
## Author
Anupreet Kaur

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
