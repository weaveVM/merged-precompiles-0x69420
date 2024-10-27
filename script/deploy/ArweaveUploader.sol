// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/ArweaveUploader.sol";

contract ArweaveUploaderScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);
        
        vm.startBroadcast(deployerPrivateKey);

        ArweaveUploader arweaveUploader = new ArweaveUploader();
        
        console.log("ArweaveUploader deployed at:", address(arweaveUploader));
        console.log("Deployed by:", deployer);

        vm.stopBroadcast();
    }
}
