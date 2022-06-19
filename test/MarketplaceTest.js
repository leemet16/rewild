const { expect } = require("chai"); 
const { ethers } = require('hardhat');

//SEED = 0 and 10**10;
//SPROUT = 1 and 10**10;
//SAPLING = 2 and 10**10;
//TREE = 3 and 10**10;
//HIO = 4 and 10**10;

beforeEach(async function () {
  let charityRoyalty = 100;
  accounts = await ethers.getSigners();

  //first deploy Rewild contract
  Rewild = await ethers.getContractFactory('Rewild');
  reWild = await Rewild.deploy();
  await reWild.deployed();

  //and now, deploy the marketplace contract
  Marketplace = await ethers.getContractFactory('Marketplace');

  //to deploy, remember that the constructor takes the royalty percentage!
  marketplace = await Marketplace.deploy(reWild.address, charityRoyalty);
  await marketplace.deployed();
  
  reWildAddress = reWild.address;
  marketplaceAddress = marketplace.address;

});

describe("Deployment", function () {

  it("Should track feeAccount and feePercent of the marketplace", async function () {
    expect(await marketplace.charityAccount()).to.equal(reWild.address);
    expect(await marketplace.charityRoyalty()).to.equal(charityRoyalty);
  });
});

describe('Seeds minted', function () {
  it("mint seeds and check balances", async function () {

    //check balances for each of our tokens - seeds
    const seedBalance = await reWild.balanceOf(accounts[0].address, 0)
    expect(10**10).to.equal(Number(seedBalance.toString()));

    //list seeds for sale!
    //    function listItem(IERC1155 _token, uint _tokenId, uint _price, uint _amount) external nonReentrant {
    //marketplace.listItem(reWild.)

  });
});

