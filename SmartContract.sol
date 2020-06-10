pragma solidity 0.5.1;

contract PeopleContract {
    uint256 public peopleCount = 0;


    }
    //struct
    struct Person {
        uint id;
        string firstName;
        string lastName;
        unit age;
        bool vegan;
    }
    
    // variable
    address public owner;
    // mapping
    mapping(uint => Person) public people;
    // modifier
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;

    

    constructor() public {
        owner = msg.sender;
    }

    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner{
        incrementCount()
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}
