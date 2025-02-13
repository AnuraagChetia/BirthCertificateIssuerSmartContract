//SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;

import {Test} from "../lib/forge-std/src/Test.sol";
import {DeployBirthCertificate} from "../script/DeployBirthCertificate.s.sol";
import {BirthCertificate} from "../src/BirthCertificate.sol";

contract BirthCertificateTest is Test {
    BirthCertificate birthCertificate;

    address PLAYER = makeAddr("PLAYER");
    uint256 constant STARTING_PLAYER_BALANCE = 100 ether;

    function setUp() public {
        DeployBirthCertificate deployBirthCertificate = new DeployBirthCertificate();
        birthCertificate = deployBirthCertificate.deployBirthCertificate();
        vm.deal(PLAYER, STARTING_PLAYER_BALANCE);
    }

    function testOnlyOwnerCanAddApprover() public {
        //ARRANGE
        vm.prank(PLAYER);
        vm.expectRevert(BirthCertificate.BirthCertificate_NOT_OWNER.selector);
        // ACT / ASSERT
        birthCertificate.addApprover(msg.sender);
    }

    function testOnlyOwnerCanAddIssuer() public {
        //ARRANGE
        vm.prank(PLAYER);
        vm.expectRevert(BirthCertificate.BirthCertificate_NOT_OWNER.selector);
        // ACT / ASSERT
        birthCertificate.addIssuer(msg.sender);
    }

    function testOwnerCanAddApprover() public {}

    function testOwnerCanAddIssuer() public {}
}
