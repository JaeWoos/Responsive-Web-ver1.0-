package com.yeolsim.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yeolsim.framework.Action;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;

public class UpdateProductViewAction extends Action {

	public UpdateProductViewAction() {
		// TODO Auto-generated constructor stub
	}

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int prodNo=Integer.parseInt(request.getParameter("prodNo"));
				
		ProductService service=new ProductServiceImpl();
		Product product=service.getProduct(prodNo);
		System.out.println("updateProduct:"+product);
		request.setAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}

}
