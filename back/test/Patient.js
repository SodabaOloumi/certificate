const Patient = artifacts.require("Patient");

var accounts;
var owner;

contract('Patient', (accs) => {
    accounts = accs;
    owner = accounts[0];
});

describe('', ()=>{
    it('can Create a Star', async() => {
        let tokenId = 1;
        let instance = await StarNotary.deployed();
        await instance.createStar('Awesome Star!', tokenId, {from: accounts[0]})
        assert.strictEqual(await instance.tokenIdToStarInfo.call(tokenId), 'Awesome Star!')
    });
})


it('lets user1 put up their star for sale', async() => {
    let instance = await StarNotary.deployed();
    let user1 = accounts[1];
    let starId = 2;
    let starPrice = web3.utils.toWei(".01", "ether");
    await instance.createStar('awesome star', starId, {from: user1});
    await instance.putStarUpForSale(starId, starPrice, {from: user1});
    assert.equal(await instance.starsForSale.call(starId), starPrice);
});
