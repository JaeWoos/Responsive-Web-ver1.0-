package com.yeolsim.view.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.impl.MemberServiceImpl;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.dao.ProductDAO;
import com.yeolsim.service.product.impl.ProductServiceImpl;


public class UpdateMemberAction extends Action {

	@Override
	public String execute(HttpServletRequest request,	HttpServletResponse response) throws Exception {
		
		String memberId=request.getParameter("id");
		System.out.println("update test1 +"+memberId);
		Member member=new Member();
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("excludeHangul"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phoneNumber"));
		member.setAddr(request.getParameter("Addr"));
		
		MemberService memberService=new MemberServiceImpl();
		Member updateMember=memberService.updateMember(member);
	
		
		HttpSession session=request.getSession();
		String id=((Member)session.getAttribute("member")).getId();
		
		ProductService productService=new ProductServiceImpl();
		Map<String,Object> map=productService.getProductList((updateMember.getMemberNo()));
				
		request.setAttribute("product", map.get("product"));
		if(id.equals(memberId)){
			session.setAttribute("member", member);
		}
		
		return "forward:/Product.jsp";
	}
}