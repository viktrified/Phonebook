// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Phonebook {
    // a phonebook contract for students in Blockfuselabs
    // contains a list of the names, addresses, and phone numbers of students in Blockfuselabs
    // you can add, remove and store names, addresses and phone numbers.
    // more like a spreadsheet

    mapping(address => string) public studentName;
    mapping(address => string) public studentAddress;
    mapping(address => string) public studentPhoneNumber;

    function addName(string memory _name) public {
        studentName[msg.sender] = _name;
    }

    function removeName() public {
        delete studentName[msg.sender];
    }

    function addAddress(string memory _address) public {
        studentAddress[msg.sender] = _address;
    }

    function removeAddress() public {
        delete studentAddress[msg.sender];
    }

    function addPhoneNumber(string memory _phoneNumber) public {
        studentPhoneNumber[msg.sender] = _phoneNumber;
    }

    function removePhoneNumber() public {
        delete studentPhoneNumber[msg.sender];
    }
}
