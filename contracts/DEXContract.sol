// SPDX-License-Identifier: MIT
pragma solidity >=0.5 <0.5.16;

import "./MTA.sol";
import "./MTB.sol";
import "./MTC.sol";
import "./MTD.sol";

contract DEXContract {

    // enum TokenType{ _MTA, _MTB, _MTC, _MTD }

    MTA public mta;
    MTB public mtb;
    MTC public mtc;
    MTD public mtd;

    event Bought(uint256 amount, string tokenType);
    event Sold(uint256 amount, string tokenType);

    constructor(address mtaAddr, address mtbAddr, address mtcAddr, address mtdAddr) public {
        mta = MTA(mtaAddr);
        mtb = MTB(mtbAddr);
        mtc = MTC(mtcAddr);
        mtd = MTD(mtdAddr);
    }

    function buyMTA() payable public {
        uint256 amountTobuy = msg.value;
            
        uint256 dexBalance = mta.balanceOf(address(this));
        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        mta.transfer(msg.sender, amountTobuy);    

        emit Bought(amountTobuy, "MTA");
    }

    function buyMTB() payable public {
        uint256 amountTobuy = msg.value;

        uint256 dexBalance = mtb.balanceOf(address(this));
        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        mtb.transfer(msg.sender, amountTobuy);

        emit Bought(amountTobuy, "MTB");
    }

    function buyMTC() payable public {
        uint256 amountTobuy = msg.value;

        uint256 dexBalance = mtc.balanceOf(address(this));
        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        mtc.transfer(msg.sender, amountTobuy);

        emit Bought(amountTobuy, "MTC");
    }

    function buyMTD() payable public {
        uint256 amountTobuy = msg.value;

        uint256 dexBalance = mtd.balanceOf(address(this));
        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        mtd.transfer(msg.sender, amountTobuy);

        emit Bought(amountTobuy, "MTD");
    }

    function sellMTA(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = mta.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        mta.transferFrom(msg.sender, address(this), amount);

        msg.sender.transfer(amount);
  
        emit Sold(amount, "MTA");

    }

    function sellMTB(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = mtb.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        mtb.transferFrom(msg.sender, address(this), amount);

        msg.sender.transfer(amount);
  
        emit Sold(amount, "MTB");
    }

    function sellMTC(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = mtc.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        mtc.transferFrom(msg.sender, address(this), amount);

        msg.sender.transfer(amount);
  
        emit Sold(amount, "MTC");
    }

    function sellMTD(uint256 amount) public {

        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = mtd.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        mtd.transferFrom(msg.sender, address(this), amount);

        msg.sender.transfer(amount);
  
        emit Sold(amount, "MTD");
    }

}