<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.List"  %>
<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.yeolsim.service.domain.Product" %>
<%@ page import="com.yeolsim.service.domain.Buket" %>

<% String path=request.getContextPath(); %>
    
<%
		Member member = (Member)session.getAttribute("member");
		List<Product> product=(List<Product>)request.getAttribute("product");
		List<Buket> buket=(List<Buket>)request.getAttribute("buket");
		System.out.println("gg:"+product);
		System.out.println("gg:"+buket);
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
    <!-- Bootstrap Core CSS -->
	<link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path %>/bootstrap/css/shop-homepage.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    <!-- Custom CSS -->
    <link href="css/1-col-portfolio.css" rel="stylesheet">
    
    <script type="text/javascript">
    
    window.onload=function(){
    	$("#pay").click(function(){
    		alert("gg");
    		document.getElementById("addBuy").action="/listGetBuy.do"
    		
    	})
    }
    </script>
    
</head>

<body>

    <!-- Navigation -->
   <nav class="navbar navbar-inverse navbar-fixed-top">
       <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/login.do">Yeolsim Shop</a>
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
            <div class="col-lg-12">
                <h1 class="page-header">구매 리스트</h1>
            </div>
        </div>
        <!-- Project One -->
        <%
        int totalPrice=0;
        String totalBuy="";
        String prodNo="";
        	for(int i=0 ; i<product.size() ; i++){
        		Product prod=(Product)product.get(i);
        		Buket buk=(Buket)buket.get(i);
        		totalBuy+=buk.getTotalBuy()+",";
        		prodNo+=prod.getProdNo()+",";
        		totalPrice+=prod.getPrice();
        %>
        <div class="row">
            <div class="col-md-7">
                    <img class="img-responsive" src="/img/<%=prod.getPic() %>" alt="" style="width: 320px; height: 200px;">
            </div>
            <div class="col-md-5">
                <h3><%=prod.getProdName() %></h3>
                <h4>가격 : <%=prod.getPrice() %></h4>
                <h4>수량 : <%=buk.getCount() %></h4>
                <p><%=prod.getInfo() %></p>
            </div>
        </div>
        <hr>
        <% } %>
        <hr>
        <!-- /.row -->
		<form class="form-horizontal" role="form" method="post" id="addBuy">                  
            <div class="form-group" id="divName">
                <label for="inputName" class="col-lg-2 control-label">받으실 분</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyAlphabetAndNumber" id="name"  name="name" data-rule-required="true" placeholder="이름" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divPhone">
                <label for="inputPhone" class="col-lg-2 control-label">전화 번호</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="phone" name="phone" data-rule-required="true" placeholder="받으실 분 전화번호" maxlength="50">
                </div>
            </div>
            <div class="form-group" id="divAddr">
                <label for="inputPhone" class="col-lg-2 control-label">배송지 주소</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="Addr" name="Addr" data-rule-required="true" placeholder="받으실 분 주소" maxlength="50">
                </div>
            </div>
            <div class="form-group" id="divPrice">
                <label for="inputPrice" class="col-lg-2 control-label">총 결제금액</label>
                <div class="col-lg-10">
                    <div><h3 style="margin: 3px;" ><%=totalPrice %>원</h3></div>
                    <input type="hidden" name="totalBuy" value="<%=totalBuy%>">
                    <input type="hidden" name="prodNo" value="<%=prodNo %>">
                </div>
            </div>
            <div class="form-group" id="divPrice">
            <label for="inputPrice" class="col-lg-2 control-label">결제 수단</label>
             <div class="col-lg-10">
	            <div class="btn-group" data-toggle="buttons">
	                <label class="btn btn-default">
	                    <input type="radio"  name="pay" value="1" /> 신용카드
	                </label> 
	                <label class="btn btn-default">
	                    <input type="radio"  name="pay" value="2" /> 계좌이체
	                </label> 
	                <label class="btn btn-default">
	                    <input type="radio" name="pay" value="3" /> 기타
	                </label> 
	                <label class="btn btn-default">
	                    <input type="radio"  name="pay" value="4" /> 외상
	                </label> 
	            </div>
	            </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" class="btn btn-default" id="pay">결제 하기</button>
                </div>
            </div>
        </form>

        <hr>
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
