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

    // Function to record production data
    function recordProductionData(
        string memory productID,
        string memory farmID,
        string memory productionDate,
        string memory productionDetails
    ) public {
        require(
            !productionRecords[productID].exists,
            "Production data already recorded for this product"
        );

        productionRecords[productID] = ProductionData(
            farmID, productionDate, productionDetails, true );
    }

    // Function to verify product origin
    function verifyProductOrigin(string memory productID)
        public view returns (string memory) {
        require(
            productionRecords[productID].exists,
            "Production data not found for this product"
        );

        ProductionData memory data = productionRecords[productID];
        return string(
                abi.encodePacked(
                    "Farm ID: ", data.farmID, ", Production Date: ", data.productionDate
                )
            );
    }

    // Function to check contract ownership
    function checkOwnership() public view {
        assert(owner == msg.sender); 
    }

    // Function to trigger a revert
    function triggerRevert() public pure {
        revert("This function always reverts"); 
    }
}
