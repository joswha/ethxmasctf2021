// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CaramelPool.sol";

/** 
  @title Setup for CaramelPool
  @author bobi @ X-MASCTF2021
 */
contract Setup {
    CaramelPool public caramelPool;

    constructor() { 
        
        address[] memory _depositors = new address[](10);
        _depositors[0] = 0x0136439830E1AbE0296b764691eB3fC296D145BF;
        _depositors[1] = 0x122E53F0444aC267371a0cf63d15cd782D8BB1c6;
        _depositors[2] = 0x00000000219ab540356cBB839Cbe05303d7705Fa;
        _depositors[3] = 0x4452552736041BCC3FE0F35647e56F2C4fdf956E;
        _depositors[4] = 0x0001E0515Bc0B5c2df1abC2842b42b29994f44d0;
        _depositors[5] = 0x97eebf4908c5C08EB09196579fC6451585D1b9A6;
        _depositors[6] = 0x1352CB6CCeC784dD765AC55F0413cadFA4946Cfd;
        _depositors[7] = 0x14db6558F0dfcD940dAe566C20F694D2F0454Ca8;
        _depositors[8] = 0x13182312eED5A75D62e45B726B63639b6a8F25bc;
        _depositors[9] = 0x1337CEE91653179667C33AffDBC28264c50C40b0;

        caramelPool = new CaramelPool(_depositors);
    }

    function isSolved() public view returns (bool) {
        return (address(caramelPool.caramelShogun()) != 0x0000000000000000000000000000000000000013);
    }

}