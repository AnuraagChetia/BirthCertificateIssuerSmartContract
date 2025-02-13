// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/// @title Birth Certificate Issuer Contract
/// @author Anuraag Chetiaa
/// @notice This contract issues a birth certificate to a person on birth to their wallet.
/// @dev To be wrote

contract BirthCertificate {
    /** ERRORS */
    error BirthCertificate_NOT_OWNER();
    error BirthCertificate_IssuerAleadryAdded();
    error BirthCertificate_ApproverAleadryAdded();

    /** EVENTS */
    event ApproverAdded(address indexed approver);
    event IssuerAdded(address indexed issuer);

    modifier onlyOwner() {
        if (msg.sender != i_owner) revert BirthCertificate_NOT_OWNER();
        _;
    }

    modifier onlyIssuer() {
        if (msg.sender != i_owner) revert BirthCertificate_NOT_OWNER();
        _;
    }

    address private immutable i_owner;
    // birth certificate NFT is to be created ( non transferable)
    // birth certificate issuer - hopitals
    mapping(address => bool) s_isIssuer;
    address[] s_issuers;
    // birth certificate approver - doctors
    mapping(address => bool) s_isApprover;
    address[] s_approvers;
    // contract owner - govt ( require multi sig to perform contract level function)

    constructor() {
        i_owner = msg.sender;
    }

    function createsBirthCertificate() external {}

    function addIssuer(address issuer) public onlyOwner {
        // check if issuer is already added
        if (s_isIssuer[issuer]) revert BirthCertificate_IssuerAleadryAdded();

        // add isssuer
        s_issuers.push(issuer);
        s_isIssuer[issuer] = true;

        //Emit event
        emit IssuerAdded(issuer);
    }

    function addApprover(address approver) public onlyOwner {
        // check if approver is already added
        if (s_isApprover[approver])
            revert BirthCertificate_ApproverAleadryAdded();

        // add approver
        s_approvers.push(approver);
        s_isApprover[approver] = true;

        //Emit event
        emit ApproverAdded(approver);
    }

    /** GETTER FUNCTIONS */

    function getOwner() external view returns (address) {
        return i_owner;
    }

    function getIssuers() external view returns (address[] memory) {
        return s_issuers;
    }

    function getApprovers() external view returns (address[] memory) {
        return s_approvers;
    }
}
