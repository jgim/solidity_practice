// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract ExampleContract {
    uint public value;
    uint public c;
    function calculate2(uint a, uint b) public pure returns (uint) {
        uint d = a + b;
        return d;
    }

    function calculate1(uint a, uint b) public {
        c = calculate2(a, b);
    }
}
