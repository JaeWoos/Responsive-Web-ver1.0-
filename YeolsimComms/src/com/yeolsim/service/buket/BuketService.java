package com.yeolsim.service.buket;

import java.util.Map;

import com.yeolsim.service.domain.Buket;


public interface BuketService {
	
	public void insertBuket(Buket buket) throws Exception;
	public Buket findBuket1(int memberNo) throws Exception;
	public Map<String, Object> findBuket2(int totalBuy) throws Exception;
	public void updateBuket(int totalBuy) throws Exception;
	public Map<String,Object> getBuketList(int memberNo) throws Exception;
	
	
}