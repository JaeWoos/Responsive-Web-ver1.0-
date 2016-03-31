package com.yeolsim.view.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yeolsim.framework.Action;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.impl.MemberServiceImpl;


public class CheckDuplicationAction extends Action{

	@Override
	public String execute(HttpServletRequest request,	HttpServletResponse response) throws Exception {

		String userId=request.getParameter("userId");
		
		MemberService userService=new MemberServiceImpl();
		boolean result=userService.checkDuplication(userId);
		
		request.setAttribute("result",new Boolean(result) );
		request.setAttribute("userId", userId);
		
		return "forward:/user/checkDuplication.jsp";
	}
}