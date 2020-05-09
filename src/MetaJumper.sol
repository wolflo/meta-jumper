pragma solidity 0.4.24; // jump instruction was removed from inline assembly in 0.5.0

contract MetaJumper {
    function metaJump() public {
        assembly {
            jump(sub(codesize(), 0x06))
        }
    }
}
