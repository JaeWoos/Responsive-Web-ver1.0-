package com.yeolsim.view.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;

public class GetProductAction extends Action {

	public GetProductAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		
		HttpSession session=request.getSession();
		Member member=new Member();
		member=(Member)session.getAttribute("member");

		ProductService service = new ProductServiceImpl();
		//Map<String, Object>map= service.getProductList(member.getMemberNo());
		
		List<Product> list=(List<Product>) service.getProductList(member.getMemberNo()).get("product");
		
		for(int i=0 ; i<list.size(); i++){
			Product product=list.get(i);
			System.out.println("1 ::"+product.getProdNo());
			if(product.getProdNo()==prodNo){
				System.out.println("판매유저");
				Product prod = service.getProduct(prodNo);
				request.setAttribute("product", prod);
				return "forward:/product/loadProduct.jsp";
			}
		}
		System.out.println("2");
		Product prod = service.getProduct(prodNo);
		request.setAttribute("product", prod);
		return "forward:/product/getProduct.jsp";

	}
}


