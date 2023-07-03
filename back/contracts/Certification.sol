// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT

pragma solidity >=0.4.24;



contract Certification {

    Certificate[] private certs;
   
    address owner;
     enum State {
        organization,
        student
    }
      constructor()
    {
      owner = msg.sender;
     
    }

    struct Certificate {
        string candidate_name;
        string last_name;
        string course_name;
        uint256 expiration_date;
        bytes32 id;
    }
    struct User{
        string Name;
        address uAddress;
    }

    mapping (address => User) public users;

    mapping(bytes32 => Certificate) public certificates;


    event certificateGenerated(bytes32 _certificateId);

    modifier isOwner
    {
        require(msg.sender == owner);
        _;
    }

    function addUser(address uadd,string memory name) public isOwner  returns(bool) {
        // check user is exist or no
        require(users[uadd].uAddress == address(0),"this User already Exited");
        
        
        users[uadd] = User({
                Name:name,
                uAddress: uadd
            });  
        //  choose sate 
       // if(keccak256(abi.encodePacked('Organization')) == keccak256(abi.encodePacked(_state))){
         
      //        users[uAddress] = User({
      //          Name:Name,
      //          uAddress: uAddress,
      //          state:State.organization

      //      }); 
             
    //    }else{
     //           users[uAddress] = User({
     //           Name:name,
      //          uAddress:uadd,
       //         state:State.student

       //     });
      //  }
        // add new user
       
        return true;

    } 
   
    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
             //  result := mload(add(source, 32))
                result := keccak256(add(source, 0x20), mload(source))
        }
    }

    function generateCertificate(
        string memory _id,
        string memory _candidate_name,
        string memory _last_name, 
        string memory _course_name, 
        uint256 _expiration_date) public {
        bytes32 byte_id = stringToBytes32(_id);
        require(certificates[byte_id].expiration_date == 0, "Certificate with given id already exists");
        require(users[msg.sender].uAddress == msg.sender,"Caller is not a organization address!");
        certificates[byte_id] = Certificate(_candidate_name, _last_name, _course_name, _expiration_date,byte_id);
         
        addcertificate(byte_id,_candidate_name,_last_name,_course_name,_expiration_date);
        emit certificateGenerated(byte_id);
    }

    function getData(string memory _id) public view returns(string memory, string memory, string memory, uint256,bytes32) {
        bytes32 byte_id = stringToBytes32(_id);
        Certificate memory temp = certificates[byte_id];
        require(temp.expiration_date != 0, "No data exists");
        return (temp.candidate_name, temp.last_name, temp.course_name, temp.expiration_date,temp.id);
    }
   
     function addcertificate(bytes32 _id,
        string memory _candidate_name,
        string memory _last_name, 
        string memory _course_name, 
        uint256 _expiration_date) internal returns(bool) {
            certs.push(
            Certificate({
               candidate_name:_candidate_name,
               last_name:_last_name,
               course_name:_course_name,
               expiration_date: _expiration_date,
               id:_id
            })
        );

        return true;
    }
    function getC() public view returns (Certificate[] memory) {
        return certs;
    }
}