package com.yeolsim.view.buket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yeolsim.framework.Action;
import com.yeolsim.service.buket.BuketService;
import com.yeolsim.service.buket.impl.BuketServiceImpl;
import com.yeolsim.service.domain.Buket;
import com.yeolsim.service.domain.Member;
import com.yeolsim.service.domain.Product;


public class AddBuketBuyAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("member");
		int memberNo=member.getMemberNo();
		System.out.println("mem :"+memberNo);
		String buketNo="";

		BuketService buketService=new BuketServiceImpl();
		Map<String, Object> buketMap=new HashMap<String, Object>();
		List<Product> productList=new ArrayList<>();
		List<Buket> buektList=new ArrayList<>();
		
		String[] type = request.getParameterValues("check") ;
		for(int i=0 ; i<type.length ; i++){
			System.out.println(type[i]);
			Map<String, Object> map =buketService.findBuket2(Integer.parseInt(type[i]));
			Product product =(Product)map.get("product");
			Buket buket=(Buket)map.get("buket");
		
			productList.add(product);
			buektList.add(buket);
		
		}
		buketMap.put("product", productList);
		buketMap.put("buket", buektList);
		System.out.println("3 : "+buketMap);
		
		request.setAttribute("product", buketMap.get("product"));
		request.setAttribute("buket", buketMap.get("buket"));

		return "forward:/buy/listBuketBuy.jsp";
	}
}