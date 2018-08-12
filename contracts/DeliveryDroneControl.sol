pragma solidity ^0.4.23;

contract DeliveryDroneControl {
    /// @dev account of drone itself
    address drone;
    Status public status;
    Delivery[] public requestQueue;

    struct Delivery { 
        string from; 
        string to;
    }

    enum Status { Idle, Delivering, ToNextDelivery }
    
    /**
     * event
     */
    event DeliveryRequested(string from, string to);

    /**
     * modifier
     */
    modifier onlyCalledByDrone() {
        require(msg.sender == drone);
        _;
    }

     /// @dev constructor, stores the address of the drone
    function DeliveryDroneControl(address _drone) {
         drone = _drone;
    }

     /// @notice request drone delivery from `from` to `to`
    function requestDelivery(
        string from, 
        string to) 
    {
         /// construct the struct 'Delivery' and assign it to storage.
         var queue = requestQueue;
         queue[queue.length++] = Delivery(from, to);
         DeliveryRequested(from , to);
    }

    /**
     * @dev called by the drone to get the next location to fly to
     */
    function getNextLocation() onlyCalledByDrone returns (string) {
        if (requestQueue.length == 0 ) return "";
        // @todo this is not actually a queue
        if(status == Status.Delivering) 
            return requestQueue[0].to;
        else
            return requestQueue[0].from;
    }

    function delivered() onlyCalledByDrone {
        
    }

}