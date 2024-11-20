// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// Once erc20 kontrati import edelim.
import {ERC20, IERC20Metadata, Context, IERC20Errors} from "./openzeppelin-contracts/token/ERC20/ERC20.sol";



    contract ERC20Factory {
    // Array to keep track of deployed token addresses
    address[] public deployedTokens;

    // Event emitted when a new token is deployed
    event TokenCreated(address indexed tokenAddress, string name, string symbol, uint256 totalSupply);

    // Function to create a new ERC20 token
    function createToken(string memory name, string memory symbol, uint256 initialSupply) public {
        // Deploy a new ERC20 contract
        ERC20Token newToken = new ERC20Token(name, symbol, initialSupply, msg.sender);

        // Add the token address to the deployed tokens array
        deployedTokens.push(address(newToken));

        // Emit the creation event
        emit TokenCreated(address(newToken), name, symbol, initialSupply);
    }

    // Function to retrieve all deployed tokens
    function getDeployedTokens() public view returns (address[] memory) {
        return deployedTokens;
    }
    
    }

contract ERC20Token is ERC20 {
    // Constructor to initialize the token
    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner) ERC20(name, symbol) {
        // Mint initial supply to the specified owner
        _mint(owner, initialSupply * 10 ** decimals());
    }


}