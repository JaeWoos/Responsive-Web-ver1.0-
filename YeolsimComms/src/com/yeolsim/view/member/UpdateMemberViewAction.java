package com.yeolsim.view.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.impl.MemberServiceImpl;


public class UpdateMemberViewAction extends Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String memberId=request.getParameter("userId");
		
		MemberService memberService=new MemberServiceImpl();
		Member member=memberService.getMember(memberId);
		
		HttpSession session=request.getSession();
		session.setAttribute("member", member);
		
		return "forward:/member/UpdateMember.jsp";
	}
}