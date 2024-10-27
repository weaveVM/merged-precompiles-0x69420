// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Precompile0x69420.sol";

contract Precompile0x69420Test is Test {
    Precompile0x69420 public precompile;

    function setUp() public {
        precompile = new Precompile0x69420();
    }

    function testReadFromArweave() public {
        vm.mockCall(
            address(0x18),
            abi.encodePacked("test_tx_id"),
            abi.encodePacked("mocked_result")
        );
        bytes memory result = precompile.read_from_arweave("test_tx_id");
        assertEq(result, "mocked_result");
    }

    function testUploadToArweave() public {
        vm.mockCall(
            address(0x17),
            abi.encodePacked("test_data"),
            abi.encodePacked("mocked_tx_id")
        );
        bytes memory result = precompile.upload_to_arweave("test_data");
        assertEq(result, "mocked_tx_id");
    }
}