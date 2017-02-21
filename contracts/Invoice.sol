pragma solidity ^0.4.4;
import 'common/Object.sol';
import './Comission.sol';

contract Invoice is Object {
    address   public signer;
    uint      public closeBlock;

    Comission public comission;
    string    public description;
    uint      public value;

    /**
     * @dev Offer type contract
     * @param _comission Comission handler address
     * @param _description Deal description
     * @param _value Deal value
     */
    function Invoice(address _comission,
                     string  _description,
                     uint    _value) {
        comission   = Comission(_comission);
        description = _description;
        value       = _value;
    }

    /**
     * @dev Call me to withdraw money
     */
    function withdraw() onlyOwner {
        if (closeBlock != 0) {
            if (!comission.process.value(value)(owner)) throw;
        }
    }

    /**
     * @dev Payment fallback function
     */
    function () payable {
        // Condition check
        if (msg.value != value
           || closeBlock != 0) throw;

        // Store block when closed
        closeBlock = block.number;
        signer = msg.sender;
        PaymentReceived();
    }
    
    /**
     * @dev Payment notification
     */
    event PaymentReceived();
}
