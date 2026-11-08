# ⭐ Student Feedback Board dApp

**MG3012 - Blockchain Technology for Business | Assignment 2 (Fall 2026)**

| | |
|---|---|
| **Student** | Safiullah Shakeel |
| **Roll No.** | 24i-5517 |
| **Instructor** | Dr. Usama Arshad |
| **Network** | Ethereum Sepolia testnet (chainId 11155111) |
| **Contract address** | `0xD3F00c78866F8Fb9c450b8097116100696e95EaC` |
| **Etherscan** | https://sepolia.etherscan.io/address/0xD3F00c78866F8Fb9c450b8097116100696e95EaC |
| **Live demo / repo** | [Your GitHub repo link] |

## 📌 Project Description
A mini decentralized application where anyone can post feedback with a 1-5 star rating. Entries are stored permanently on the blockchain and displayed on a web page. The frontend uses **HTML, CSS and JavaScript** with **ethers.js v5.7.2** and **MetaMask**.

## 🧱 Tech Stack
- Solidity ^0.8.20 (Remix IDE)
- Ethereum Sepolia testnet
- HTML5 + CSS3 + JavaScript
- ethers.js v5.7.2 (loaded from CDN)
- MetaMask wallet

## 📂 Project Structure
```
├── SmartContract.sol
├── index.html
├── style.css
├── README.md
└── screenshots/
    ├── 1_deployment.png
    ├── 2_connected.png
    └── 3_transaction.png
```

## 📜 Smart Contract Functions (`FeedbackBoard`)
| Function | Type | Description |
|---|---|---|
| `postFeedback(name, message, rating)` | **write** | Stores a feedback entry (rating must be 1-5) and emits `FeedbackPosted` |
| `clearFeedback()` | **write** (owner only) | Deletes all feedback, protected by the `onlyOwner` modifier |
| `getFeedbackCount()` | **read** | Returns number of entries |
| `getFeedback(index)` | **read** | Returns sender, name, message, rating, timestamp of one entry |
| `getAverageRating()` | **read** | Returns average rating x 100 (e.g. 425 = 4.25) |

Concepts used: `struct`, dynamic array, `mapping`-free storage, `modifier`, `require` validation, `event`, `msg.sender`, `block.timestamp`.

## ▶️ How to Use
1. Click **Connect MetaMask** (the page switches to Sepolia if needed).
2. Press **Refresh Board** to read the count and average (free, no gas).
3. Enter name, message, rating, click **Post Feedback**, confirm in MetaMask.
4. The transaction hash appears with an Etherscan link; the board refreshes after it is mined.


## ✅ Bonus
Contract verified on Etherscan: https://sepolia.etherscan.io/address/0xD3F00c78866F8Fb9c450b8097116100696e95EaC#code (Compiler 0.8.20+, MIT licence).

