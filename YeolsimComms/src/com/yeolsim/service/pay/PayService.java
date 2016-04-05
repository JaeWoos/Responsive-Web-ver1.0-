package com.yeolsim.service.pay;

import java.util.Map;

import com.yeolsim.service.domain.Pay;


public interface PayService {
	
	public void insertPay(Pay pay) throws Exception;
	public Map<String,Object> getBuketList(int memberNo) throws Exception;
}