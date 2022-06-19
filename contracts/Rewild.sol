// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
contract Rewild is ERC1155 {

  
uint256 public constant SEED = 0;
uint256 public constant SPROUT = 1;
uint256 public constant SAPLING = 2;
uint256 public constant TREE = 3;
uint256 public constant HIO = 4;


//  constructor() ERC1155("https://gateway.pinata.cloud/ipfs/QmTzyY4nhgCJX6j5jNf2cXTkVm9VhhiARWYzZ3tYsDGevu/{id}.json") {
  
constructor() ERC1155("https://gateway.pinata.cloud/ipfs/QmV16v1mxvBFRatdFzkQuPSHt7N1djQVqqXxhQCJL5ynxw/{id}.json") {
  
  //simplicity, minting all of our tokens to start
    _mint(msg.sender, SEED, 10**10, "");
    _mint(msg.sender, SPROUT, 10**10, "");
    _mint(msg.sender, SAPLING, 10**10, "");
    _mint(msg.sender, TREE, 10**10, "");
    _mint(msg.sender, HIO, 10**10, "");


  }

//the marketplace contract will have further "smarts" around the flow and requirements
//for our tokens. The "game" side of rewilding shows up in the marketplace

}