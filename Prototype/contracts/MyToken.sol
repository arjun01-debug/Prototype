pragma solidity ^0.5.16;

//Contract for prototype
contract MyToken{

    string public constant name = "FilCoin";
    string public constant symbol = "FiC";
    uint public constant decimal = 18;
    uint public total_supply = 0;

    //creating a map to keep the token balance of each individual
    mapping(address => uint) token_balance;

    //creating a map to keep the track of activities completed
    mapping(address => string[]) activities_comp;

    //function to provide the token blance of a user
    function balanceOf(address user) public view returns(uint){
        return token_balance[user];
    }

    //function to provide the total supply of coins available in the network
    function tokens_network() public view returns(uint){
        return total_supply;
    }

    //function to update the token balance of a user on completion of an activity
    function activities(string memory activity) public returns(uint){
        
        if(keccak256(bytes(activity)) == keccak256(bytes("reading"))){
            token_balance[msg.sender] +=10;
            total_supply +=10;
            activities_comp[msg.sender].push("reading");
            return 1;
        }

        else if(keccak256(bytes(activity)) == keccak256(bytes("blog"))){
            token_balance[msg.sender] +=20;
            total_supply +=20;
            activities_comp[msg.sender].push("blog");
            return 2;
        }

        else if(keccak256(bytes(activity)) == keccak256(bytes("webinar"))){
            token_balance[msg.sender] +=30;
            total_supply +=30;
            activities_comp[msg.sender].push("webinar");
            return 3;
        }

    }

    //function to check the activities compeleted by the user present at a particular index
    function acti_comp(uint ind) public view returns(string memory){
        return activities_comp[msg.sender][ind];
    }

}  