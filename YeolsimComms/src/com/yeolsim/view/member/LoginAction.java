package com.yeolsim.view.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.impl.MemberServiceImpl;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.dao.ProductDAO;
import com.yeolsim.service.product.impl.ProductServiceImpl;


public class LoginAction extends Action{

	@Override
	public String execute(HttpServletRequest request,	HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		System.out.println("login"+session.getAttribute("member")); 
		if(session.getAttribute("member")==null){

			Member member=new Member();
			member.setId(request.getParameter("userId"));
			member.setPassword(request.getParameter("password"));
			
			System.out.println("login Action" );
					
			MemberService memberService=new MemberServiceImpl();
			if(memberService.loginMember(member)==null){
				System.out.println("비번 틀림");
				return "redirect:/index.jsp";
			}
			else{
				Member dbUser=memberService.loginMember(member);
				session.setAttribute("member", dbUser);
				System.out.println("login session success");
			}
		}else{
			session.getAttribute("member");
		}
			ProductService productService=new ProductServiceImpl();
			Map<String, Object> map =productService.getAllProductList();
				
			request.setAttribute("product", map.get("product"));
			request.setAttribute("member", map.get("member"));
			
			return "forward:/LoginMain.jsp";
		}
	}
