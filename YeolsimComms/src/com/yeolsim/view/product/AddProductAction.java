package com.yeolsim.view.product;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yeolsim.framework.Action;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.member.MemberService;
import com.yeolsim.service.member.impl.MemberServiceImpl;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;

public class AddProductAction extends Action {

	public AddProductAction() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String savePath = request.getServletContext().getRealPath("img");
		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr",
	 				new DefaultFileRenamePolicy());
		
 		String prodName=multi.getParameter("prodName");
 		String info=multi.getParameter("info");
 		String pic=multi.getFilesystemName("input2[]");
 		int price=Integer.parseInt(multi.getParameter("price"));
 		String cate=multi.getParameter("cate");

 		String fileFullPath = savePath + "/" + pic;
 		
 		System.out.println("fullpath ="+fileFullPath);
 		
 		Member member=new Member();
 		MemberService memberService=new MemberServiceImpl();
 		member.setId(multi.getParameter("userId"));
 		System.out.println("ggggggg :"+member.getId());
 		member.setMemberNo((memberService.getMember(member.getId())).getMemberNo());
 		 		
 		int userNo=member.getMemberNo();
 		 		
		Product product=new Product();
		product.setProdName(prodName);
		product.setInfo(info);
		String temp[]=fileFullPath.split("/");
		String path=temp[1];
		System.out.println("test :"+path);
		product.setPic(path);
		product.setPrice(price);
		product.setMemberNo(userNo);
		product.setCate(cate);
	
		ProductService service=new ProductServiceImpl();
		service.addProduct(product);
				
		HttpSession session=request.getSession();
		session.setAttribute("product", product);
		
		return "/listProduct.do?userId="+multi.getParameter("userId");
	}

}
