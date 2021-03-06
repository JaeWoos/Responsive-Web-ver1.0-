<%@page import="com.yeolsim.service.domain.BuyMember"%>
<%@page import="com.yeolsim.service.domain.Buket"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.List"  %>
<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.yeolsim.service.domain.Product" %>
<%@ page import="com.yeolsim.service.domain.Buy" %>
<%@ page import="com.yeolsim.service.domain.Pay" %>

<% String path=request.getContextPath(); %>
    
<%
		Member member = (Member)session.getAttribute("member");
		BuyMember buyMember = (BuyMember)request.getAttribute("buyMember");
		System.out.println(buyMember);
		Pay pay=(Pay)request.getAttribute("pay");
		System.out.println(pay);
		List<Product> prodList =(List<Product>)request.getAttribute("product");
		System.out.println(prodList);
		Buy buy=(Buy)request.getAttribute("buy");
		//List<Buy> buyList=(List<Buy>)request.getAttribute("buy");
		
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Yeolsim Commse</title>

	<link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path %>/bootstrap/css/shop-homepage.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    
	<script type="text/javascript">
	    window.onload = function(){ 

	    	}
	</script>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
%>
   <nav class="navbar navbar-inverse navbar-fixed-top">
       <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/LoginMain.jsp">Yeolsim Shop</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="/logout.do" method="post">
            <div class="form-group">
              <span  style="color: wheat;"><%=member.getId() %>(<%= member.getName() %>)님 환영 합니다.</span>
            </div>
              <button id="login" type="submit" class="btn btn-success" >Sign out</button>
              <a href="/listProduct.do?userId=<%=member.getId()%>"><button id="addProduct" type="button" class="btn btn-success" >상품관리</button></a>
		    
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-3" style="visibility: hidden;">
                <p class="lead">개인 관리</p>
                <div class="list-group">
                    <a href="/updateMemberView.do?userId=<%=member.getId()%>" class="list-group-item">개인정보 수정</a>
                    <a href="/product/addProduct.jsp?userId=<%=member.getId()%>" class="list-group-item">상품 등록</a>
                    <a href="/addBuketList.do" class="list-group-item"  >장바 구니</a>
                    <a href="/listBuy.do?userId=<%=member.getId()%>" class="list-group-item"  >구매 목록</a>
                </div>
            </div>

            <div class="col-md-9">
				 <div class="row">
				            <div class="col-lg-12">
				                <h1 class="page-header">주문 내역서</h1>
				            </div>
				 </div>
				        <!-- Project One -->
				        <%
				        	for(int i=0 ; i<prodList.size() ; i++){
				        		Product prod=prodList.get(i);
				        %>
				        <div class="row">
				            <div class="col-md-7">
				                <a href="#">
				                    <img class="img-responsive" src="/img/<%=prod.getPic() %>" alt="" style="width: 320px; height: 200px;">
				                </a>
				            </div>
				            <div class="col-md-5">
				            	<h3>구매자 이름 : <%=buyMember.getName() %></h3>
				            	<h3>구매자 연락처 :<%=buyMember.getPhone()%></h3>
				            	<h3>배송 주소 :<%=buyMember.getAddr() %></h3>
				                <h3><%=prod.getProdName() %></h3>
				                <h4>가격 : <%=prod.getPrice() %></h4>
				                <p><%=prod.getInfo() %></p>
				                <a href="/listBuy.do?userId=<%=member.getId()%>&totalBuy=<%=buy.getTotalBuy()%>" class="btn btn-primary">확 인<span class="glyphicon glyphicon-chevron-right"></span></a>
				            </div>
				        </div>
				        <%} %>
				        <hr>
				   </div>
        </div>
  </div>
    <!-- /.container -->
    <div class="container">
        <hr>
        <!-- Footer -->
		<footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Yeolsim Comms 2016</p>
                </div>
            </div>
        </footer>
    </div>
    <!-- /.container -->
</body>
</html>
