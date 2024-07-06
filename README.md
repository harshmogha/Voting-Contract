# VotingSystem Contract

This Solidity contract is a simple voting system that demonstrates the basics of Solidity programming and smart contract development on the Ethereum blockchain. The contract allows users to register to vote and cast their votes, with a limit on the total number of votes that can be cast.

## Description

The VotingSystem contract includes the following features:
- Users can register to vote.
- Registered users can cast their votes.
- The total number of votes is tracked and limited to a maximum of 100.

## Getting Started

### Prerequisites

To run this program, you need to have access to Remix, an online Solidity IDE. 

### Running the Contract

1. **Open Remix:**
   - Go to the [Remix website](https://remix.ethereum.org/).

2. **Create a New File:**
   - Click on the "+" icon in the left-hand sidebar to create a new file.
   - Save the file with a `.sol` extension (e.g., `VotingSystem.sol`).

3. **Copy and Paste the Contract Code:**
   - Copy and paste the following Solidity code into the new file:

     ```solidity
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
     ```

4. **Compile the Code:**
   - Click on the "Solidity Compiler" tab in the left-hand sidebar.
   - Ensure the "Compiler" option is set to a compatible version (e.g., `0.8.0`).
   - Click on the "Compile VotingSystem.sol" button.

5. **Deploy the Contract:**
   - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
   - Select the `VotingSystem` contract from the dropdown menu.
   - Click on the "Deploy" button.

6. **Interact with the Contract:**
   - Once the contract is deployed, you can interact with it by calling its functions:
     - `registerToVote`: Registers the sender to vote.
     - `vote`: Allows the registered sender to cast a vote.
     - `getTotalVotes`: Returns the total number of votes cast.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
