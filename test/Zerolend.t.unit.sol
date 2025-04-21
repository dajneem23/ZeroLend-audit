// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import {ZeroLend} from "../contracts/ZeroLend.sol";
import "@forge-std/Test.sol";

contract ZerolendLibTest is Test {
    ZeroLend public zeroLend;

    function setUp() public {
        vm.startPrank(address(0x123));
        zeroLend = new ZeroLend();
        zeroLend.toggleBoostrapMode(false);
    }

    function testInitialValues() public {
        assertEq(zeroLend.deployedAt(), block.timestamp);
        assertEq(zeroLend.paused(), false);
        assertEq(zeroLend.bootstrap(), false);
    }

    function testMint() public {
        uint256 initialBalance = zeroLend.balanceOf(address(this));
        zeroLend.mint(1000, address(this));
        assertEq(zeroLend.balanceOf(address(this)), initialBalance + 1000);
    }
    function testTransfer() public {
        address sender = address(0xb292BE9e0803930cFa361DAA024Fc86Bb7e656D6);
        zeroLend.mint(1000, address(sender));
        uint256 initialBalance = zeroLend.balanceOf(address(sender));
        zeroLend.transfer(address(sender), 500);
        assertEq(zeroLend.balanceOf(address(sender)), initialBalance + 500);
    }
    function testBlacklistedTransfer() public {
        address sender = address(0xb292BE9e0803930cFa361DAA024Fc86Bb7e656D6);
        address recipient = address(0x1234567890123456789012345678901234567890);
        zeroLend.mint(1_000_000_000, address(sender));
        zeroLend.blacklist(address(sender), true);
        vm.startPrank(sender);
        assertEq(zeroLend.blacklisted(address(sender)), true);
        assertEq(zeroLend.balanceOf(address(sender)), 1000000000);
        zeroLend.approve(sender, 5000);

        vm.expectRevert();
        zeroLend.transferFrom(sender, recipient, 500);
    }
}