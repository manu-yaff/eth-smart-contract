// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC20/extensions/ERC20Burnable.sol";

//import "@openzeppelin/contracts@4.7.3/access/Ownable.sol";

contract BeerMexicanPeso is ERC20, ERC20Burnable {
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() ERC20("Beer Mexican Peso", "MXN") {
        owner = msg.sender;
        //1000 * 10 ** decimals()
        _mint(msg.sender, 1000);
    }

    function __mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /*
    function __send (address _addr, uint256 amount) public
    {
        transfer (_addr, amount);
    }    
    */

    function __transferTo(address _addr, uint256 amount) public {
        transfer(_addr, amount);
    }

    function __getBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
