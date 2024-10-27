pragma solidity ^0.8.0;

contract ArweaveUploader {
    function upload_to_arweave(string memory dataString) public view returns (bytes memory) {
        // Convert the string parameter to bytes
        bytes memory data = abi.encodePacked(dataString);

        // pc address: 0x0000000000000000000000000000000000000017
        (bool success, bytes memory result) = address(0x17).staticcall(data);

        return result;
    }
}