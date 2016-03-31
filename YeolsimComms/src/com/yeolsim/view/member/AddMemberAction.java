package com.yeolsim.view.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yeolsim.framework.Action;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.impl.MemberServiceImpl;


public class AddMemberAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Member member=new Member();
		
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("excludeHangul"));
		member.setName(request.getParameter("name"));
		member.setPhone(request.getParameter("phoneNumber"));
		member.setEmail(request.getParameter("email"));
		member.setSex(request.getParameter("gender"));
		member.setAddr(request.getParameter("Addr"));
		
		System.out.println("AddUserAction ::"+member.getId());
		
		MemberService memberService=new MemberServiceImpl();
		memberService.addMember(member);

		
		return "redirect:/LoginMain.jsp";
	}
}