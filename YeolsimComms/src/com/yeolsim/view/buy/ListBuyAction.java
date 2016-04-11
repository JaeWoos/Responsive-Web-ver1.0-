package com.yeolsim.view.buy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.membership.MemberImpl;

import com.yeolsim.common.Page;
import com.yeolsim.common.Search;
import com.yeolsim.framework.Action;
import com.yeolsim.service.buy.BuyService;
import com.yeolsim.service.buy.impl.BuyServiceImpl;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.dao.MemberDao;
import com.yeolsim.service.member.impl.MemberServiceImpl;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;

public class ListBuyAction extends Action {

	public ListBuyAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String memberId=request.getParameter("userId");
	
		System.out.println("listProduct memberId="+memberId);
		
		MemberService memberService=new MemberServiceImpl();
		Member member=new Member();
		member=memberService.getMember(memberId);
		int memberNo=member.getMemberNo();
		
		BuyService buyService=new BuyServiceImpl();
		Map<String, Object> map=buyService.getBuyList(memberNo);
		
//		ProductService service=new ProductServiceImpl();
//		Map<String,Object> map=service.getProductList(memberNo);

		request.setAttribute("product", map.get("product"));
		request.setAttribute("buy", map.get("buy"));
		request.setAttribute("member", map.get("member"));

		return "forward:/buy/buyListProduct.jsp";
	}

}
