//using code from Celo Tutorial to jumpstart our efforts
//thanks to https://github.com/lucasespinosa28/Celo-Tutorial/blob/main/demo/celo_deploy.js
//appreciate the Creative Commons Zero license

const Web3 = require('web3');
const ContractKit = require('@celo/contractkit');
const web3 = new Web3('https://celo-alfajores--rpc.datahub.figment.io/apikey/057db5202c44b9622fcae9e67065fa6a/');
const kit = ContractKit.newKitFromWeb3(web3);
const data = require('./artifacts/contracts/Rewild.sol/Rewild.json');
const Account = require('./celo_account');

async function Rewild() {
    const account = Account.getAccount();
    kit.connection.addAccount(account.privateKey);

    let tx = await kit.connection.sendTransaction({
        from: account.address,
        data: data.bytecode
    });

     return tx.waitReceipt();
    
}

module.exports = {
    Rewild
}