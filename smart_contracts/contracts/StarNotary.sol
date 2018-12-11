pragma solidity ^0.4.23;

import './ERC721TOKEN.sol';

contract StarNotary is ERC721Token { 

    struct Star { 
        string name;
        string starStory;
        string ra;
        string dec;
        string mag;
    }

    struct registeredCoordinates {
    	bool exists;
    }

    mapping(uint256 => uint256) public starsForSale;
    mapping(uint256 => Star) public tokenIdToStarInfo; 
    mapping(uint256 => registeredCoordinates) public checkCoordinates;

    uint[] stars;

    function createStar(string _name, string _starStory, string _ra, string _dec, string _mag) public returns (uint) { 
        Star memory newStar = Star(_name, _starStory, _ra, _dec, _mag);
        registeredCoordinates memory newStarRegistered = registeredCoordinates(true);
        uint coordinates = uint(keccak256(abi.encodePacked(_ra, _dec, _mag)));
        require(!checkCoordinates[coordinates].exists, "Star already registered");

        uint _tokenId = stars.length;
        tokenIdToStarInfo[_tokenId] = newStar;
        checkCoordinates[coordinates] = newStarRegistered;
        stars.push(coordinates);

        ERC721Token.mint(msg.sender, _tokenId);

        return _tokenId;
    }

    function putStarUpForSale(uint256 _tokenId, uint256 _price) public { 
        require(this.ownerOf(_tokenId) == msg.sender, "Only the owner of the star can sell it.");
        starsForSale[_tokenId] = _price;
    }

    function buyStar(uint256 _tokenId) public payable { 
        require(starsForSale[_tokenId] > 0, "This star is not for sale.");

        uint256 starCost = starsForSale[_tokenId];
        address starOwner = this.ownerOf(_tokenId);

        require(msg.value >= starCost, "Insufficient funds.");

        ERC721Token.removeTokenFrom(starOwner, _tokenId);
        ERC721Token.addTokenTo(msg.sender, _tokenId);

        starOwner.transfer(starCost);

        if(msg.value > starCost) { 
            msg.sender.transfer(msg.value - starCost);
        }
    }
}