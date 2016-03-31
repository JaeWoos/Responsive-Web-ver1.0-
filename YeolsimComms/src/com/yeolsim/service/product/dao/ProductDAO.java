package com.yeolsim.service.product.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yeolsim.common.util.DBUtil;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.dao.MemberDao;
import com.yeolsim.service.member.impl.MemberServiceImpl;

public class ProductDAO {

	public ProductDAO() {
	}
	
	public void insertProduct(Product product)throws Exception{
		
		Connection con = DBUtil.getConnection();
		
		System.out.println("ProductDao ="+product);
		
		String sql = "insert into product values (seq_product_prod_no.nextval,?,?,?,?,?,sysdate,0,?)";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, product.getMemberNo());
		stmt.setString(2, product.getProdName());
		stmt.setInt(3, product.getPrice());
		stmt.setString(4, product.getInfo());
		stmt.setString(5, product.getPic());
		stmt.setString(6, product.getCate());
		

		stmt.executeUpdate();
		
		con.close();
		
	}
	public Product findProduct(int probNo)throws Exception{
		
		Connection con=DBUtil.getConnection();
		
		String sql="select *from product where prod_No=? ";
		
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setInt(1, probNo);
		
		ResultSet rs=stmt.executeQuery();
		
		Product product=null;
		
		while (rs.next()) {
			product=new Product();
			product.setProdName(rs.getString("prodname"));
			product.setInfo(rs.getString("info"));
			product.setPic(rs.getString("pic"));
			product.setProdNo(rs.getInt("prod_no"));
			product.setMemberNo(rs.getInt("member_no"));
			product.setPrice(rs.getInt("price"));
			product.setDate(rs.getDate("data"));
		}
		con.close();
		
		return product;
		}
	
	public void updateProduct(Product product)throws Exception{
		Connection con = DBUtil.getConnection();
		int result= 0;

		String sql = "update product set prodname=? , info=? , price=? , cate=? "
				+"where prod_no=? ";
		
		System.out.println("Update DAO"+product);
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1, product.getProdName());
		stmt.setString(2, product.getInfo());
		stmt.setInt(3, product.getPrice());
		stmt.setString(4, product.getCate());
		stmt.setInt(5, product.getProdNo());
		
		result = stmt.executeUpdate();
		
		System.out.println("update result : "+result);
		if(result == 1) {
			System.out.println("update success");
		} else {
			System.out.println(product);
		}
		con.close();
	}
	
	public void deleteProduct(Product product)throws Exception{
		Connection con = DBUtil.getConnection();
		int result= 0;

		String sql = "update product set prodname=? , info=? , price=? "
				+"where prod_no=? ";
		
		System.out.println("Update DAO"+product);
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1, product.getProdName());
		stmt.setString(2, product.getInfo());
		stmt.setInt(3, product.getPrice());
		stmt.setInt(4, product.getProdNo());
		
		result = stmt.executeUpdate();
		
		System.out.println("update result : "+result);
		if(result == 1) {
			System.out.println("update success");
		} else {
			System.out.println(product);
		}
		con.close();
	}


	public Map<String, Object> getProductList(int memberNo)throws Exception{
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		Connection con=DBUtil.getConnection();
		
		String sql="select *from product where member_no= ?";
		sql += " order by data ";

		PreparedStatement pStmt=con.prepareStatement(sql);
		pStmt.setInt(1, memberNo);
		
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
		MemberDao memberDao=new MemberDao();
		Member member=new Member();
		member=memberDao.findMember(memberNo);
		
		map.put("member", member);
		map.put("product", list);

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
	
