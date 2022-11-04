require("dotenv").config();
require("@nomiclabs/hardhat-ethers");
const { ethers } = require("hardhat");
const {
    ROUTER_REWARDS_DISTRIBUTOR,
    LOOKSRARE_REWARDS_DISTRIBUTOR,
    LOOKSRARE_TOKEN,
    V2_FACTORY_MAINNET,
    V3_FACTORY_MAINNET,
    V2_INIT_CODE_HASH_MAINNET,
    V3_INIT_CODE_HASH_MAINNET
} = require("../test/integration-tests/shared/constants");

async function main() {
    const permit2Factory = await ethers.getContractFactory('Permit2')
    const permit2 = await permit2Factory.deploy()
    console.log("Deployed permit2 at", permit2.address)
    const routerFactory = await ethers.getContractFactory('Router')
    const router = await routerFactory.deploy(
        permit2.address,
        ROUTER_REWARDS_DISTRIBUTOR,
        LOOKSRARE_REWARDS_DISTRIBUTOR,
        LOOKSRARE_TOKEN,
        V2_FACTORY_MAINNET,
        V3_FACTORY_MAINNET,
        V2_INIT_CODE_HASH_MAINNET,
        V3_INIT_CODE_HASH_MAINNET
    )
    console.log("Deployed router at", router.address)
}

main()
    // eslint-disable-next-line no-process-exit
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        // eslint-disable-next-line no-process-exit
        process.exit(1);
    });
