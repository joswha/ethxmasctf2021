pragma solidity ^0.6.0;

import "./Cookie.sol";

/** 
  @title Setup for Cookie
  @author bobi @ X-MASCTF2021
 */
contract Setup {
    Cookie public cookie;

    constructor() public{
        cookie = new Cookie('caracatitamort');
    }

    function isSolved() public view returns (bool) {
        return (address(cookie.owner()) != 0x0000000000000000000000000000000000000013);
    }
}
