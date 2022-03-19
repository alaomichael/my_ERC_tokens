// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ATMToken is ERC20, Ownable {
    constructor() ERC20("ATMToken", "ATM") {
    _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken(address receiver) external payable {
        require(msg.value > 0, "You cannot buy Zero ETH");
        uint256 amount = msg.value * 1000 /10**18;
        _mint(receiver,amount);
    }

}