package com.yeolsim.service.product;

import java.util.Map;

import com.yeolsim.common.Search;
import com.yeolsim.service.domain.Product;


public interface ProductService {
	
	public void addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public void updateProduct(Product productVO) throws Exception;

	public Map<String,Object> getProductList(int memberNo) throws Exception;

	Map<String, Object> getAllProductList() throws Exception;
	
}