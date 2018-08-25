pragma solidity ^0.4.0;

interface Regulator {
    function checkValue(uint amount) returns(bool);
    function loan() returns(bool);
    
    }

contract Bank is Regulator {
    
    uint private value;
    address private owner;
    
    modifier ownerFunc{                 // modifier is a Owner based functionality and exception use here
        require(owner == msg.sender);   // This execute first before function execution and requireis use for handle excepton in three way 
        _;
    }
    
    function Bank(uint amount){
        value = amount;
        owner = msg.sender;
    }
    
    function Deposit(uint amount) {
        value += amount;
    }
    
    
    function withdraw(uint amount) {
        
        if(checkValue(amount)) {
            
        value -= amount;
        
        }
    }
    
    function balance() returns(uint) {
        return value;
        
    }
    
    function checkValue(uint amount) returns(bool) {
        return value >= amount;
        
    }
    
    function loan() returns(bool) {
        
        
        return true;
        
    }
    
   
}

contract MyFirstContract is Bank(10) {
    
    string private name;
    
    uint private age;
    
    function setName(string newName) {
        name = newName;
    }
    function getName() returns(string){
        return name;
    }
    
    function setAge(uint newAge) {
        age = newAge;
    }
    function getAge() returns(uint){
        return age;
    }
    
}
contract test{                  // Now All the 4 ways for handling the error using these keyword assert, require, revert and throws
    
    function testAsert()         //  validating functional import in runtime....
    {
        assert(1 == 2);
    }
    function testRequire() 
    {
        require( 2 == 1);           // require no longer consume gas ...may be
    }
    function testRevert()
    {
        revert();               // revert should revert the gas cost of the messg the send
    }
    function testThrow()
    {
        throw;                  // Throw does consume all th gas
    }
}
