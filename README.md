# Order-Based Token Swap Contract

This repository contains a smart contract for an order-based token swap system. The contract allows users to deposit various ERC20 tokens and swap them with other tokens based on predefined exchange rates. Users can deposit Token A, Token B, and Token Z, and trade between these tokens.

## Project Structure

- **Main Contract**: `OrderSwap.sol`  
  The `OrderSwap` contract facilitates the deposit, swapping, and withdrawal of different tokens. It is designed with security in mind, utilizing `ReentrancyGuard` to prevent reentrancy attacks.

- **Token Contract**: `SwapToken.sol`  
  A simple ERC20 token contract that mints a new token for testing purposes. This contract simulates the different tokens used in the swap contract.

## Features

### 1. Deposit Tokens
Users can deposit different types of tokens into the contract. Supported tokens are:
- Token A (Deposited by calling the `deposit` function with `tokenA_contractAddress`)
- Token B (Deposited by calling the `deposit` function with `tokenB_contractAddress`)
- Token Z (Deposited by calling the `deposit` function with `tokenZ_contractAddress`)

### 2. Swap Tokens
Users can swap between the supported tokens using predefined exchange rates. The available swaps are:
- Token A ↔ Token B
- Token A ↔ Token Z
- Token B ↔ Token Z

The rates are:
- **Token A ↔ Token B**: 10:1
- **Token A ↔ Token Z**: 100:1
- **Token B ↔ Token Z**: 10:1

### 3. Withdraw Tokens
Users can withdraw their deposited tokens at any time using the `withdraw` function. They must specify the token address and amount.

### 4. View Token Balances
Users can view their balances of deposited tokens using the `getBalanceTokenA` function.

## Smart Contracts

### `OrderSwap.sol`
This is the main contract responsible for handling deposits, swaps, and withdrawals. It includes:
- Deposit functionality for Token A, Token B, and Token Z.
- Swap functionality between different tokens using predefined rates.
- Withdrawal functionality for users to reclaim their tokens.
- Balance query function for users to check their deposited balances.

### `SwapToken.sol`
This contract is a simple ERC20 token implementation used to simulate the tokens (Token A, B, Z) for testing purposes.

## Setup

### Requirments

- Solidity
- OpenZeppelin Contracts (for ERC20 and ReentrancyGuard)
- Hardhat for contract deployment

### Install Dependencies

```bash
npm install @openzeppelin/contracts
```

### Deploying Contracts

1. Deploy the `SwapToken.sol` contract to create token contracts (Token A, B, and Z).
2. Use the deployed token addresses as parameters when deploying the `OrderSwap.sol` contract.

### Example Deployment

1. Deploy the `SwapToken` contract three times to simulate Token A, Token B, and Token Z.
2. Use the contract addresses from the token deployments when deploying the `OrderSwap` contract.


### Running Tests
To test the contract functionalities, use Hardhat to simulate different user actions like deposits, swaps, and withdrawals.

## How to Use

1. **Deposit Tokens**:  
   Call the `deposit` function with the token contract address and amount.
   ```solidity
   orderSwap.deposit(1000, tokenAAddress);
   ```

2. **Swap Tokens**:  
   Call the `swapToken` function to exchange one token for another.
   ```solidity
   orderSwap.swapToken(tokenAAddress, tokenBAddress, 100);
   ```

3. **Withdraw Tokens**:  
   Call the `withdraw` function to withdraw your tokens.
   ```solidity
   orderSwap.withdraw(tokenAAddress, 100);
   ```

4. **View Balances**:  
   Use the `getBalanceTokenA` function to check your deposited token balances.
   ```solidity
   orderSwap.getBalanceTokenA(tokenAAddress);
   ```

## License
This project is licensed under the MIT License.