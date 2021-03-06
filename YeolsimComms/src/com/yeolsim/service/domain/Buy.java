package com.yeolsim.service.domain;

import java.sql.Date;


public class Buy {
	
	///Field
	private int buyNo;
	private int memberNo;
	private int totalBuy;
	private int tranNo;
	private Date data;

	///Constructor
	public Buy(){
	}

	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getTotalBuy() {
		return totalBuy;
	}

	public void setTotalBuy(int totalBuy) {
		this.totalBuy = totalBuy;
	}

	public int getTranNo() {
		return tranNo;
	}

	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "Buy [buyNo=" + buyNo + ", memberNo=" + memberNo + ", totalBuy=" + totalBuy + ", tranNo=" + tranNo
				+ ", data=" + data + "]";
	}
}