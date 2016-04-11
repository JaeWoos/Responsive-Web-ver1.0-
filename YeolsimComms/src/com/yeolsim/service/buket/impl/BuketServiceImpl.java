package com.yeolsim.service.buket.impl;

import java.util.Map;

import com.yeolsim.service.buket.BuketService;
import com.yeolsim.service.buket.dao.BuketDAO;
import com.yeolsim.service.domain.Buket;

public class BuketServiceImpl implements BuketService{

	BuketDAO buketDAO=new BuketDAO();
	@Override
	public void insertBuket(Buket buket) throws Exception {
		// TODO Auto-generated method stub
		buketDAO.insertBuket(buket);
		
	}
	@Override
	public Buket findBuket1(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return buketDAO.findBuket1(memberNo);
	}
	
	@Override
	public Map<String, Object> findBuket2(int totalBuy) throws Exception {
		// TODO Auto-generated method stub
		return buketDAO.findBuket2(totalBuy);
	}
	
	@Override
	public Map<String, Object> getBuketList(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return buketDAO.addBuketList(memberNo);
	}
	@Override
	public void updateBuket(int totalBuy) throws Exception {
		// TODO Auto-generated method stub
		buketDAO.updateBuket(totalBuy);
	}
	
	
	
}