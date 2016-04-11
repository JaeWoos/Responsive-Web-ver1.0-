package com.yeolsim.service.buy.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yeolsim.common.util.DBUtil;
import com.yeolsim.service.domain.Buy;
import com.yeolsim.service.domain.BuyMember;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Pay;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.member.dao.MemberDao;

public class BuyDAO {

	public BuyDAO() {
	}
	
	public void insertBuy(Buy buy)throws Exception{
		
		Connection con = DBUtil.getConnection();
		String sql = "insert into buy values (seq_buy_buy_no.nextval,?,?,sysdate,? )";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, buy.getMemberNo());
		stmt.setInt(2, buy.getTotalBuy());
		stmt.setInt(3, 1);

		stmt.executeUpdate();
		
		con.close();
	}
	public Buy findBuy(int totalBuy)throws Exception{
		Connection con=DBUtil.getConnection();
		String sql="select *from buy b, temp t where B.TOTAL_BUY=T.TOTAL_BUY and B.TOTAL_BUY=?";
		
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setInt(1, totalBuy);
		
		ResultSet rs=stmt.executeQuery();
		
		Buy buy=new Buy();
		
		while (rs.next()) {
			buy.setBuyNo(rs.getInt("buy_no"));
			buy.setMemberNo(rs.getInt("member_no"));
			buy.setData(rs.getDate("buy_date"));
			buy.setTranNo(rs.getInt("tran_no"));
		}
		con.close();
		
		return buy;
		}
	
	public Map<String, Object> findBuy2(int buyNo)throws Exception{
		Connection con=DBUtil.getConnection();
		String sql="select *from(select *from buy where BUY.BUY_NO=?) b, buymember bm, pay p ";
				sql+=" where B.BUY_NO=BM.BUY_NO and B.BUY_NO=P.BUY_NO ";
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setInt(1, buyNo);
		
		ResultSet rs=stmt.executeQuery();
		
		Map<String, Object> map=new HashMap<String, Object>();
		Buy buy=new Buy();
		BuyMember buyMember=new BuyMember();
		Pay pay=new Pay();
		
		while (rs.next()) {
			buy.setBuyNo(rs.getInt("buy_no"));
			buy.setMemberNo(rs.getInt("member_no"));
			buy.setData(rs.getDate("buy_date"));
			buy.setTranNo(rs.getInt("tran_no"));
			
			buyMember.setAddr(rs.getString("addr"));
			buyMember.setName(rs.getString("name"));
			buyMember.setPhone(rs.getString("phone"));
			
			pay.setPayMenu(rs.getString("pay_menu"));
		}
		map.put("buy", buy);
		map.put("buyMember", buyMember);
		map.put("pay", pay);
		
		con.close();
		rs.close();
		
		return map;
		}
	
	public void delBuy(int buyNo)throws Exception{
		
		Connection con = DBUtil.getConnection();
		int result= 0;
		
		String sql = " delete from buy where buy_no=? ";
		
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setInt(1, buyNo);
		
		result = stmt.executeUpdate();
		System.out.println("del result : "+result);
		
		con.close();
	}
	
	public Map<String, Object> getBuyList(int memberNo)throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		Connection con=DBUtil.getConnection();
		
		String sql="SELECT p.*, T.COUNT, b.* FROM buy b ";
		sql += " INNER JOIN temp t ON B.TOTAL_BUY = T.TOTAL_BUY ";
		sql += "  INNER JOIN product p ON T.PROD_NO = P.PROD_NO ";
		sql += "  where B.MEMBER_NO=? and T.stat=1 order by B.BUY_NO desc";

		PreparedStatement pStmt=con.prepareStatement(sql);
		pStmt.setInt(1, memberNo);

		
		ResultSet rs = pStmt.executeQuery();
	
		List<Product> prodList = new ArrayList<Product>();
		List<Buy> buyList = new ArrayList<Buy>();
		while (rs.next()) {
			Product product=new Product();
			product.setProdNo(rs.getInt("prod_no"));
			product.setMemberNo(rs.getInt("member_no"));
			product.setProdName(rs.getString("prodName"));
			product.setPrice(rs.getInt("price"));
			product.setInfo(rs.getString("info"));
			product.setPic(rs.getString("pic"));
			product.setDate(rs.getDate("data"));
			
			Buy buy=new Buy();
			buy.setBuyNo(rs.getInt("buy_no"));
			buy.setData(rs.getDate("buy_date"));
			buy.setTranNo(rs.getInt("tran_no"));
			buy.setMemberNo(rs.getInt("member_no"));
			buy.setMemberNo(rs.getInt("total_buy"));

			
			prodList.add(product);
			buyList.add(buy);
		}
		MemberDao memberDao=new MemberDao();
		Member member=new Member();
		member=memberDao.findMember(memberNo);
		
		map.put("member", member);
		map.put("product", prodList);
		map.put("buy", buyList);

		rs.close();
		pStmt.close();
		con.close();
		
		return map;
		}

	public List<Product> getProductList()throws Exception{
		
		//Map<String, Object> map=new HashMap<String, Object>();
		
		Connection con=DBUtil.getConnection();
		
		String sql=" select *from product p, member m where p.member_no=m.member_no " ;
		sql += " order by data desc ";

		PreparedStatement pStmt=con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();
	
		List<Product> list = new ArrayList<Product>();
			
		while (rs.next()) {
			Product product=new Product();
			product.setProdNo(rs.getInt("prod_no"));
			product.setMemberNo(rs.getInt("member_no"));
			product.setProdName(rs.getString("prodName"));
			product.setPrice(rs.getInt("price"));
			product.setInfo(rs.getString("info"));
			product.setPic(rs.getString("pic"));
			product.setDate(rs.getDate("data"));

			list.add(product);
		}
		
		//map.put("product", list);

		rs.close();
		pStmt.close();
		con.close();
		
		return list;
		}

}
	
