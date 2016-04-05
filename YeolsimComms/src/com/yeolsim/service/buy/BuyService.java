package com.yeolsim.service.buy;

import java.util.Map;

import com.yeolsim.service.domain.Buy;
import com.yeolsim.service.domain.Product;


public interface BuyService {
	
	public void insertBuy(Buy buy) throws Exception;

	public Buy getBuy(int memberNo) throws Exception;

	public void delBuy(int tranNo) throws Exception;

	public Map<String,Object> getBuyList(int memberNo) throws Exception;

	Map<String, Object> getAllProductList() throws Exception;
	
}