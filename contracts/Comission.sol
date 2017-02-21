pragma solidity ^0.4.4;
import 'common/Object.sol';

contract Comission is Object {
    address public taxman;
    uint    public taxPerc;

    /**
     * @dev Comission contract constructor
     * @param _taxman Tax receiver account
     * @param _taxPerc Processing tax in percent
     */
    function Comission(address _taxman, uint _taxPerc) {
        taxman  = _taxman;
        taxPerc = _taxPerc;
    }

    /**
     * @dev Process payment with comission
     * @param _destination Destination account
     */
    function process(address _destination) payable returns (bool) {
        // Handle value below 100 isn't possible
        if (msg.value < 100) throw;

        var tax = msg.value * taxPerc / 100; 
        if ( !taxman.send(tax)
          || !_destination.send(msg.value - tax)
           ) throw;
        return true;
    }
}
