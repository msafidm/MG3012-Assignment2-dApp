// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Student Feedback Board
/// @author Safiullah Shakeel
/// @notice Anyone can post feedback with a 1-5 star rating. Feedback is stored permanently on-chain.
/// @dev MG3012 Assignment 2 - 3 read functions + 2 write functions, events, struct, modifier.
contract FeedbackBoard {

    // ------------------------------------
    // Struct to hold each feedback entry
    // ------------------------------------
    struct Feedback {
        address sender;     // Wallet that posted the feedback
        string name;        // Display name
        string message;     // Feedback text
        uint rating;        // 1 to 5 stars
        uint timestamp;     // Time of posting (UNIX)
    }

    // ------------------------------------
    // State variables
    // ------------------------------------
    address public owner;          // Deployer of the contract
    Feedback[] public feedbacks;   // All feedback entries
    uint public totalRating;       // Sum of all ratings (used for the average)

    // ------------------------------------
    // Events
    // ------------------------------------
    event FeedbackPosted(address indexed sender, string name, uint rating, uint timestamp);
    event BoardCleared(address indexed by);

    // ------------------------------------
    // Modifier: only the owner may continue
    // ------------------------------------
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner allowed");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // ------------------------------------
    // WRITE 1: post feedback (sends a transaction)
    // ------------------------------------
    function postFeedback(string memory _name, string memory _message, uint _rating) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(bytes(_message).length > 0, "Message cannot be empty");
        require(bytes(_message).length <= 200, "Message too long (max 200)");
        require(_rating >= 1 && _rating <= 5, "Rating must be 1 to 5");

        feedbacks.push(Feedback(msg.sender, _name, _message, _rating, block.timestamp));
        totalRating += _rating;

        emit FeedbackPosted(msg.sender, _name, _rating, block.timestamp);
    }

    // ------------------------------------
    // WRITE 2: owner clears the board
    // ------------------------------------
    function clearFeedback() public onlyOwner {
        delete feedbacks;
        totalRating = 0;
        emit BoardCleared(msg.sender);
    }

    // ------------------------------------
    // READ 1: number of feedback entries
    // ------------------------------------
    function getFeedbackCount() public view returns (uint) {
        return feedbacks.length;
    }

    // ------------------------------------
    // READ 2: one feedback entry by index
    // ------------------------------------
    function getFeedback(uint index) public view returns (address, string memory, string memory, uint, uint) {
        require(index < feedbacks.length, "Invalid index");
        Feedback memory f = feedbacks[index];
        return (f.sender, f.name, f.message, f.rating, f.timestamp);
    }

    // ------------------------------------
    // READ 3: average rating multiplied by 100 (e.g. 425 = 4.25 stars)
    // ------------------------------------
    function getAverageRating() public view returns (uint) {
        if (feedbacks.length == 0) {
            return 0;
        }
        return (totalRating * 100) / feedbacks.length;
    }
}
