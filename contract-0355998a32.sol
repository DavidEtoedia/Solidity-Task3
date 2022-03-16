// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";

contract TaskToken is ERC20 {

    uint public _totalSupply;
    
    mapping(address => uint256) balances;
      
mapping(address => mapping (address => uint256)) allowed;
    constructor() ERC20("TaskToken", "Token") {
        _totalSupply = 1000000;

        balances[msg.sender] = _totalSupply;

    }

   function getBalance(address tokenOwner) public view returns (uint) {
  return balances[tokenOwner];
}

 function buyToken(address receiver,
                 uint numTokens) public returns (bool) {
  require(numTokens <= balances[msg.sender]);
  balances[msg.sender] = balances[msg.sender] - numTokens;
  balances[receiver] = balances[receiver] + numTokens;
  emit Transfer(msg.sender, receiver, numTokens);
  return true;
}



}
