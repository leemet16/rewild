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

struct MarketItem {
    uint itemId;
    IERC1155 token; //token covers all cases of being NFT, soft-fungible token, or non-fungible token
    uint tokenId;
    uint amount;
    uint price;
    address payable seller;  //in addition to being the seller, they will be the receiver of a HIO
    address payable owner;
    bool sold;
}


mapping (uint => MarketItem) public marketItems; //mapping of marketItems where the itemId will lead to a specific MarketItem


event Offered(
    uint itemId,
    address indexed token,
    uint tokenId,
    uint price,
    address indexed seller
    );

event Bout(
    uint itemId,
    address indexed token,
    uint tokenId,
    uint price,
    address indexed seller,
    address indexed buyer
);

constructor (uint _charityRoyalty)
{
    charityAccount = payable(msg.sender);
    charityRoyalty = _charityRoyalty;

}

function listToken(uint tokenId, uint amount, uint price) external{
    require(tokenId > 0, "Token does not exist");
    
}

}
