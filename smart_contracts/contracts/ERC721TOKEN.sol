pragma solidity ^0.4.23;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

contract ERC721Token is ERC721 {

    mapping (uint256 => address) private tokenToOwner;
    mapping (address => uint256) private ownerToBalance;
    mapping (uint256 => address) private approved;
    mapping (address => mapping (address => bool)) private approvedUsers;

    function mint(address _sender, uint256 _tokenId) public { 
        require(_sender != address(0));
        require(tokenToOwner[_tokenId] == address(0));
        tokenToOwner[_tokenId] = _sender;
        ownerToBalance[_sender] = ownerToBalance[_sender].add(1);
        emit Transfer(address(0), _sender, _tokenId);
    }

    function approve(address _approved, uint256 _tokenId) public { 
        address owner = ownerOf(_tokenId);
        require(_approved != owner);
        require(msg.sender == owner || isApprovedForAll(owner, msg.sender));
        approved[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    }

    function setApprovalForAll(address _user, bool _approved) public { 
        require(_user != msg.sender);
        approvedUsers[msg.sender][_user] = _approved;
        emit ApprovalForAll(msg.sender, _user, _approved);
    }

    function getApproved(uint256 _tokenId) public view returns (address) { 
        return approved[_tokenId];
    }

    function isApprovedForAll(address _owner, address _user) public view returns (bool) { 
        return approvedUsers[_owner][_user];
    }

    function ownerOf(uint256 _tokenId) public view returns (address) { 
        return tokenToOwner[_tokenId];
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public {
        require(_isApprovedOrOwner(msg.sender, _tokenId));
        require(msg.sender != address(0));
        transferFromHelper(_from, _to, _tokenId);
    }

    function transferFromHelper(address _from, address _to, uint256 _tokenId) internal { 
        tokenToOwner[_tokenId] = _to; 
        ownerToBalance[_from] -= 1;
        emit Transfer(_from, _to, _tokenId);
    }

    function removeTokenFrom(address _from, uint256 _tokenId) internal {
        require(ownerOf(_tokenId) == _from);
        ownerToBalance[_from] = ownerToBalance[_from].sub(1);
        tokenToOwner[_tokenId] = address(0);
    }

    function addTokenTo(address _from, uint256 _tokenId) internal {
        require(tokenToOwner[_tokenId] == address(0));
        tokenToOwner[_tokenId] = _from;
        ownerToBalance[_from] = ownerToBalance[_from].add(1);
    }

}
