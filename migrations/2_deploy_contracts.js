const DEX = artifacts.require("DEXContract");
const MTA = artifacts.require("MTA");
const MTB = artifacts.require("MTB");
const MTC = artifacts.require("MTC");
const MTD = artifacts.require("MTD");

module.exports = async function (deployer) {
  await deployer.deploy(MTA);
  await deployer.deploy(MTB);
  await deployer.deploy(MTC);
  await deployer.deploy(MTD);

  const MTAInstance = await MTA.deployed();
  const MTBInstance = await MTB.deployed();
  const MTCInstance = await MTC.deployed();
  const MTDInstance = await MTD.deployed();

  await deployer.deploy(
    DEX,
    MTAInstance.address,
    MTBInstance.address,
    MTCInstance.address,
    MTDInstance.address
  );

  const DexInstance = await DEX.deployed();

  // Top up dex coin reserve
  MTAInstance.transfer(DexInstance.address, "1500000000000000000000");
  MTBInstance.transfer(DexInstance.address, "1500000000000000000000");
  MTCInstance.transfer(DexInstance.address, "1500000000000000000000");
  MTDInstance.transfer(DexInstance.address, "1500000000000000000000");
};
