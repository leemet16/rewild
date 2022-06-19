// SPDX-License-Identifier: MIT
//taking inspiration from DAPPUniversity tutorial on NFT marketplaces
//published via MIT license as well. https://github.com/dappuniversity/nft_marketplace


//many todo items still!
// support for CUSD
// pre-populating the marketplace with our tokens
// enforce the buying / selling path to get to a tree
// sending sellers a HIO as they support the rewilding effort
// add a UI

pragma solidity ^0.8.1;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/utils/Counters.sol";



contract Marketplace is ReentrancyGuard, ERC1155Holder
{
    //set up account and royalty rate for the charity
    address payable public immutable charityAccount; //the account that will disburse funds to charitable partners
    uint public immutable charityRoyalty; //royalty from all sales that goes to charity
    uint public itemCount; 

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

IERC1155 private tokenContract;

mapping (uint => MarketItem) public marketItems; //mapping of marketItems where the itemId will lead to a specific MarketItem

using Counters for Counters.Counter;
Counters.Counter private _tokenIds;
Counters.Counter private _tokensSold;



constructor (address _tokenContract, uint _charityRoyalty)
{
    tokenContract = IERC1155(_tokenContract);

    charityAccount = payable(msg.sender);
    charityRoyalty = _charityRoyalty;

    //seed (no pun intended!) the marketplace by listing and selling seeds
    //default price is $5 CUSD for 5 seeds 

}

// List item to offer on the marketplace
    function listItem(IERC1155 _token, uint _tokenId, uint _price, uint _amount) external nonReentrant {
        
        //start with some basic checks
        //will need to enhance on price
        require(_price > 0, "Price must be greater than zero");
        require(_amount > 0, "Must list at list 1 token");

        
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();

        // transfer token
        _token.safeTransferFrom(msg.sender, address(this), _tokenId, _amount, "");
        

        // add new item to items mapping
        marketItems[itemCount] = MarketItem (
            itemCount,
            _token,
            _tokenId,
            _amount,
            _price,
            payable(msg.sender),
            payable(msg.sender),
            false
        );
        
    }


}
