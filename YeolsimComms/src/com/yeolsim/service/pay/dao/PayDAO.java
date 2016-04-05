package com.yeolsim.service.pay.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yeolsim.common.util.DBUtil;
import com.yeolsim.service.domain.Buket;
import com.yeolsim.service.domain.Pay;
import com.yeolsim.service.domain.Product;

public class PayDAO {

	public PayDAO() {
	}
	
	public void insertPay(Pay pay)throws Exception{
		
		Connection con = DBUtil.getConnection();
		String sql = "insert into pay values (seq_pay_pay_no.nextval,?,?)";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, pay.getBuyNo());
		stmt.setString(2, pay.getPayMenu());
		
		stmt.executeUpdate();
		con.close();
	}
	
	public Map<String, Object> addBuketList(int memberNo)throws Exception{
		
		Map<String, Object> map=new HashMap<>();
		
		Connection con = DBUtil.getConnection();
		String sql = "select p.prodName, p.price, p.info, p.pic, t.* from temp t , product p where t.prod_no=P.prod_no and t.member_no=?";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, memberNo);
		
		ResultSet rs=stmt.executeQuery();
		
		List<Buket> buketList=new ArrayList<Buket>();
		List<Product> productList=new ArrayList<Product>();
		while (rs.next()) {
			Buket buket=new Buket();
			buket.setCount(rs.getInt("count"));
			buket.setMemberNo(rs.getInt("member_no"));
			buket.setProdNo(rs.getInt("prod_no"));
			buket.setTotalBuy(rs.getInt("total_buy"));
			buketList.add(buket);
			
			Product product=new Product();
			product.setProdName(rs.getString("prodName"));
			product.setPrice(rs.getInt("price"));
			product.setInfo(rs.getString("info"));
			product.setPic(rs.getString("pic"));
			productList.add(product);
		}
		map.put("buket", buketList);
		map.put("product", productList);
		stmt.executeUpdate();
		con.close();
		
		return map;
	}
}
	
