pragma solidity ^0.5.15;

import "ds-test/test.sol";

import "./MetaJumper.sol";

contract MetaJumperTest is DSTest {
    MetaJumper jumper;

    function setUp() public {
        jumper = new MetaJumper();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
