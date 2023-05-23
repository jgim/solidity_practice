// SPDX-License-Identifier: MIT
pragma solidity > 0.7.0 <= 0.9.0;

contract FunctionPractice{
    uint public a = 3;
    uint public b = 0;
    uint public c = 0;
   
    function test(uint inputValue) internal returns(uint, uint){
        a += inputValue;
        return(inputValue, a);
    }

    function test2(uint inputValue) public {
        (b,c) =  test(inputValue);
    }
}