package com.yeolsim.service.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.yeolsim.common.util.DBUtil;
import com.yeolsim.service.domain.Member;

import java.util.List;

public class MemberDao {
	///Field
	
	///Constructor
	public MemberDao() {
	}
	///Method
	public void insertMember(Member member) throws Exception {
		
		Connection con = DBUtil.getConnection();
		String sql = 	"INSERT "+ 
								"INTO MEMBER "+ 
								"VALUES (seq_member_member_no.nextval,?,?,?,?,?,?,?)";
		
		PreparedStatement pStmt = con.prepareStatement(sql);
		pStmt.setString(1, member.getId());
		pStmt.setString(2, member.getPassword());
		pStmt.setString(3, member.getName());
		pStmt.setString(4, member.getPhone());
		pStmt.setString(5, member.getEmail());
		pStmt.setString(6, member.getSex());
		pStmt.setString(7, member.getAddr());
		
		pStmt.executeUpdate();
		
		pStmt.close();
		con.close();
	}

	public Member findMember(String memberId) throws Exception {
		Connection con = DBUtil.getConnection();
		String sql = 	"SELECT "+
								" member_no,id,password,name,phone,email,sex,addr " + 
								"FROM member WHERE ID =?";
		PreparedStatement pStmt = con.prepareStatement(sql);
		pStmt.setString(1, memberId);

		ResultSet rs = pStmt.executeQuery();
		Member member = null;
		
		while (rs.next()) {
			member = new Member();
			member.setMemberNo(rs.getInt("member_no"));
			member.setId(rs.getString("ID"));
			member.setPassword(rs.getString("password"));
			member.setName(rs.getString("name"));
			member.setPhone(rs.getString("phone"));
			member.setEmail(rs.getString("email"));
			member.setSex(rs.getString("sex"));
			member.setAddr(rs.getString("addr"));
		}
		rs.close();
		pStmt.close();
		con.close();
		
		return member;
	}
	
	public Member findMember(int memberNo) throws Exception {
		Connection con = DBUtil.getConnection();
		String sql = 	"SELECT "+
								" member_no,id,password,name,phone,email,sex,addr " + 
								"FROM member WHERE member_no =?";
		PreparedStatement pStmt = con.prepareStatement(sql);
		pStmt.setInt(1, memberNo);

		ResultSet rs = pStmt.executeQuery();
		Member member = null;
		
		while (rs.next()) {
			member = new Member();
			member.setMemberNo(rs.getInt("member_no"));
			member.setId(rs.getString("ID"));
			member.setPassword(rs.getString("password"));
			member.setName(rs.getString("name"));
			member.setPhone(rs.getString("phone"));
			member.setEmail(rs.getString("email"));
			member.setSex(rs.getString("sex"));
			member.setAddr(rs.getString("addr"));
		}
		rs.close();
		pStmt.close();
		con.close();
		
		return member;
	}

	public void updateMember(Member member) throws Exception {
		
		Connection con = DBUtil.getConnection();
		
		String sql = 	"UPDATE member "+
				"SET password = ?, name = ? , phone = ? , email = ? , addr=? "+ 
				"WHERE id = ?";
		
		PreparedStatement pStmt = con.prepareStatement(sql);
		pStmt.setString(1, member.getPassword());
		pStmt.setString(2, member.getName());
		pStmt.setString(3, member.getPhone());
		pStmt.setString(4, member.getEmail());
		pStmt.setString(5, member.getAddr());
		pStmt.setString(6, member.getId());
		pStmt.executeUpdate();
		
		pStmt.close();
		con.close();
	}
	
	public List<Member> getUserList() throws Exception {
		
		//Map<String , Object>  map = new HashMap<String, Object>();
		Connection con = DBUtil.getConnection();
		String sql = "SELECT *FROM  member ";
	
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();

		List<Member> list = new ArrayList<Member>();
		
		while(rs.next()){
			Member member = new Member();
			member.setMemberNo(rs.getInt("member_no"));
			member.setId(rs.getString("ID"));
			member.setPassword(rs.getString("password"));
			member.setName(rs.getString("name"));
			member.setPhone(rs.getString("phone"));
			member.setEmail(rs.getString("email"));
			member.setSex(rs.getString("sex"));
			member.setAddr(rs.getString("addr"));
			
			list.add(member);
		}

		//map.put("list", list);

		rs.close();
		pStmt.close();
		con.close();

		return list;
	}

	
}