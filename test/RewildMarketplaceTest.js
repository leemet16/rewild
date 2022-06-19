const { expect } = require("chai"); 
const { ethers } = require('hardhat');

//SEED = 0 and 10**10;
//SPROUT = 1 and 10**10;
//SAPLING = 2 and 10**10;
//TREE = 3 and 10**10;
//HIO = 4 and 10**10;


describe('RewildMarketplace', function () {
    it("deploy and check balances", async function () {
        const accounts = await ethers.getSigners();

      const Rewild = await ethers.getContractFactory('Rewild');
      const reWild = await Rewild.deploy();
      await reWild.deployed();

      //check balances for each of our tokens - seeds
      const seedBalance = await reWild.balanceOf(accounts[0].address, 0)
      expect(10**10).to.equal(Number(seedBalance.toString()));

      //check balances for each of our tokens - sprouts
        const sproutBalance = await reWild.balanceOf(accounts[0].address, 1)
      expect(10**10).to.equal(Number(sproutBalance.toString()));

      //check balances for each of our tokens - saplings
      const saplingBalance = await reWild.balanceOf(accounts[0].address, 2)
      expect(10**10).to.equal(Number(saplingBalance.toString()));

      //check balances for each of our tokens - trees
      const treeBalance = await reWild.balanceOf(accounts[0].address, 3)
      expect(10**10).to.equal(Number(treeBalance.toString()));

      //check balances for each of our tokens - trees
      const hioBalance = await reWild.balanceOf(accounts[0].address, 4)
      expect(10**10).to.equal(Number(hioBalance.toString()));

    });
  });