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
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.member.dao.MemberDao;

public class BuyDAO {

	public BuyDAO() {
	}
	
	public void insertBuy(Buy buy)throws Exception{
		
		Connection con = DBUtil.getConnection();
		String sql = "insert into buy values (seq_buy_buy_no.nextval,?,?,sysdate,?,?)";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, buy.getProdNo());
		stmt.setInt(2, buy.getMemberNo());
		stmt.setInt(3, buy.getTranNo());
		stmt.setInt(4, buy.getBuymemberNo());

		stmt.executeUpdate();
		
		con.close();
	}
	public Buy findBuy(int probNo)throws Exception{
		
		Connection con=DBUtil.getConnection();
		String sql="select *from buy where prod_No=? ";
		
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setInt(1, probNo);
		
		ResultSet rs=stmt.executeQuery();
		
		Buy buy=new Buy();
		
		while (rs.next()) {
			buy.setBuyNo(rs.getInt("buy_no"));
			buy.setProdNo(rs.getInt("prod_no"));
			buy.setMemberNo(rs.getInt("member_no"));
			buy.setData(rs.getDate("buy_date"));
			buy.setTranNo(rs.getInt("tran_no"));
		}
		con.close();
		
		return buy;
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
		
		String sql="select *from buy b, product p where b.buymember_no=?";
		sql += "and b.prod_no=p.prod_no order by buy_date ";

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
			buy.setProdNo(rs.getInt("prod_no"));
			buy.setBuymemberNo(rs.getInt("buymember_no"));
			
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
	
	/*
	private int getTotalCount(String sql) throws Exception {
		
		sql = " SELECT COUNT(*) "+
		          " FROM ( " +sql+ ") countTable ";
		
		Connection con = DBUtil.getConnection();
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();
		
		int totalCount = 0;
		if( rs.next() ){
			totalCount = rs.getInt(1);
		}
		
		pStmt.close();
		con.close();
		rs.close();
		
		return totalCount;
	}
	
	private String makeCurrentPageSql(String sql , Search search){
		sql = 	"SELECT * "+ 
					"FROM (		SELECT inner_table. * ,  ROWNUM AS row_seq " +
									" 	FROM (	"+sql+" ) inner_table "+
									"	WHERE ROWNUM <="+search.getCurruntPage()*search.getPageSize()+" ) " +
					"WHERE row_seq BETWEEN "+((search.getCurruntPage()-1)*search.getPageSize()+1) +" AND "+search.getCurruntPage()*search.getPageSize();
		
		System.out.println("UserDAO :: make SQL :: "+ sql);	
		
		return sql;
	}
*/
}
	
