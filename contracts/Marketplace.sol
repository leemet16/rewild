// SPDX-License-Identifier: MIT
//taking inspiration from DAPPUniversity tutorial on NFT marketplaces
//published via MIT license as well. https://github.com/dappuniversity/nft_marketplace


pragma solidity ^0.8.1;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "hardhat/console.sol";

contract Marketplace is ReentrancyGuard
{
    //set up account and royalty rate for the charity
    address payable public immutable charityAccount; //the account that will disburse funds to charitable partners
    uint public immutable charityRoyalty; //royalty from all sales that goes to charity

    //set up account and fees to keep our marketplace going - keep this minimal!
    address payable public immutable feeAccount; //the account that will receive fees for running the marketplace
    uint public immutable feePercent; // processing fees

    
}
