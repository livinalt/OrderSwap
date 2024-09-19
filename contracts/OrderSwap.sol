// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract OrderSwap is ReentrancyGuard{

     address owner;
     address tokenA_contractAddress; // deposit tokens A
     address tokenB_contractAddress; // deposit tokens B
     address tokenZ_contractAddress; // withdraw token Z

     uint256 constant factorA = (1 * 10**2);
     uint256 constant factorB = factorA / (10);
     uint256 constant factorZ = factorB / (10);

     error InsufficientBalance();

     mapping(address tokenA_contractAddress => uint256) balancesTokenA;
     mapping(address tokenB_contractAddress => uint256) balancesTokenB;
     mapping(address tokenZ_contractAddress => uint256) balancesTokenZ;

     constructor(address _tokenA_contractAddress, address _tokenB_contractAddress, address _tokenZ_contractAddress){
        
        tokenA_contractAddress = _tokenA_contractAddress;
        tokenB_contractAddress = _tokenB_contractAddress;
        tokenZ_contractAddress = _tokenZ_contractAddress;

        owner = msg.sender;
     }

     function deposit(uint256 _amount, address _contractAddress) external {

        require(_contractAddress != address(0),"Address Zero detected");
        require(msg.sender != address(0),"Address Zero detected");
        require(_amount > 0, "Amount must be greater than zero");

        if(_contractAddress == tokenA_contractAddress){
            require((IERC20(tokenA_contractAddress).balanceOf(msg.sender) >= _amount), "Insufficient Balance");
            balancesTokenA[msg.sender] += _amount;
        }
        if(_contractAddress == tokenB_contractAddress){
            require((IERC20(tokenB_contractAddress).balanceOf(msg.sender) >= _amount), "Insufficient Balance");
            balancesTokenB[msg.sender] += _amount;
        }

        if(_contractAddress == tokenZ_contractAddress){
            require((IERC20(tokenZ_contractAddress).balanceOf(msg.sender) >= _amount), "Insufficient Balance");
            balancesTokenZ[msg.sender] += _amount;
        }
        
     }

     function swapToken(address from, address to, uint256 amount) external{

        require(from != address(0),"Address Zero detected");
        require(to != address(0),"Address Zero detected");
        require(msg.sender != address(0),"Address Zero detected");
        require(amount > 0, "Amount must be greater than zero");

         if(from == tokenA_contractAddress && to == tokenB_contractAddress){
            require((IERC20(tokenA_contractAddress).balanceOf(msg.sender) > amount), "Insufficient Balance");
           
            balancesTokenA[msg.sender] -= amount;

            uint256 swappedAmount = amount * (1 * 10**2) / 10;
            balancesTokenB[msg.sender] += swappedAmount;
        }
       
       
    
         if(from == tokenA_contractAddress && to == tokenZ_contractAddress){
            require((IERC20(tokenA_contractAddress).balanceOf(msg.sender) >= amount), "Insufficient Balance");
           
            balancesTokenA[msg.sender] -= amount;

            uint256 swappedAmount = amount * (1 * 10**2) / 100;
            balancesTokenZ[msg.sender] += swappedAmount;
        }

         if(from == tokenB_contractAddress && to == tokenZ_contractAddress){
            require((IERC20(tokenB_contractAddress).balanceOf(msg.sender) >= amount), "Insufficient Balance");
           
            balancesTokenB[msg.sender] -= amount;

            uint256 swappedAmount = amount * (1 * 10**2) / 100;
            balancesTokenZ[msg.sender] += swappedAmount;
        }
       

         if(from == tokenB_contractAddress && to == tokenA_contractAddress){
            require((IERC20(tokenB_contractAddress).balanceOf(msg.sender) >= amount), "Insufficient Balance");
           
            balancesTokenB[msg.sender] -= amount;

            uint256 swappedAmount = amount / ((1 * 10**2) / 10);
            balancesTokenA[msg.sender] += swappedAmount;
        }

         if(from == tokenZ_contractAddress && to == tokenA_contractAddress){
            require((IERC20(tokenB_contractAddress).balanceOf(msg.sender) >= amount), "Insufficient Balance");
           
            balancesTokenB[msg.sender] -= amount;

            uint256 swappedAmount = amount / ((1 * 10**2) / 100);
            balancesTokenZ[msg.sender] += swappedAmount;
        }
       

         if(from == tokenZ_contractAddress && to == tokenB_contractAddress){
            require((IERC20(tokenZ_contractAddress).balanceOf(msg.sender) >= amount), "Insufficient Balance");
           
            balancesTokenZ[msg.sender] -= amount;

            uint256 swappedAmount = amount / ((1 * 10**2) / 100);
            balancesTokenB[msg.sender] += swappedAmount;
        }       

     }


     function withdraw(address from, uint256 amount) external{
        
        require(from != address(0),"Address Zero detected");
        require(msg.sender != address(0),"Address Zero detected");
        require(amount > 0, "Amount must be greater than zero");

        if(from == tokenA_contractAddress){
            require((balancesTokenA[msg.sender] >= amount), "Insufficient Balance");
           
            balancesTokenA[msg.sender] -= amount;

        }
        
        if(from == tokenB_contractAddress){
            require((balancesTokenA[msg.sender] >= amount), "Insufficient Balance");
           
            balancesTokenB[msg.sender] -= amount;

        }
        
        if(from == tokenZ_contractAddress){
            require((balancesTokenA[msg.sender] >= amount), "Insufficient Balance");
           
            balancesTokenZ[msg.sender] -= amount;

        }

     }

     function getBalanceTokenA(address token) external view returns(uint256){

        require(token != address(0),"Address Zero detected");
        require(msg.sender != address(0),"Address Zero detected");

        if(token == tokenA_contractAddress){
            return balancesTokenA[msg.sender];
        }
        if(token == tokenB_contractAddress){
            return balancesTokenB[msg.sender];
        }
        if(token == tokenZ_contractAddress){
            return balancesTokenZ[msg.sender];
        }
        
     }
     
}