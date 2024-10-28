// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/MergedPrecompiles0x69420.sol";

contract MergedPrecompiles0x69420Test is Test {
    MergedPrecompiles0x69420 public precompile;
    
    // Events we want to test
    event UploadAttempted(string data, bool success);
    event UploadError(string reason);
    event ReadAttempted(string txId, bool success);
    event ReadError(string reason);

    function setUp() public {
        precompile = new MergedPrecompiles0x69420();
    }

    function testReadFromArweave() public {
        // Mock the precompile call
        vm.mockCall(
            address(0x18),
            abi.encodePacked("test_tx_id"),
            abi.encodePacked("mocked_result")
        );
        
        bytes memory result = precompile.read_from_arweave("test_tx_id");
        assertEq(result, "mocked_result");
    }

    function testReadFromArweaveFailure() public {
        // Mock a failed precompile call
        vm.mockCallRevert(
            address(0x18),
            abi.encodePacked("invalid_tx_id"),
            "Read operation failed"
        );
        
        vm.expectRevert("ArweaveReader: read operation failed");
        precompile.read_from_arweave("invalid_tx_id");
    }

    function testUploadToArweave() public {
        // Mock successful upload
        vm.mockCall(
            address(0x17),
            abi.encodePacked("test_data"),
            abi.encodePacked("mocked_tx_id")
        );
        
        // Expect the UploadAttempted event to be emitted
        vm.expectEmit(true, true, true, true);
        emit UploadAttempted("test_data", true);
        
        bytes memory result = precompile.upload_to_arweave("test_data");
        assertEq(result, "mocked_tx_id");
    }
}
