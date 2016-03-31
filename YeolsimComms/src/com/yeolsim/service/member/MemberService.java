package com.yeolsim.service.member;

import java.util.Map;

import com.yeolsim.common.Search;
import com.yeolsim.service.domain.Member;



public interface MemberService {
	
	public void addMember(Member member) throws Exception;
	
	public Member loginMember(Member member) throws Exception;
	
	public Member getMember(String memberId) throws Exception;
	
	public Map<String, Object> getMemberList(Search search) throws Exception;
	
	public Member updateMember(Member member) throws Exception;
	
	public boolean checkDuplication(String memberId) throws Exception;
	
}