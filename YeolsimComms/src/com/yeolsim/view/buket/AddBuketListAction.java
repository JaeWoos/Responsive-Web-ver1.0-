package com.yeolsim.view.buket;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.buket.BuketService;
import com.yeolsim.service.buket.impl.BuketServiceImpl;
import com.yeolsim.service.domain.Member;


public class AddBuketListAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//int prodNo=Integer.parseInt(request.getParameter("prodNo"));

		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("member");
		int memberNo=member.getMemberNo();
		
		BuketService buketService=new BuketServiceImpl();
		Map<String, Object> map=buketService.getBuketList(memberNo);
		System.out.println(map);
		request.setAttribute("product", map.get("product"));
		request.setAttribute("buket", map.get("buket"));
		
		return "forward:/buket/buketList.jsp";
	}
}