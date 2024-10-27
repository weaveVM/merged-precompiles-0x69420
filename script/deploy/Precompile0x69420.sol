// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../../src/Precompile0x69420.sol";

contract Precompile0x69420Script is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);
        
        vm.startBroadcast(deployerPrivateKey);

        Precompile0x69420 precompile0x69420 = new Precompile0x69420();
        
        console.log("Precompile0x69420 deployed at:", address(precompile0x69420));
        console.log("Deployed by:", deployer);

        vm.stopBroadcast();
    }
}