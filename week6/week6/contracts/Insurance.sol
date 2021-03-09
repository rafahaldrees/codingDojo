//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract Insurance  {

    struct Object {
        uint objectId;
        string objectName;
        uint price;
        bool offered;
    }
     
    struct Customer {
        bool isValid;
        uint time;

    }
    
    mapping(uint => Object) public objectIndex;
    mapping(address => mapping(uint => Customer)) public customer;
    
    uint objectCounter;
    
    address payable insOwner;
    constructor() public {
      insOwner = insOwner;
   }
 
    function addProduct(uint _objectId, string memory _objectName, uint _price ) public {
        objectCounter++;
        Object memory newObject =Object(_objectId, _objectName, _price, true);
        objectIndex[objectCounter++] = newObject;
    }
    
    function doNotOffer(uint _objectIndex) public returns(bool) {
        require(msg.sender == insOwner, "no offer");
        return objectIndex[_objectIndex].offered == false;
    }
    
    function forOffer(uint _objectIndex) public returns(bool) {
        require(msg.sender == insOwner, "I'll offer it");
        return objectIndex[_objectIndex].offered ==true;
    }

    function changePrice(uint _objectIndex, uint _price) public view {
        require(objectIndex[_objectIndex].price >= 1, "not valid value" );
        objectIndex[_objectIndex].price== _price;
    }
    // handling the error
    function setPrice (uint _price) public {
        uint price = _price;
        require(insOwner == msg.sender, "you are not the owner");
    }
    
    function customerSelect(uint _objectIndex) public payable returns(bool) {
        require(objectIndex[_objectIndex].price == msg.value, "Not allowed" );
        require(objectIndex[_objectIndex].price == 0, "Not valid value");
        
        Customer memory newCustomer;
        newCustomer.isValid = true;
        newCustomer.time = block.number;
        customer[msg.sender][_objectIndex] = newCustomer;
        payable(insOwner).transfer(msg.value);
        
        }
        
     function buyInsurance(uint _objectIndex) public payable {
        
    } 
        
    } 