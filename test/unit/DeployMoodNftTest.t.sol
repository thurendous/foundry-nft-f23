// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() external {
        deployer = new DeployMoodNft();
    }

    function testDeployMoodNft() public {
        deployer.run();
    }

    function testConvertSvgToUri() public {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIiA+CiAgICA8dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0iYmxhY2siPkhpISAgWW91ciBicm93c2VyIGRlY29kZWQgdGhpcyE8L3RleHQ+Cjwvc3ZnPg==";

        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="black">Hi!  Your browser decoded this!</text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
