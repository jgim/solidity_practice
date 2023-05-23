// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ERC20 {
	function balanceOf(address who) public view returns (uint256);
	function transfer(address to, uint256 value) public returns (bool);
	function allowance(address owner, address spender) public view returns (uint256);
	function transferFrom(address from, address to, uint256 value) public returns (bool);
	function approve(address spender, uint256 value) public returns (bool);
	event Transfer(address indexed from, address indexed to, uint256 value);
	event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract MyToken is ERC20{

		//토큰의 명칭
		string _name;

		//자릿수
		uint _decimals;

		//토큰의 총량
		uint _totalSupply;

		//현재 컨트랙트를 사용하는 유저의 주소를 저장하는 변수
    address _userAddr;

		//현재 지갑을 만든 유저들의 주소를 저장하는 배열
    address[] addrList;

		//현재 심볼을 저장하는 변수
		string _symbol;


		//현재 지갑을 만든 유저들의 주소를 키로 하고 그 유저들의 자산을 저장하는 매핑
    mapping(address => uint) _balance;

		//생성자 함수, 컨트랙트를 배포할 때 최초 한번만 실행됨
    constructor(){
				_name = "MyToken";
				_decimals = 18;
				_symbol = "MyT";
				_totalSupply = 100000000000000000000000000;
        _userAddr = msg.sender;
				_balance[msg.sender] = 100000000000000000000000000;
        addrList;
    }

		//은행에 예금을 하는 함수, 예금을 하는 유저의 주소와 예금액을 입력받음
    function depositWallet(address clientAddr, uint deposit) public{
			for (uint i = 0; i < addrList.length; i++){
				if (addrList[i] == clientAddr){
					_balance[clientAddr] += deposit;
				} else {
					// 만약 지갑이 개설되어 있지 않다면, 지갑을 개설함
					createWallet(clientAddr, deposit);
				}
			}
		}

		// 지갑을 개설하는 함수, 지갑을 개설하는 유저의 주소와 예금액을 입력받음
		function createWallet(address clientAddr, uint deposit) public{
			addrList.push(clientAddr);
			_balance[clientAddr] = deposit;
		}

		// 예금을 인출하는 함수, 인출을 하는 유저의 주소와 인출액을 입력받음
    function withDrawal(address clientAddress, uint inputValue) public {
			if (_balance[clientAddress] >= inputValue){
				_balance[clientAddress] -= inputValue;
			} else {
				// revert는 함수를 중단시키고, 함수를 호출한 곳으로 예외를 던짐, 트랜잭션을 되돌림
				revert("Insufficient balance");
			}
    }

		// 컨트랙트를 배포한 사람의 주소를 반환하는 함수
    function getAddress() public view returns(address){
        return _userAddr;
    }

	// 예치한 고객의 자산을 반환하는 함수
		function getBalance(address clientAddr) public view returns(uint){
				return _balance[clientAddr];
		}

		// 현재 컨트랙트가 보유하고 있는 자산의 총량을 반환하는 함수
    function getResult() public view returns(uint){
        return _balance[_userAddr];
    }

		// 자산을 예치한 고객들에게 amt만큼의 금액을 입금하는 코드(주로 이자를 주는 용도)
    function transfer(uint amt) public {
        if (result >= amt * addrList.length) {
            for (uint i = 0; i < addrList.length; i++){
								wallet[addrList[i]] += amt;
								result -= amt;
						}
        } else {
					revert("Unable to make payment");
				}
    }

		// for문 테스트용 함수
    // function sumResult(uint sum) public returns(uint){
    //     for (uint i = 1; i <= sum; i++){
    //         result += i;
    //     }
    //     return result;
    // }

		// 몸풀기용 함수
		// function getSum() public view returns(uint){
		// 	return result;
		// }
}

