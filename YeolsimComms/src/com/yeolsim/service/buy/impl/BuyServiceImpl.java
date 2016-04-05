package com.yeolsim.service.buy.impl;

import java.util.Map;

import com.yeolsim.service.buy.BuyService;
import com.yeolsim.service.buy.dao.BuyDAO;
import com.yeolsim.service.domain.Buy;
import com.yeolsim.service.domain.Product;

public class BuyServiceImpl implements BuyService{

	BuyDAO buydao=new BuyDAO();
	
	@Override
	public void insertBuy(Buy buy) throws Exception {
		// TODO Auto-generated method stub
		buydao.insertBuy(buy);
	}

	@Override
	public Buy getBuy(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return buydao.findBuy(memberNo);
	}

	@Override
	public void delBuy(int buyNo) throws Exception {
		// TODO Auto-generated method stub
		buydao.delBuy(buyNo);
	}

	@Override
	public Map<String, Object> getBuyList(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return buydao.getBuyList(memberNo);
	}

	@Override
	public Map<String, Object> getAllProductList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}