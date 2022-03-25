// Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
// https://docs.openzeppelin.com/contracts/3.x/api/token/erc721#IERC721
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// https://ethereum.stackexchange.com/questions/97163/undeclared-identifier-settokenuri-in-erc721
contract MintNFT is ERC721URIStorage, Ownable {
    
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIds;

    // https://ethereum.stackexchange.com/questions/98453/visibility-for-constructor-is-ignored-if-you-want-the-contract-to-be-non-deploy
    constructor() ERC721("MintNFT", "AndyNFT") {}

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}