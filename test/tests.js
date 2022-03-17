const { expect } = require("chai");
const { ethers } = require("ethers");

describe("SV", async () => {
  let owner,
    SV_CONTRACT_INSTANCE,
    accounts = [];
  beforeEach(async () => {
    const svContract = await hre.ethers.getContractFactory("SV");
    SV_CONTRACT_INSTANCE = await svContract.deploy();
    await SV_CONTRACT_INSTANCE.deployed();
    accounts = await hre.ethers.getSigners();
    owner = accounts[0];
  });
});
