const main = async () => {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.getBalance();

  console.log("Deploying contracts with account: ", deployer.address);
  console.log("Account balance: ", accountBalance.toString());

  const svContract = await hre.ethers.getContractFactory("SV");
  const SV_CONTRACT_INSTANCE = await svContract.deploy();
  // console.log(LandContract);
  await SV_CONTRACT_INSTANCE.deployed();

  console.log("SV Conctract address ", SV_CONTRACT_INSTANCE.address);
  // console.log(await SV_CONTRACT_INSTANCE.pluck());
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
