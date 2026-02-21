BasicBlockChain

# BasicBlockChain
#### Author: Varun Nair
## Overview

BasicBlockChain is a simple iOS demonstration project that implements the core ideas of a blockchain using Swift.

The app models transactions between local accounts and uses a blockchain data structure to track balances and maintain an immutable transaction history. It is designed as an educational project — focusing on clarity and core concepts rather than production-level cryptography or networking.

---

## Goals

This project demonstrates:

- Basic blockchain data structures
- Block linking via hashes
- Transaction tracking between accounts
- Chain validation concepts
- Simple iOS app integration using Swift

---

### Core Files

#### `Block.swift`
Defines the fundamental block structure, typically including:

- Index
- Timestamp
- Data / transactions
- Previous block hash
- Current block hash

Each block references the hash of the previous block to ensure chain integrity.

#### `BlockChain.swift`
Implements the blockchain logic:

- Genesis block creation
- Adding new blocks
- Chain storage
- Validation of the chain

#### `ViewController.swift`
Provides the UI layer that interacts with the blockchain logic and demonstrates transaction flow inside the app.

---

## Blockchain Concept (Simplified)

Each block contains data and a cryptographic hash:
`Block(n) -> hash(Block(n-1))`


Because every block depends on the previous hash, modifying one block would invalidate all subsequent blocks — creating immutability.

---

## Requirements

- Xcode (latest recommended version)
- iOS 13+
- Swift 5+

---

## Running the Project

1. Clone or download this repository.
2. Open: `BlockChainApp.xcodeproj`
3. Select an iOS Simulator or connected device.
4. Build and run the app (`Cmd + R`).

---

## Educational Limitations

This project is intentionally minimal and does **not** include:

- Networked nodes
- Peer-to-peer synchronization
- Proof-of-work or mining
- Digital signatures
- Real cryptographic security
- Persistent storage

It is meant for learning blockchain structure fundamentals, not as a production blockchain implementation.

---

## Possible Extensions

If you want to expand the project:

- Add SHA256 hashing using CryptoKit
- Implement proof-of-work
- Add transaction signatures
- Persist the chain locally (CoreData or file storage)
- Simulate multiple nodes
- Add block validation visualization in the UI

---

## License

This project is provided for educational use.
