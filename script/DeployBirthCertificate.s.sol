// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";

import {BirthCertificate} from "../src/BirthCertificate.sol";

contract DeployBirthCertificate is Script {
    function run() public {
        deployBirthCertificate();
    }

    function deployBirthCertificate() public returns (BirthCertificate) {
        vm.startBroadcast();
        BirthCertificate birthCertificate = new BirthCertificate();
        vm.stopBroadcast();
        return birthCertificate;
    }
}
