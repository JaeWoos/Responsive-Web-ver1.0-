package com.yeolsim.view.buket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.buket.BuketService;
import com.yeolsim.service.buket.impl.BuketServiceImpl;
import com.yeolsim.service.domain.Buket;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;


public class AddBuketAction extends Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int prodNo=Integer.parseInt(request.getParameter("prodNo"));
		int count=Integer.parseInt(request.getParameter("count"));

		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("member");
		int memberNo=member.getMemberNo();
		
		Buket buket=new Buket();
		buket.setCount(count);
		buket.setMemberNo(memberNo);
		buket.setProdNo(prodNo);
		
		BuketService buketService=(BuketService)new BuketServiceImpl();
		buketService.insertBuket(buket);
		
		ProductService service=new ProductServiceImpl();
		Product prod = service.getProduct(prodNo);
		request.setAttribute("product", prod);
		request.setAttribute("addBuket", "1");
		return "forward:/product/getProduct.jsp";

	}
}