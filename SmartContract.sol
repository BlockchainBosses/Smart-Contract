pragma solidity 0.5.1;

// People smart contract
contract People{
    uint256 public peopleCount = 0;
    //struct
    struct Person {
        string _firstName;
        string _lastName;
        uint _age;
        bool _vegan;
    }    
    // variable
    address public owner;
    // mapping
    mapping(address => Person) public people;
    // modifier
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;   
    }
    // event
    event New(address people, string _firstName, string _lastName, uint _age, bool _vegan);
    // constructor
    constructor() public {
        owner = msg.sender;
    }
    //function : newperson
    function newPerson(string memory _firstName, string memory _lastName) public onlyOwner{
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    //function : increment People count
    function incrementCount() internal {
        peopleCount += 1;
    }
    //function 
    function getCount() public pure returns(uint256){
        return peopleCount;
    }
    //function : get FirstName function
    function getFirstName(address _address) public returns(string _firstName){
        return people[_address]._firstName;
    }
}
