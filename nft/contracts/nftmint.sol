// SPDX-License-Identifier: MIT

// Smart contract that lets anyone deposit ETH into the contract
// Only the owner of the contract can withdraw the ETH
pragma solidity ^0.8.4;

// Get the latest ETH/USD price from chainlink price feed

// IMPORTANT: This contract has been updated to use the Goerli testnet
// Please see: https://docs.chain.link/docs/get-the-latest-price/
// For more information

//import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
//import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Unacademy is ERC721Enumerable, Ownable{
    // safe math library check uint256 for integer overflows
    //using SafeMathChainlink for uint256;

    //mapping to store which address depositeded how much ETH
    mapping(address => uint256) public addressToAmountFunded;
    mapping(address => bool) public verify;
    // array of addresses who deposited
    address[] public students;
    //address of the owner (who deployed the contract)
    address payable ownerr;
    string _baseTokenURI;
    uint256 public tokenIds;
    // the first person to deploy the contract is
    // the owner
    constructor(string memory baseURI) ERC721("images", "LW3P") {
        _baseTokenURI = baseURI;
        ownerr = payable(msg.sender);
        //_baseTokenURI = baseURI;

    }

    function fund() public payable {
        // 18 digit number to be compared with donated amount
        uint256 minimumUSD = 1 * 10**18;

        //is the donated amount less than 50USD?
        require(
            (msg.value) >= 1,
            "You need to spend more ETH!"
        );
        //if not, add to mapping and funders array
        tokenIds+=1;
        addressToAmountFunded[msg.sender] += msg.value;
        students.push(msg.sender);
        verify[msg.sender] = true;
        _safeMint(msg.sender, tokenIds);
    }

   function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        // Here it checks if the length of the baseURI is greater than 0, if it is return the baseURI and attach
        // the tokenIds and `.json` to it so that it knows the location of the metadata json file for a given
        // tokenIds stored on IPFS
        // If baseURI is empty return an empty string
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, Strings.toString(tokenId), ".json")) : "";
    }

    function StudentinCourse(address check) public view returns (bool) {
        return verify[check];
    }

    //function to get the version of the chainlink pricefeed
    //function getVersion() public view returns (uint256) {
       // AggregatorV3Interface priceFeed = AggregatorV3Interface(
          //  0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
      //  );
       // return priceFeed.version();
    //}

    //function getPrice() public view returns (uint256) {
        //AggregatorV3Interface priceFeed = AggregatorV3Interface(
        //    0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
       // );
       // (, int256 answer, , , ) = priceFeed.latestRoundData();
        // ETH/USD rate in 18 digit
      //  return uint256(answer * 10000000000);
    //}

    // 1000000000
  //  function getConversionRate(uint256 ethAmount)
  //      public
   //     view
   //     returns (uint256)
    //{
      //  uint256 ethPrice = getPrice();
       // uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
     //   // the actual ETH/USD conversation rate, after adjusting the extra 0s.
    //    return ethAmountInUsd;
   // }

    //modifier: https://medium.com/coinmonks/solidity-tutorial-all-about-modifiers-a86cf81c14cb
   // modifier onlyOwner() {
        //is the message sender owner of the contract?
     //   require(msg.sender == owner);

      //  _;
   // }

    // onlyOwner modifer will first check the condition inside it
    // and
    // if true, withdraw function will be executed
    function withdraw() public payable onlyOwner {
        ownerr.transfer(address(this).balance);

        //iterate through all the mappings and make them 0
        //since all the deposited amount has been withdrawn
        for (
            uint256 funderIndex = 0;
            funderIndex < students.length;
            funderIndex++
        ) {
            address funder = students[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //funders array will be initialized to 0
            students = new address[](0);
    }
    // receive() external payable {
    //     // custom function ncode
    // }
}