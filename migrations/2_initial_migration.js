var Storage = artifacts.require("./Storage.sol");
var InfoManager = artifacts.require("./InfoManager.sol");
var DeliveryDroneControl = artifacts.require("./DeliveryDroneControl.sol");

module.exports = function(deployer) {
  deployer.deploy(Storage)
    .then(() => Storage.deployed())
    .then((instance) => {
      instance.addData("Hello", "world")})
        // Deploy the InfoManager contract, while passing the address of the
        // Storage contract
    .then(() => deployer.deploy(InfoManager, Storage.address))
    .then(() => deployer.deploy(DeliveryDroneControl, Storage.address))
}
