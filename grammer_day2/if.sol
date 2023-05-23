// SPDX-License-Identifier: MIT

pragma solidity > 0.7.0 <= 0.9.0;

contract ForTest{
	function forTest(uint end, string memory name) public pure returns(uint){
		uint sum = 0;
		if (end < 5 && keccak256(abi.encodePacked(name)) == keccak256(abi.encodePacked("a"))) {
			/*
			 *  solidity는 문자열 직접 비교를 제공하지 않음
			 *  만약 문자열 직접 비교를 하고 싶으면 keccak256로 해시를 한 다음 그 값을 비교함
			 *	keccak256함수는 byte타입 데이터만 암호화할 수 있기때문에 abi.encodePacked를 이용하여 byte타입으로 변경후 keccak256을 사용하여 암호화
			 */
			for(uint i = 0; i <= end; i++){
				sum += i;
			}
		}
		return sum;
	}
}
