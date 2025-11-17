# Digital Certificate registry - store and verify certificates


## Project Title
Digital Certificate registry - store and verify certificates


## Project Description
A lightweight smart contract-based registry for issuing, revoking and verifying digital certificates. Certificates metadata (for example certificate PDF or JSON) can be stored off-chain (IPFS/Arweave) and referenced by the contract using a URI/hash. The smart contract maintains an immutable record of issuance and revocation events.


## Project Vision
Enable transparent, tamper-evident certificate issuance and verification for educational institutes, professional bodies, and organizations — reducing fraud and simplifying verification workflows.


## Key Features
- Issue a certificate with a unique certId (off-chain data referenced by URI).
- Revoke a certificate when necessary.
- Verify certificate existence, status (revoked or active), issuer, recipient, and issued timestamp.
- Deterministic certId computation helper to ensure consistent identifiers.


## Future Scope
- Add role-based access (ISSUER role) instead of single owner.
- Integrate EIP-712 signed issuance so issuers can sign certificates off-chain and anyone can submit the signed issuance on-chain.
- Store Merkle roots for bulk certificate issuance to save gas.
- Add on-chain revocation reasons and revocation history.
- Add events indexing via The Graph for fast querying.
- Add ENS or human-readable identifiers for organizations and recipients.
- Add UI and IPFS pinning/hosting of certificate metadata.


---


## How to run (suggested)
1. `npm init -y`
2. `npm install --save-dev hardhat @nomiclabs/hardhat-ethers ethers @openzeppelin/contracts`
3. `npx hardhat` → create a sample project and place `contracts/Project.sol` accordingly.
4. Write deployment script in `scripts/deploy.js` and run `npx hardhat run --network <network> scripts/deploy.js`.
5. Write tests in `test/` and run `npx hardhat test`.

##Contract Address
0x5Ae24C130599C293ea95a7713A8ec3F6b20f264b
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/0016c571-0b39-4b0e-b727-16872a3a9936" />


