# Eth+Avax: Intermediate module-1
## FoodTraceability
This Solidity program is a simple smart contract for tracking the production data of agricultural products. It demonstrates the basic syntax and functionality of the Solidity programming language while using error handling mechanisms **(require, assert, and revert)** in real-life farming scenarios. The purpose of this contract is to serve as a practical example for recording and verifying product origins on the blockchain.
## Description
The FoodTraceability contract allows users to record and verify production data of agricultural products. It includes functions to record production details, verify product origins, check contract ownership, and demonstrate error handling using Solidity's require, assert, and revert statements
## Getting Started
### Executing Program
1. To **run this program**, I used Remix, an online Solidity IDE. To get started, go to the Remix website at [Remix Ethereum](https://remix.ethereum.org/).
2. **Create a New File:**
 * Click on the "+" icon in the left-hand sidebar.
 * Save the file with a .sol extension (e.g.,FoodTraceability.sol).
3.  **Copy and Paste the Code**: Copy the following code and paste it into the newly created file:

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodTraceability {

    struct ProductionData {
        string farmID;
        string productionDate;
        string productionDetails;
        bool exists;
    }

    mapping(string => ProductionData) public productionRecords;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function recordProductionData(
        string memory productID,
        string memory farmID,
        string memory productionDate,
        string memory productionDetails
    ) public {
        require(!productionRecords[productID].exists, "Production data already recorded for this product");

        productionRecords[productID] = ProductionData(farmID, productionDate, productionDetails, true);
    }

    function verifyProductOrigin(string memory productID) public view returns (string memory) {
        require(productionRecords[productID].exists, "Production data not found for this product");

        ProductionData memory data = productionRecords[productID];
        return string(abi.encodePacked("Farm ID: ", data.farmID, ", Production Date: ", data.productionDate));
    }

    function checkOwnership() public view {
        assert(owner == msg.sender); 
    }

    function triggerRevert() public pure {
        revert("This function always reverts"); 
    }
}

```
### Compile the Code
* Click on the "Solidity Compiler" tab in the left-hand sidebar.
* Make sure the "Compiler" option is set to "0.8.0" (or another compatible version).
* Click on the "Compile ErrorHandling.sol" button or use the shortcut key (Ctrl+s).
### Deploy the Contract
* Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
* Select the "FoodTraceability" contract from the dropdown menu.
* Click on the "Deploy" button.
### Interact with the Contract
* **Record Production Data:** Call the recordProductionData function with parameters like productID, farmID, productionDate, and productionDetails.
* **Verify Product Origin:** Call the verifyProductOrigin function with the productID to get the origin details.
* **Check Ownership:**Call the checkOwnership function to ensure only the contract owner can access this function.
* **Trigger Revert:**  Call the triggerRevert function to demonstrate the revert statement.
## Author
Anupreet Kaur

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
