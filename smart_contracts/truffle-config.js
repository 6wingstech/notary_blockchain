var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "dinosaur own cry volcano attract unveil aisle model mimic quick sport expose";

module.exports = {
 networks: {
  development: {
   host: "127.0.0.1",
   port: 8545,
   network_id: "*"
  },
  rinkeby: {
      provider: function() { 
       return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/c8ef14b4b9db4f89a304ee7959f20449");
      },
      network_id: 4,
      gas: 6500000,
      gasPrice: 10000000000,
      from: '0x4432511e361044bd5a9c3aea9bae2789669d0c4e'
  }
 }
};