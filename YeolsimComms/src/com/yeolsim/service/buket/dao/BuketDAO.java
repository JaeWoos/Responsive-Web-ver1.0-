package com.yeolsim.service.buket.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yeolsim.common.util.DBUtil;
import com.yeolsim.service.domain.Buket;
import com.yeolsim.service.domain.Product;

public class BuketDAO {

	public BuketDAO() {
	}
	
	public void insertBuket(Buket buket)throws Exception{
		
		Connection con = DBUtil.getConnection();
		String sql = "insert into temp values (seq_temp_total_buy.nextval,?,?,?,default)";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, buket.getMemberNo());
		stmt.setInt(2, buket.getProdNo());
		stmt.setInt(3, buket.getCount());
		
		stmt.executeUpdate();
		con.close();
	}
	
	public Buket findBuket1(int memberNo)throws Exception{
		
		Connection con = DBUtil.getConnection();
		String sql = "select *from(select *from temp t order by T.TOTAL_BUY desc) where member_no=? and rownum=1 ";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, memberNo);
		
		ResultSet rs=stmt.executeQuery();
		Buket buket=new Buket();
		
		while(rs.next()){
			buket.setCount(rs.getInt("count"));
			buket.setMemberNo(rs.getInt("member_no"));
			buket.setProdNo(rs.getInt("prod_no"));
			buket.setTotalBuy(rs.getInt("total_buy"));
		}
		stmt.executeUpdate();
		con.close();

		return buket;
	}
	
	public Map<String, Object> findBuket2(int totalBuy)throws Exception{
		
		Connection con = DBUtil.getConnection();
		String sql = "select *from product p, temp t where T.PROD_NO=P.PROD_NO and T.TOTAL_BUY=? ";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, totalBuy);
		
		Map<String, Object> map=new HashMap<>();
		
		ResultSet rs=stmt.executeQuery();
		Buket buket=new Buket();
		
		while(rs.next()){
			buket.setCount(rs.getInt("count"));
			buket.setMemberNo(rs.getInt("member_no"));
			buket.setProdNo(rs.getInt("prod_no"));
			buket.setTotalBuy(rs.getInt("total_buy"));
			map.put("buket", buket);
			
			Product product=new Product();
			product.setProdName(rs.getString("prodName"));
			product.setPrice(rs.getInt("price"));
			product.setInfo(rs.getString("info"));
			product.setPic(rs.getString("pic"));
			product.setProdNo(rs.getInt("prod_no"));
			map.put("product", product);
		}
		stmt.executeUpdate();
		con.close();

		return map;
	}
	
	public Map<String, Object> addBuketList(int memberNo)throws Exception{
		
		Map<String, Object> map=new HashMap<>();
		
		Connection con = DBUtil.getConnection();
		String sql = "select p.prodName, p.price, p.info, p.pic, t.* from temp t , product p ";
				sql+=" where t.prod_no=P.prod_no and t.member_no=? and T.STAT=0 ";
		
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
			product.setProdNo(rs.getInt("prod_no"));
			productList.add(product);
		}
		map.put("buket", buketList);
		map.put("product", productList);
		stmt.executeUpdate();
		con.close();
		
		return map;
	}
	
	public void updateBuket(int totalBuy)throws Exception{
		
		Connection con = DBUtil.getConnection();
		String sql = " UPDATE temp SET stat=1 WHERE total_buy=? ";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, totalBuy);
		
		
		stmt.executeUpdate();
		con.close();

	}
}
	
