package com.yeolsim.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.member.dao.MemberDao;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.dao.ProductDAO;

public class ProductServiceImpl implements ProductService {

	private ProductDAO productDAO;
	private MemberDao memberDao;
	
	public ProductServiceImpl() {
		// TODO Auto-generated constructor stub
		productDAO=new ProductDAO();
		memberDao=new MemberDao();
	}

	@Override
	public void addProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		productDAO.insertProduct(product);

	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		
		return  productDAO.findProduct(prodNo);
	}
	
	@Override
	public void updateProduct(Product productVO) throws Exception {
		// TODO Auto-generated method stub
		productDAO.updateProduct(productVO);
	}

	@Override
	public Map<String, Object> getProductList(int memberNo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.getProductList(memberNo);

	}
	
	@Override
	public Map<String, Object> getAllProductList() throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
			
		map.put("member", memberDao.getUserList());
		map.put("product", productDAO.getProductList());
				
		return map; 

	}



}
