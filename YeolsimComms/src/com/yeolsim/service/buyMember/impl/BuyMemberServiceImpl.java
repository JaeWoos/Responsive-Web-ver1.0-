package com.yeolsim.service.buyMember.impl;

import java.util.Map;

import com.yeolsim.common.Search;
import com.yeolsim.service.buyMember.BuyMemberService;
import com.yeolsim.service.buyMember.dao.BuyMemberDao;
import com.yeolsim.service.domain.BuyMember;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.dao.MemberDao;

public class BuyMemberServiceImpl implements BuyMemberService{
	
	///Field
	private BuyMemberDao buyMemberDao;
	
	///Constructor
	public BuyMemberServiceImpl() {
		buyMemberDao=new BuyMemberDao();
	}

	@Override
	public void addMember(BuyMember buyMember) throws Exception {
		// TODO Auto-generated method stub
		buyMemberDao.insertBuyMember(buyMember);
	}

	@Override
	public Member loginMember(Member member) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member getMember(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getMemberList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member updateMember(Member member) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkDuplication(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}