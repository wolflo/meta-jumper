pragma solidity ^0.4.24;

import "ds-test/test.sol";

import "./MetaJumper.sol";

contract MetaJumperTest is DSTest {
    bytes internal maliciousMetaJumper = hex'6080604052348015600f57600080fd5b50608a8061001e6000396000f300608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063dd6cc6d4146044575b600080fd5b348015604f57600080fd5b5060566058565b005b600638035600a165627a7a72305820545f0aa9ad2504372ed7a0d9598ab74a0d58150bf3e4be9b9eb80ee15b6000ff0029';

    function setUp() public {}

    function testMetadataJumper() public {
        MetaJumper mj;
        bytes memory _initcode = maliciousMetaJumper;
        assembly {
            mj := create(0x0, add(_initcode, 0x20), mload(_initcode))
        }

        mj.metaJump();
    }
}
