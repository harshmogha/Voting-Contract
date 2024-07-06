// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    mapping(address => bool) public registeredVoters;
    mapping(address => bool) public hasVoted;
    uint public totalVotes;
    uint public constant MAX_VOTES = 100;

    function registerToVote() public {
        require(!registeredVoters[msg.sender], "You are already registered to vote.");
        registeredVoters[msg.sender] = true;
    }

    function vote() public {
        require(registeredVoters[msg.sender], "You must be registered to vote.");
        require(!hasVoted[msg.sender], "You have already voted.");

        if (totalVotes >= MAX_VOTES) {
            revert("Maximum number of votes reached.");
        }

        hasVoted[msg.sender] = true;
        totalVotes++;

        assert(totalVotes <= MAX_VOTES);
    }

    function getTotalVotes() public view returns (uint) {
        return totalVotes;
    }
}