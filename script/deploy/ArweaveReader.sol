// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/ArweaveReader.sol";

contract ArweaveReaderScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);
        
        vm.startBroadcast(deployerPrivateKey);

        ArweaveReader arweaveReader = new ArweaveReader();
        
        console.log("ArweaveReader deployed at:", address(arweaveReader));
        console.log("Deployed by:", deployer);

        vm.stopBroadcast();
    }
}
