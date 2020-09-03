pragma solidity ^0.6.12;

contract LandRegistry{
    struct Landdata{
        string Owner;
        string Value;
        string RegistrationNo;
        string Price;
    }
    address admin;
    
    constructor() public{
        admin = msg.sender;
        }
    
     mapping(string => Landdata) landdetails;
    
     modifier ifadmin(){
        require(admin == msg.sender);
        _;
        }
        function EnterLandDetails(string memory _RegistrationNo,
                 string memory _Owner,string memory _Value,string memory _Price ) public ifadmin {
                 landdetails[_RegistrationNo].RegistrationNo = _RegistrationNo;
                 landdetails[_RegistrationNo].Owner = _Owner;
                 landdetails[_RegistrationNo].Value = _Value;
                 landdetails[_RegistrationNo].Price = _Price;
        }
        
        function ModifyLandOwner(string memory _RegistrationNo,
                  string memory _newOwner,string memory _newPrice,string memory _newValue  ) public ifadmin {
                 landdetails[_RegistrationNo].Owner = _newOwner;
                 landdetails[_RegistrationNo].Value = _newValue;
                 landdetails[_RegistrationNo].Price = _newPrice;
        }
        
        function GetLandRecords(string memory _RegistrationNo) public view returns(string memory,string memory,string memory,string memory){
            return (
                  landdetails[_RegistrationNo].RegistrationNo,
                  landdetails[_RegistrationNo].Price,
                  landdetails[_RegistrationNo].Owner,
                  landdetails[_RegistrationNo].Value
                       
                );
        }
}
