/**
 * Proof of existence smart contract version 1
 * create a digital notary that stores hashes of documents as proofs of their existence
 */

pragma solidity 0.4.23;
contract ProofOfExistencel{    
    // state
    bytes32 public proof;
    // caculate and store the proof for a document
    /** 
     * transactional function
     */
    function notarize(string document) public {
        proof = proofFor(document);
    }

    //helper function to get a document's sha256
    /**
     * read only function
     */
    function proofFor(string document) constant returns (bytes32) {
        return sha256(document);
    }
}
