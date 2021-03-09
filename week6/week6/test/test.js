const Insurance = artifacts.require("Insurance");

contract("Insurance", async function (accounts){
    it(
        "should add a product", async function(){
            let instance = await Insurance.deployed()
            await instance.addProduct("iPhone 11",2019, web3.utils.toWei('7', 'ether'), {from: accounts[0]});
    });
   it(
        "should check it is not offered", async function(){
            let instance = await Insurance.deployed()
               await instance.addProduct("iPhone 11",2019, web3.utils.toWei('7', 'ether'), {from: accounts[0]});
               let getProduct = await instance.doNotOffer(1);
             // assert(getProduct.status === true, "Error: the product is not covered");
    });
    

});