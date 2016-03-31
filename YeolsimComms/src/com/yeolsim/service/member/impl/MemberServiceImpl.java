package com.yeolsim.service.member.impl;

import java.util.Map;

import com.yeolsim.common.Search;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.dao.MemberDao;

public class MemberServiceImpl implements MemberService{
	
	///Field
	private MemberDao memberDao;
	
	///Constructor
	public MemberServiceImpl() {
		memberDao=new MemberDao();
	}

	///Method
	public void addMember(Member member) throws Exception {
		memberDao.insertMember(member);
	}

	public Member loginMember(Member member) throws Exception {
		
			Member dbUser=memberDao.findMember(member.getId());
			if(! dbUser.getPassword().equals(member.getPassword())){
				return null;
			}
			return dbUser;
	}

	public Member getMember(String memberId) throws Exception {
		return memberDao.findMember(memberId);
	}

	public Member updateMember(Member member) throws Exception {
		memberDao.updateMember(member);
		Member updateMember=memberDao.findMember(member.getId());
		return updateMember;
	}

	public boolean checkDuplication(String memberId) throws Exception {
		boolean result=true;
		Member user=memberDao.findMember(memberId);
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public Map<String, Object> getMemberList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}