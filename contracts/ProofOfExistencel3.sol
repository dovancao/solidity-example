pragma solidity 0.4.23;

contract ProofOfExistencel3 {
    mapping (bytes32 => bool) private proofs;

    /** store a proof existence in the contract state */
    function storeProof(bytes proof) public {
        proofs[proof] = true;
    }

    /** caculate and store the proof for a document */
    function notarize(string document) public {
        var proof = proofFor(document);
        storeProof(proof);
    }

    // helper function to get a document's sha256
    function proofFor(string document) constant returns (bytes32) {
        return sha256(document);
    }

     // check if a document has been notarized
    function checkDocument(string document) constant returns (bool) {
        var proof = proofFor(document);
        return hasProof(proof);
    }
    
    // returns true if proof is stored
    function hasProof(bytes32 proof) constant returns(bool) {
        return proofs[proof];
    }

}