// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ArrayTest{
    uint256[] public testArray;
    function addArray(uint _value) public {
        testArray.push(_value);
    }

    function getArray(uint _index) public view returns(uint) {
        return testArray[_index];
    }

    function changeArray(uint _index, uint _value) public {
        testArray[_index] = _value;
    }

    function deleteArray() public {
        testArray.pop();
    }

    //실제로 배열이 지워지지 않고 초기화만 됨
    function deleteArray2(uint _index) public {
        delete testArray[_index];
    }
    
    function settingArray() public {
        testArray[0] = 1000;
        testArray[getLength() - 1] = 2000;
    }

    function getLength() public view returns(uint){
        return testArray.length;
    }
}