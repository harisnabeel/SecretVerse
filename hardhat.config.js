require("@nomiclabs/hardhat-waffle");
const { version } = require("chai");
let secret = require("./secret.json");
require("@nomiclabs/hardhat-etherscan");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

async function getContractInstance() {
  const svContract = await ethers.getContractFactory("SV");
  const SV_CONTRACT_INSTANCE = await svContract.attach(
    "0x5FbDB2315678afecb367f032d93F642f64180aa3"
  );
  return SV_CONTRACT_INSTANCE;
}

// task("pluck", "Plucks").setAction(async (taskArgs) => {
//   const accounts = await hre.ethers.getSigners();
//   // Create the contract instance
//   const SV_CONTRACT_INSTANCE = await getContractInstance();

//   await SV_CONTRACT_INSTANCE.connect(accounts[0]).pluck();
// });

task("createVault", "createsAVault").setAction(async (taskArgs) => {
  const accounts = await hre.ethers.getSigners();
  const SV_CONTRACT_INSTANCE = await getContractInstance();

  let tnx = await SV_CONTRACT_INSTANCE.connect(accounts[0]).createVault();
  // tnx.wait();
  console.log(tnx);
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.7",
  networks: {
    rinkeby: {
      url: `${secret.rinkeby_key}`,
      accounts: [secret.key],
    },
    ropsten: {
      url: `${secret.ropsten_key}`,
      accounts: [secret.key],
      gasPrice: 50000000000,
    },
    goerli: {
      url: `${secret.goerli_key}`,
      accounts: [secret.key],
    },
    bsc_testnet: {
      url: `${secret.bsc_key}`,
      accounts: [secret.key],
    },
  },
  etherscan: {
    apiKey: {
      ropsten: `${secret.etherscan_key}`,
      rinkeby: `${secret.etherscan_key}`,
    },
  },
};
