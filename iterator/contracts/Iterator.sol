// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

/** 
  @title Iterator
  @author bobi @ X-MASCTF2021
 */
contract Iterator {
  
  mapping(address => uint256) public balances;

  function donate(address _to) external payable {
    balances[_to] += (msg.value);
  }

  function balanceOf(address _who) external view returns (uint256 balance) {
    return balances[_who];
  }

  function withdraw(uint256 _amount) external {

    if(balances[msg.sender] >= _amount) {

      (bool result,) = msg.sender.call.value(_amount)("");
      if(result) {
        _amount;
      }

      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}