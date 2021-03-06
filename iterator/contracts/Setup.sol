pragma solidity ^0.6.0;

import "./Iterator.sol";

/** 
  @title Setup for Iterator
  @author bobi @ X-MASCTF2021
 */
contract Setup {
    Iterator public iterator;

    constructor() public payable {
        iterator = new Iterator();
        // fund iterator with some eth.
        address(iterator).transfer(30 ether);
    }

    function isSolved() public view returns (bool) {
        return address(iterator).balance == 0;
    }
}
