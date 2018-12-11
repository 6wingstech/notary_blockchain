# notary_blockchain

This is a decentralized registry for registering a star. Stars can be registered via their name, coordinates, and a story as well.
This app uses the Ethereum blockchain to store registries, and no same star (by coordinates) can be registered twice.
Users can sell their stars to other users, and may also buy other stars that others have for sale.

How to use:

Access the contract via My Ether Wallet contracts, at https://www.myetherwallet.com/#contracts

Enter the smart contract address and ABI below in their respective places.

Select the function and execute via your preferred web3 injector. 


Smart contract deployed on the Rinkeby network at:

	0xbd067d6c1c036c8acabc55e2c31b66dbf49355c1
	
First star created at: 

	0xe14a15e095c2044581ec81e83b49ca6cdca0453076466e242658a6749d759798

Contract ABI:

	[
			{
				"constant": true,
				"inputs": [
					{
						"name": "interfaceId",
						"type": "bytes4"
					}
				],
				"name": "supportsInterface",
				"outputs": [
					{
						"name": "",
						"type": "bool"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [
					{
						"name": "",
						"type": "uint256"
					}
				],
				"name": "starsForSale",
				"outputs": [
					{
						"name": "",
						"type": "uint256"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [
					{
						"name": "_tokenId",
						"type": "uint256"
					}
				],
				"name": "getApproved",
				"outputs": [
					{
						"name": "",
						"type": "address"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "_approved",
						"type": "address"
					},
					{
						"name": "_tokenId",
						"type": "uint256"
					}
				],
				"name": "approve",
				"outputs": [],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [
					{
						"name": "",
						"type": "uint256"
					}
				],
				"name": "tokenIdToStarInfo",
				"outputs": [
					{
						"name": "name",
						"type": "string"
					},
					{
						"name": "starStory",
						"type": "string"
					},
					{
						"name": "ra",
						"type": "string"
					},
					{
						"name": "dec",
						"type": "string"
					},
					{
						"name": "mag",
						"type": "string"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "_from",
						"type": "address"
					},
					{
						"name": "_to",
						"type": "address"
					},
					{
						"name": "_tokenId",
						"type": "uint256"
					}
				],
				"name": "transferFrom",
				"outputs": [],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "_sender",
						"type": "address"
					},
					{
						"name": "_tokenId",
						"type": "uint256"
					}
				],
				"name": "mint",
				"outputs": [],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "from",
						"type": "address"
					},
					{
						"name": "to",
						"type": "address"
					},
					{
						"name": "tokenId",
						"type": "uint256"
					}
				],
				"name": "safeTransferFrom",
				"outputs": [],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [
					{
						"name": "_tokenId",
						"type": "uint256"
					}
				],
				"name": "ownerOf",
				"outputs": [
					{
						"name": "",
						"type": "address"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [
					{
						"name": "owner",
						"type": "address"
					}
				],
				"name": "balanceOf",
				"outputs": [
					{
						"name": "",
						"type": "uint256"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "_user",
						"type": "address"
					},
					{
						"name": "_approved",
						"type": "bool"
					}
				],
				"name": "setApprovalForAll",
				"outputs": [],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [
					{
						"name": "",
						"type": "uint256"
					}
				],
				"name": "checkCoordinates",
				"outputs": [
					{
						"name": "exists",
						"type": "bool"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "from",
						"type": "address"
					},
					{
						"name": "to",
						"type": "address"
					},
					{
						"name": "tokenId",
						"type": "uint256"
					},
					{
						"name": "_data",
						"type": "bytes"
					}
				],
				"name": "safeTransferFrom",
				"outputs": [],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": true,
				"inputs": [
					{
						"name": "_owner",
						"type": "address"
					},
					{
						"name": "_user",
						"type": "address"
					}
				],
				"name": "isApprovedForAll",
				"outputs": [
					{
						"name": "",
						"type": "bool"
					}
				],
				"payable": false,
				"stateMutability": "view",
				"type": "function"
			},
			{
				"anonymous": false,
				"inputs": [
					{
						"indexed": true,
						"name": "from",
						"type": "address"
					},
					{
						"indexed": true,
						"name": "to",
						"type": "address"
					},
					{
						"indexed": true,
						"name": "tokenId",
						"type": "uint256"
					}
				],
				"name": "Transfer",
				"type": "event"
			},
			{
				"anonymous": false,
				"inputs": [
					{
						"indexed": true,
						"name": "owner",
						"type": "address"
					},
					{
						"indexed": true,
						"name": "approved",
						"type": "address"
					},
					{
						"indexed": true,
						"name": "tokenId",
						"type": "uint256"
					}
				],
				"name": "Approval",
				"type": "event"
			},
			{
				"anonymous": false,
				"inputs": [
					{
						"indexed": true,
						"name": "owner",
						"type": "address"
					},
					{
						"indexed": true,
						"name": "operator",
						"type": "address"
					},
					{
						"indexed": false,
						"name": "approved",
						"type": "bool"
					}
				],
				"name": "ApprovalForAll",
				"type": "event"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "_name",
						"type": "string"
					},
					{
						"name": "_starStory",
						"type": "string"
					},
					{
						"name": "_ra",
						"type": "string"
					},
					{
						"name": "_dec",
						"type": "string"
					},
					{
						"name": "_mag",
						"type": "string"
					}
				],
				"name": "createStar",
				"outputs": [
					{
						"name": "",
						"type": "uint256"
					}
				],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "_tokenId",
						"type": "uint256"
					},
					{
						"name": "_price",
						"type": "uint256"
					}
				],
				"name": "putStarUpForSale",
				"outputs": [],
				"payable": false,
				"stateMutability": "nonpayable",
				"type": "function"
			},
			{
				"constant": false,
				"inputs": [
					{
						"name": "_tokenId",
						"type": "uint256"
					}
				],
				"name": "buyStar",
				"outputs": [],
				"payable": true,
				"stateMutability": "payable",
				"type": "function"
			}
		]
