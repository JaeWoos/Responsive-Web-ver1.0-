package com.yeolsim.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yeolsim.framework.Action;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.dao.MemberDao;
import com.yeolsim.service.member.impl.MemberServiceImpl;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;


public class UpdateProductAction extends Action {

	public UpdateProductAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int prodNo=Integer.parseInt(request.getParameter("prodNo"));
		
		Product product=new Product();
		product.setProdName(request.getParameter("prodName"));
		product.setPrice(Integer.parseInt(request.getParameter("prodPrice")));
		product.setInfo(request.getParameter("prodInfo"));
		product.setCate(request.getParameter("cate"));
		product.setProdNo(prodNo);
		
		
		ProductService service=new ProductServiceImpl();
		service.updateProduct(product);
		
		Product updateProdut=service.getProduct(prodNo);
		int memberNo=updateProdut.getMemberNo();
		MemberDao memberDao=new MemberDao();
		//String memberId=(memberDao.findMember(memberNo)).getId();
		
		request.setAttribute("product", updateProdut);

		
		return "forward:/product/loadProduct.jsp";
	}

}
