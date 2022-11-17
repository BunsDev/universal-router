// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import 'forge-std/Test.sol';
import "forge-std/StdJson.sol";
import {UniversalRouter} from '../../contracts/UniversalRouter.sol';
import {Payments} from '../../contracts/modules/Payments.sol';
import {Constants} from '../../contracts/libraries/Constants.sol';
import {Commands} from '../../contracts/libraries/Commands.sol';
import {MockERC20} from './mock/MockERC20.sol';
import {MockERC1155} from './mock/MockERC1155.sol';
import {Callbacks} from '../../contracts/base/Callbacks.sol';
import {ExampleModule} from '../../contracts/test/ExampleModule.sol';
import {RouterParameters} from '../../contracts/base/RouterImmutables.sol';
import {ERC20} from 'solmate/tokens/ERC20.sol';
import {UnsupportedProtocol} from "../../contracts/deploy/UnsupportedProtocol.sol";
import 'permit2/src/interfaces/IAllowanceTransfer.sol';

import 'openzeppelin-contracts/contracts/token/ERC721/IERC721Receiver.sol';
import 'openzeppelin-contracts/contracts/token/ERC1155/IERC1155Receiver.sol';

contract UniversalRouterTest is Test {
    using stdJson for string;

    address constant RECIPIENT = address(10);
    uint256 constant AMOUNT = 10 ** 18;

    UniversalRouter router;
    ExampleModule testModule;
    MockERC20 erc20;
    MockERC1155 erc1155;
    Callbacks callbacks;

    function setUp() public {
    }


function testInitCode() public {

       RouterParameters memory newParams = RouterParameters({
            permit2: 0x000000000022D473030F116dDEE9F6B43aC78BA3,
            weth9: 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
            seaport:0x00000000006c3852cbEf3e08E8dF289169EdE581,
            nftxZap: 0x0fc584529a2AEfA997697FAfAcbA5831faC0c22d,
            x2y2: 0x74312363e45DCaBA76c59ec49a7Aa8A65a67EeD3,
            foundation: 0xcDA72070E455bb31C7690a170224Ce43623d0B6f,
            sudoswap: 0x2B2e8cDA09bBA9660dCA5cB6233787738Ad68329,
            nft20Zap: 0xA42f6cADa809Bcf417DeefbdD69C5C5A909249C0,
            cryptopunks:0xb47e3cd837dDF8e4c57F05d70Ab865de6e193BBB,
            looksRare: 0x59728544B08AB483533076417FbBB2fD0B17CE3a,
            routerRewardsDistributor: 0xea37093ce161f090e443f304e1bF3a8f14D7bb40,
            looksRareRewardsDistributor: 0x0554f068365eD43dcC98dcd7Fd7A8208a5638C72,
            looksRareToken: 0xf4d2888d29D722226FafA5d9B24F9164c092421E,
            v2Factory: 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f,
            v3Factory:0x1F98431c8aD98523631AE4a59f267346ea31F984,
            pairInitCodeHash: 0x96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f,
            poolInitCodeHash: 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54
        });

        bytes memory args = abi.encode(newParams);
        bytes memory code = abi.encodePacked(vm.getCode("UniversalRouter.sol:UniversalRouter"), args);
        bytes32 codeHash = keccak256(code);
        console.logBytes32(codeHash);
    }
}

