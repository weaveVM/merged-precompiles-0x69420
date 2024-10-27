// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// THIS CODE IS LIT 🌿🔥

contract MergedPrecompiles0x69420 {
    function read_from_arweave(string memory txIdOrGatewayAndTxId) public view returns (bytes memory) {
        bytes memory data = abi.encodePacked(txIdOrGatewayAndTxId);
        (bool success, bytes memory result) = address(0x18).staticcall(data);
        require(success, "ArweaveReader: read operation failed");
        return result;
    }

    function upload_to_arweave(string memory dataString) public view returns (bytes memory) {
        bytes memory data = abi.encodePacked(dataString);
        (bool success, bytes memory result) = address(0x17).staticcall(data);
        require(success, "ArweaveUploader: upload operation failed");
        return result;
    }
    
}

