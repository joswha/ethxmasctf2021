pragma solidity 0.8.0;

import "./Hello.sol";

/** 
  @title Setup for Hello World
  @author bobi @ X-MASCTF2021
 */
contract Setup {
    Hello public hello;

    constructor() {
        hello = new Hello();
    }

    function isSolved() public view returns (bool) {
        return hello.checked();
    }
}
