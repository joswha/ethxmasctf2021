pragma solidity ^0.6.0;

/** 
  @title Cookie
  @author bobi @ X-MASCTF2021
 */
contract Cookie {
    string private password;
    address public owner;

    constructor(string memory _password) public {
        password = _password;
        owner = 0x0000000000000000000000000000000000000013;
    }

    function unlockCookieBox(string memory _password) public {
        if (keccak256(abi.encodePacked(password)) == keccak256(abi.encodePacked(_password))) {
            owner = msg.sender;
        }
    }
}