package com.yeolsim.view.buy;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.buket.BuketService;
import com.yeolsim.service.buket.impl.BuketServiceImpl;
import com.yeolsim.service.buy.BuyService;
import com.yeolsim.service.buy.impl.BuyServiceImpl;
import com.yeolsim.service.buyMember.BuyMemberService;
import com.yeolsim.service.buyMember.impl.BuyMemberServiceImpl;
import com.yeolsim.service.domain.Buket;
import com.yeolsim.service.domain.Buy;
import com.yeolsim.service.domain.BuyMember;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Pay;
import com.yeolsim.service.domain.Product;
import com.yeolsim.service.pay.PayService;
import com.yeolsim.service.pay.impl.PayServiceImpl;
import com.yeolsim.service.product.ProductService;
import com.yeolsim.service.product.impl.ProductServiceImpl;

public class GetBuyAction extends Action {

	public GetBuyAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Member member=new Member();
		member=(Member)session.getAttribute("member");
		System.out.println("memberNo"+member.getMemberNo());
		
		ProductService productService=new ProductServiceImpl();
		Product product=productService.getProduct(Integer.parseInt(request.getParameter("prodNo")));
		
		Buy buy=new Buy();
		buy.setMemberNo(member.getMemberNo());
		buy.setTotalBuy(Integer.parseInt(request.getParameter("totalBuy")));
		System.out.println(request.getParameter("totalBuy"));
		BuyService buyService=new BuyServiceImpl();
		buyService.insertBuy(buy);
		buy.setBuyNo(buyService.getBuy(buy.getTotalBuy()).getBuyNo());
		System.out.println("1 : "+buy.getBuyNo());
		System.out.println("1.1test :"+buy);
		
		BuyMember buyMember=new BuyMember();
		buyMember.setAddr(request.getParameter("Addr"));
		buyMember.setName(request.getParameter("name"));
		buyMember.setPhone(request.getParameter("phone"));
		buyMember.setBuyNo(buy.getBuyNo());
		BuyMemberService buyMemberService=new BuyMemberServiceImpl();
		buyMemberService.addMember(buyMember);
		System.out.println("2");
		
		Pay pay=new Pay();
		pay.setPayMenu(request.getParameter("pay"));
		pay.setBuyNo(buy.getBuyNo());
		PayService payService=new PayServiceImpl();
		payService.insertPay(pay);
		System.out.println("3"+pay);
		
		BuketService buketService=new BuketServiceImpl();
		buketService.updateBuket(buy.getTotalBuy());
		
		List<Product> listProduct=new ArrayList<Product>();
		List<Buy> listBuy=new ArrayList<Buy>();
		
		
		listProduct.add(product);
		//listBuy.add(buy);
	
		
		request.setAttribute("member", member);
		request.setAttribute("buy", buy);
		request.setAttribute("product", listProduct);
		request.setAttribute("buyMember", buyMember);
		request.setAttribute("pay", pay);
		
		return "forward:/buy/getBuy.jsp";

	}
}


