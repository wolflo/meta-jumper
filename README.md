# Meta Jumper
A solidity contract that jumps into its own metadata (presumably for malicious purposes).
This contract was deployed to Rinkeby and verified on Etherscan without any selfdestruct or delegatecall opcodes in its source code, then selfdestructed.
Etherscan does not verify the metadata that the solidity compiler appends to the compiled bytecode, and this is still valid bytecode as far as the EVM is concerned.
Anything we hide in the metadata can be jumped to and executed.
See the deployed contract at [0xf8bb3f896f8a69a49e6daad1860106d8a44c3503](https://rinkeby.etherscan.io/address/0xf8bb3f896f8a69a49e6daad1860106d8a44c3503#code).  

The point is to verify / illustrate that metadata is currently treated as valid evm bytecode, but our methods for verifying its validity are lacking.
This also creates other security concerns, in that code comments or local variable names can be changed in misleading ways from the original source code, but the code will still verify on Etherscan.  

See [EIP 2327](https://eips.ethereum.org/EIPS/eip-2327) for a potential solution to this problem.  

### Some details and major limitations
- The code uses solidity 0.4.24. This is a fairly old compiler version, and was used because the current version of solidity does not allow for jumps or direct stack manipulation in assembly. That makes using this pattern maliciously much less viable.
- Etherscan does verify the structure of the metadata.
For solidity 0.4, this structure is
```
0xa1 0x65 'b' 'z' 'z' 'r' '0' 0x58 0x20 <32 bytes swarm hash> 0x00 0x29
```
- We can only replace bytes in the swarm hash, and we also need to be wary of accidental push instructions in the hash, as the EVM will invalidate jumpdests that are within push data.
- [bin/jumper](./bin/jumper) was used to insert the selfdestruct snippet and contains more details on the manipulation of the swarm hash.
