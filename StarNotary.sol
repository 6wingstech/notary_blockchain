pragma solidity ^0.4.23;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

contract StarNotary is ERC721 { 

    struct Star { 
        string name;
        string starStory;
        string ra;
        string dec;
        string mag;
    }

    mapping(address => uint256) public addressToStar; 
    mapping(uint256 => address) public tokenToAddress; 
    mapping(uint256 => uint256) public starsForSale;
    mapping(uint256 => Star) public tokenIdToStarInfo; 
    mapping(uint256 => address) public starApprovals;
    mapping(uint256 => uint256) public coordinatesToStarId;

    // Keep track of all registered stars
    Star[] public stars;

    function createStar(string _name, string _starStory, string _ra, string _dec, string _mag) public returns (uint) { 
        Star memory newStar = Star(_name, _starStory, _ra, _dec, _mag);
        uint coordinates = uint(keccak256(_ra, _dec, _mag));
        // if(coordinatesToStarId[coordinates].isValue) throw;
        address ownerAddress = msg.sender;
        uint _tokenId = stars.length;
        coordinatesToStarId[coordinates] = _tokenId;
        tokenIdToStarInfo[_tokenId] = newStar;
        addressToStar[ownerAddress] = _tokenId;

        stars.push(newStar);

        _mint(msg.sender, _tokenId);

        return _tokenId;
    }

    function putStarUpForSale(uint256 _tokenId, uint256 _price) public { 
        require(this.ownerOf(_tokenId) == msg.sender);
        starsForSale[_tokenId] = _price;
    }

    function buyStar(uint256 _tokenId) public payable { 
        require(starsForSale[_tokenId] > 0);

        uint256 starCost = starsForSale[_tokenId];
        address starOwner = this.ownerOf(_tokenId);
        require(msg.value >= starCost);

        _removeTokenFrom(starOwner, _tokenId);
        _addTokenTo(msg.sender, _tokenId);

        starOwner.transfer(starCost);

        if(msg.value > starCost) { 
            msg.sender.transfer(msg.value - starCost);
        }
    }

    function checkIfStarExists(uint256 _coordinates) private returns (bool) {

    }

    function approve(address _approved, uint256 _tokenId) external payable {
    	starApprovals[_tokenId] = _approved;
    	emit Approval(msg.sender, _approved, _tokenId);
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId) private {
    	require(starApprovals[_tokenId] == msg.sender);
    	address owner = ownerOf(_tokenId);
        tokenToAddress[_tokenId] = _to;
        Transfer(_from, _to, _tokenId);
    }

    function SetApprovalForAll(address _operator, bool _approved) external {

    	emit ApprovalForAll(msg.sender, _operator, _approved);
    }

    function getApproved(uint256 _tokenId) public view returns (address) {

    }

    function isApprovedForAll(address _owner, address _operator) public view returns (bool) {

    }

    function ownerOf(uint256 _tokenId) public view returns (address _owner) {
    	return tokenToAddress[_tokenId];
    }

    function starsForSale() public view returns ({

    }

    function tokenIdToStarInfo(uint256 _tokenId) public view returns (string) {
    	return tokenIdToStarInfo[_tokenId];
    }

}
