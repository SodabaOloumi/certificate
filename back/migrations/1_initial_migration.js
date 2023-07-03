const Migrations = artifacts.require("Certification");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
