package com.yeolsim.service.pay.impl;

import java.util.Map;

import com.yeolsim.service.domain.Pay;
import com.yeolsim.service.pay.PayService;
import com.yeolsim.service.pay.dao.PayDAO;

public class PayServiceImpl implements PayService{

	PayDAO payDAO=new PayDAO();

	@Override
	public void insertPay(Pay pay) throws Exception {
		// TODO Auto-generated method stub
		payDAO.insertPay(pay);
	}

	@Override
	public Map<String, Object> getBuketList(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}