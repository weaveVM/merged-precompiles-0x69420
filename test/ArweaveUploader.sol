// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/ArweaveUploader.sol";

contract ArweaveUploaderTest is Test {
    ArweaveUploader public arweaveUploader;

    function setUp() public {
        arweaveUploader = new ArweaveUploader();
    }

    function testUploadToArweave() public {
        bytes memory result = arweaveUploader.upload_to_arweave("test data");
        assertEq(result.length, 0, "Result should be empty bytes");
    }
}