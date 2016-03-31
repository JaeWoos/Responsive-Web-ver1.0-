package com.yeolsim.view.buy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.buy.BuyService;
import com.yeolsim.service.buy.impl.BuyServiceImpl;
import com.yeolsim.service.domain.Buy;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;

public class GetBuyAction extends Action {

	public GetBuyAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		
		HttpSession session=request.getSession();
		Member member=new Member();
		member=(Member)session.getAttribute("member");
		ProductService productService = new ProductServiceImpl();
		Product product=productService.getProduct(prodNo);
		System.out.println("getBUY test:"+product);
		
		BuyService buyService=new BuyServiceImpl();
		Buy buy=buyService.getBuy(prodNo);
		
		request.setAttribute("product", product);
		request.setAttribute("member", member);
		request.setAttribute("buy", buy);
		
		return "forward:/buy/getBuy.jsp";

	}
}


