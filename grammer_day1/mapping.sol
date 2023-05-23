// SPDX-License-Identifier: MIT
pragma solidity > 0.7.0 <= 0.9.0;

contract ArrayTest{
    mapping (address => uint) public table;
    function addMapping(address _key, uint _value) public {
        table[_key] = _value;
    }

    function getMapping(address _key) public view returns(uint){
        return table[_key];
    }
    //getter 함수, 만들지 않아도 자동으로 만들어짐

    function deleteMapping(address _key) public {
        delete(table[_key]);
    }
    //table[_key]의 매핑 자체를 지울 수는 없음
    //delte를 하게 되면 table[_key]의 value도 자동으로 초기화 됨

    function changeMapping(address _key, uint _value) public {
        table[_key] = _value;
    }
}

