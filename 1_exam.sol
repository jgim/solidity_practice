// SPDX-License-Identifier: MIT
pragma solidity > 0.7.0 <= 0.9.0;

contract exam{
    uint public var1 = 1;
    uint var2 = 2;
    uint internal var3 = 3;

    function funExt() external pure returns(uint){
        return 2;
    }

    function fun_public() private view returns(uint, uint, uint){
        return (var1, var2, var3);
    }
}