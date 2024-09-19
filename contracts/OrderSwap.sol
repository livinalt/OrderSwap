// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract OrderSwap {
    /* 
    
    i want uses to deposit tokena, b, c and d
    I want users to be able to withraw these tokens in token z */

    /* 
    Create an order-based swap contract that allows users to deposit various kinds of tokens. 
    These tokens can be purchased by others with another token specified by the depositors. 

For example; Ada deposits 100 GUZ tokens; she wants in return, 20 W3B tokens for the 100 GUZ tokens.
     */
    address owner;
     address tokenA_contractAddress; // deposit tokens
     address tokenB_contractAddress; // deposit tokens
     address tokenC_contractAddress; // deposit tokens
     address tokenZ_contractAddress; // withdraw token

     error InsufficientBalance();

     mapping(address tokenA_contractAddress => uint256) balancesTokenA;
     mapping(address tokenB_contractAddress => uint256) balancesTokenB;
     mapping(address tokenC_contractAddress => uint256) balancesTokenC;
     mapping(address tokenZ_contractAddress => uint256) balancesTokenZ;

     constructor(address _tokenA_contractAddress, address _tokenB_contractAddress, address _tokenC_contractAddress, address _tokenZ_contractAddress){
        
        tokenA_contractAddress = _tokenA_contractAddress;
        tokenB_contractAddress = _tokenB_contractAddress;
        tokenC_contractAddress = _tokenC_contractAddress;
        tokenZ_contractAddress = _tokenZ_contractAddress;

        owner = msg.sender;
     }

     function deposit(uint256 _amount, address _contractAddress) external {

        if(_contractAddress == tokenA_contractAddress){
            require((IERC20(tokenA_contractAddress).balanceOf(msg.sender) > _amount), "Insufficient Balance");
            balancesTokenA[msg.sender] += _amount;
        }
        if(_contractAddress == tokenB_contractAddress){
            require((IERC20(tokenB_contractAddress).balanceOf(msg.sender) > _amount), "Insufficient Balance");
            balancesTokenB[msg.sender] += _amount;
        }
        if(_contractAddress == tokenC_contractAddress){
            require((IERC20(tokenC_contractAddress).balanceOf(msg.sender) > _amount), "Insufficient Balance");
            balancesTokenC[msg.sender] += _amount;
        }
        if(_contractAddress == tokenZ_contractAddress){
            require((IERC20(tokenZ_contractAddress).balanceOf(msg.sender) > _amount), "Insufficient Balance");
            balancesTokenZ[msg.sender] += _amount;
        }
        
     }

     function swapToken() external{

     }

     function withdraw() external{

     }
}