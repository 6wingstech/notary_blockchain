const ERC721Token = artifacts.require('ERC721TOKEN')

contract('ERC721Token', accounts => { 
    var defaultAccount = accounts[0]
    var user1 = accounts[1]
    var user2 = accounts[2]
    var operator = accounts[3]

    beforeEach(async function() { 
        this.contract = await ERC721Token.new({from: defaultAccount})
    })

    describe('can create a token', () => { 
        let tokenId = 1
        let tx

        beforeEach(async function () { 
            tx = await this.contract.mint(user1, tokenId, {from: user1})
        })

        it('owner Of tokenId is user1', async function () { 
            assert.equal(await this.contract.ownerOf(tokenId), user1)
        })

        it('balanceOf user1 increases', async function () { 
           assert.equal(await this.contract.balanceOf(user1), 1)
        })
    })

    describe('can transfer token', () => { 
        let tokenId = 1
        let tx 

        beforeEach(async function () { 
            await this.contract.mint(user1, tokenId, {from: user1})
            tx = await this.contract.transferFrom(user1, user2, tokenId, {from: user1})
        })

        it('token transferred correctly.', async function () { 
            assert.equal(await this.contract.ownerOf(tokenId), user2)
        })

        it('only permissioned users can transfer tokens.', async function() {
            expectThrow(this.contract.transferFrom(user1, user2, tokenId, {from: user1}))
        })
    })

    describe('can grant approval to transfer', () => { 
        let tokenId = 1
        let tx 

        beforeEach(async function () { 
            await this.contract.mint(user1, tokenId, {from: user1})
            tx = await this.contract.approve(user2, tokenId, {from: user1})
        })

        it('target user can now transfer tokens', async function () {
            assert.equal(await this.contract.getApproved(tokenId), user2)
        })
    })

    describe('can set an operator', () => { 
        let tokenId = 1
        let tx 

        beforeEach(async function () { 
            await this.contract.mint(tokenId, user1, {from: user1})
            tx = await this.contract.setApprovalForAll(operator, true, {from: user1})
        })

        it('can be set as an operator', async function () { 
           assert.equal(await this.contract.isApprovedForAll(user1, operator), true)
        })
    })
})

var expectThrow = async function(promise) { 
    try { 
        await promise
    } catch (error) { 
        assert.exists(error)
        return
    }
}
