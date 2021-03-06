// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/** 
  @title CaramelPool
  @author bobi @ X-MASCTF2021
 */
contract CaramelPool {

    mapping (address => uint256) public balanceOf;
    uint256 public withdrawAmount = 0;

    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (uint256(10) * decimals);

    address public caramelShogun = 0x0000000000000000000000000000000000000013;

    constructor (address[] memory _depositors) {
        for ( uint i = 0; i < _depositors.length; i++ ) { 
            uint256 _amount = 100000 * (uint256(10) * decimals);
            balanceOf[_depositors[i]] = _amount;
        }
    }

    function isContract(address _addr) private view returns (bool is_contract) {
        uint length;
        assembly {
            length := extcodesize(_addr)
        }
        return length > 0;
    }

    function transfer(address _from, address _to) public {
        require(msg.sender != _to, "Cannot send to yourself!");
        require(msg.sender == _from, "Can only send from yourself!");

        uint256 _balance = balanceOf[_from];
        require(_balance > 0);

        balanceOf[_from] = 0;
        balanceOf[_to] += _balance;
    }

    function fundPool(address _from) public {
        require(!isContract(msg.sender), "No contractz allowed.");

        uint256 _balance = balanceOf[_from];
        balanceOf[_from] = 0;
        withdrawAmount += _balance; 
    }

    function withdrawFromPool() public {
        require(!isContract(msg.sender), "You can't withdraw from the pool");
        require(withdrawAmount <= totalSupply, "Don't try to hack the pool");

        balanceOf[msg.sender] = withdrawAmount;
        withdrawAmount = 0;
    }

    function becomeCaramelShogun() public {
        require(balanceOf[msg.sender] >= totalSupply, "You don't have enough tokens to become the Caramel Shogun");

        caramelShogun = msg.sender;
    }
}
