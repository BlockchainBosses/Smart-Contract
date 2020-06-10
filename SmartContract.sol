pragma solidity 0.5.1;

// People smart contract
contract People{
    uint256 public peopleCount = 0;
    //struct
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
        uint _age;
        bool _vegan;
    }    
    // variable
    address public owner;
    // mapping
    mapping(uint => Person) public people;
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
    function newPerson(string memory _firstName, string memory _lastName, uint _age, bool _vegan) public onlyOwner{
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName, _age, _vegan);
    }
    //function : increment People count
    function incrementCount() internal {
        peopleCount += 1;
    }
    //function 
    function getCount() public view returns(uint256){
        return peopleCount;
    }
    //function : get FirstName function
    function getFirstName(uint _id) public returns(string memory _firstName){
        return people[_id]._firstName;
    }
}
