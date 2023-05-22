// SPDX-License-Identifier: MIT
pragma solidity > 0.7.0 <= 0.9.0 ;

contract GrobalPractice{
  uint public _block_basefee = block.basefee;
  uint public _block_chainid = block.chainid;
  address public _block_coinbase = block.coinbase;
  uint public _block_timestamp = block.timestamp;
  address public _msg_sender = msg.sender;
  
  uint public tokenTotalSupply = 1000;
  uint public tokenDecimal = tokenTotalSupply * 10 * 8;
  string public tokenName = "Ether";
  string public tokenSymbol = "ETH";
}