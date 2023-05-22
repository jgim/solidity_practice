// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract ExampleContract {
    uint public value;
    uint public c;
    uint public d;

    function calculate2(uint a, uint b) public view returns (uint) {
        d = a + b;
        return d;
    }

    function calculate1(uint a, uint b) public {
        c = calculate2(a, b);
    }
}