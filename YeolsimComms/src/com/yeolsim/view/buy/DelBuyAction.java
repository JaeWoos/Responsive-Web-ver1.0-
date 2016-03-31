package com.yeolsim.view.buy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.buy.BuyService;
import com.yeolsim.service.buy.impl.BuyServiceImpl;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;

public class DelBuyAction extends Action {

	public DelBuyAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int buyNo = Integer.parseInt(request.getParameter("buyNo"));
		System.out.println("test1 : "+buyNo);
		
		HttpSession session=request.getSession();
		Member member=new Member();
		member=(Member)session.getAttribute("member");
		
		BuyService buyService=new BuyServiceImpl();
		buyService.delBuy(buyNo);
		
		ProductService service=new ProductServiceImpl();
		Map<String,Object> map=service.getProductList(member.getMemberNo());

		request.setAttribute("product", map.get("product"));
		request.setAttribute("member", map.get("member"));

		return "forward:/Product.jsp";

	}
}


