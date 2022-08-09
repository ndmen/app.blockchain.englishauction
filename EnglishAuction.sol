// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IERC721 {
    function safeTransferFrom(
        address from,
        address to,
        uint tokenId
    ) external;

    function transferFrom(
        address,
        address,
        uint
    ) external;
}

contract EnglishAuction {
    event Start();
    event Bid(address indexed sender, uint amount);
    event Withdraw(address indexed bidder, uint amount);
    event End(address winner, uint amount);

    IERC721 public nft;
    uint public nftId;

    address payable public seller;
    uint public endAt;
    bool public started;
    bool public ended;

    address public highestBigger;
    uint public highestBid;
    mapping(address => uint) public bids;

    constructor(
        address _ntf,
        uint _nftId,
        uint _startingBid
    ) {
        nft = IERC721(_ntf);
        nftId = _nftId;

        seller = payable(msg.sender);
        highestBid = _startingBid;
    }
}