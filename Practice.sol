// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Phonebook {
    // a phonebook contract for students in Blockfuselabs
    // contains a list of the names and phone numbers of students in Blockfuselabs
    // you can add, remove and store names, addresses and phone numbers.
    // more like a spreadsheet

    struct PhoneNumbers {
        uint id;
        string name;
        string number;
    }

    uint public nextId;

    mapping(address => PhoneNumbers[]) public phonebook;

    event NumberAdded(uint id, string name, string number);

    function addPhoneNumber(string memory _name, string memory _number) public {
        //     for (uint i = 0; i < phonebook[msg.sender].length; i++) {
        //     require(
        //         !phonebook[msg.sender],
        //         "Number has already been recorded"
        //     );
        // }

        PhoneNumbers memory phonenumber = PhoneNumbers(
            nextId++,
            _name,
            _number
        );
        phonebook[msg.sender].push(phonenumber);

        emit NumberAdded(nextId, _name, _number);
    }

    // function getPhoneNumbers() public view returns (PhoneNumbers[] memory) {
    //     return phonebook[msg.sender];
    // }

    function getAllContacts() public view returns (PhoneNumbers[] memory) {
        return phonebook[msg.sender];
    }

    function getPhoneNumbers(
        uint _id
    ) public view returns (uint, string memory, string memory) {
        require(_id < phonebook[msg.sender].length, "Error: Contact not found");
        PhoneNumbers memory thePhoneNumbers = phonebook[msg.sender][_id];
        return (_id, thePhoneNumbers.name, thePhoneNumbers.number);
    }

    function deleteContact(uint _index) public {
        require(
            _index < phonebook[msg.sender].length,
            "Error: Contact does not exist."
        );
        phonebook[msg.sender][_index] = phonebook[msg.sender][
            phonebook[msg.sender].length - 1
        ];
        phonebook[msg.sender].pop();
    }

    function totalContacts() public view returns (uint) {
        return phonebook[msg.sender].length;
    
}
}