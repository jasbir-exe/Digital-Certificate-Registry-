// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Project is Ownable {
    constructor() Ownable(msg.sender) {}

    struct Certificate {
        address issuer;
        address recipient;
        string uri;
        uint256 issuedAt;
        bool revoked;
    }

    mapping(bytes32 => Certificate) private certificates;

    event CertificateIssued(bytes32 indexed certId, address indexed issuer, address indexed recipient, string uri, uint256 issuedAt);
    event CertificateRevoked(bytes32 indexed certId, address indexed revokedBy, uint256 revokedAt);

    function issueCertificate(bytes32 certId, address recipient, string calldata uri) external onlyOwner {
        require(certId != bytes32(0), "Invalid certId");
        require(recipient != address(0), "Invalid recipient");
        require(bytes(uri).length > 0, "Invalid uri");
        require(certificates[certId].issuedAt == 0, "Certificate exists");

        certificates[certId] = Certificate({
            issuer: msg.sender,
            recipient: recipient,
            uri: uri,
            issuedAt: block.timestamp,
            revoked: false
        });

        emit CertificateIssued(certId, msg.sender, recipient, uri, block.timestamp);
    }

    function revokeCertificate(bytes32 certId) external onlyOwner {
        require(certificates[certId].issuedAt != 0, "Doesn't exist");
        require(!certificates[certId].revoked, "Revoked");

        certificates[certId].revoked = true;
        emit CertificateRevoked(certId, msg.sender, block.timestamp);
    }

    function verifyCertificate(bytes32 certId) external view returns (
        bool exists,
        bool revoked,
        address issuer,
        address recipient,
        string memory uri,
        uint256 issuedAt
    ) {
        Certificate memory c = certificates[certId];
        if (c.issuedAt == 0) return (false, false, address(0), address(0), "", 0);
        return (true, c.revoked, c.issuer, c.recipient, c.uri, c.issuedAt);
    }

    function computeCertId(address recipient, string calldata uri, uint256 nonce) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(recipient, uri, nonce));
    }
}
