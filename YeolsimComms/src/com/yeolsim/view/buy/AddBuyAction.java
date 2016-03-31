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


public class AddBuyAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int prodNo=Integer.parseInt(request.getParameter("prodNo"));
		

		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("member");
		int memberNo=member.getMemberNo();
		
		ProductService productService=new ProductServiceImpl();
		Product product=productService.getProduct(prodNo);
		
		Buy buy=new Buy();
		buy.setProdNo(prodNo);
		buy.setMemberNo(product.getMemberNo());
		buy.setTranNo(1);
		buy.setBuymemberNo(memberNo);
		
		BuyService buyService=new BuyServiceImpl();
		buyService.insertBuy(buy);
		buy.setBuyNo(buyService.getBuy(prodNo).getBuyNo());
		
		request.setAttribute("product", product);
		request.setAttribute("buy", buy);
		
		return "forward:/buy/getBuy.jsp";
	}
}