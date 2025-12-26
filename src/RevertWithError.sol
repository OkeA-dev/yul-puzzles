// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithError {
    function main() external pure {
        bytes32 selector = bytes32(abi.encodeWithSignature("Error(string)","RevertRevert"));
        assembly {
            // revert the function with an error of type `Error(string)`
            // use "RevertRevert" as error message
            // Hint: The error type is a predefined four bytes. See https://www.rareskills.io/post/try-catch-solidity
            mstore(0x00, selector)
            mstore(0x04, 0x20) // Store offset to string (32)
            mstore(0x24, 0x0c) // Store length of string (12)
            mstore(0x44, 0x5265766572745265766572740000000000000000000000000000000000000000) // Store "RevertRevert" padded
            revert(0x00, 0x64) // Revert with 100 bytes
        }
    }
}
