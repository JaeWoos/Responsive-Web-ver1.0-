<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.List"  %>
<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.yeolsim.service.domain.Product" %>

<% String path=request.getContextPath(); %>
    
<%
		
		Member member = (Member)session.getAttribute("member");
		Product product=(Product)request.getAttribute("product");
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
	    
	   	function addProduct(){
	   		$("div.caption-full").append("<hr><b>회원 정보로 주문됩니다. <br>확인 부탁드립니다.</b>");
	   		$('<a href="/addBuy.do?prodNo=<%=product.getProdNo()%>"><button id="buy" type="submit" class="btn btn-success" >구매 확정 </button></a>').replaceAll("#buy")
	   		
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
            <div class="col-md-3" style="visibility: hidden;">
                <p class="lead">개인 관리</p>
                <div class="list-group">
                    <a href="/updateMemberView.do?userId=<%=member.getId()%>" class="list-group-item">개인정보 수정</a>
                    <a href="/product/addProduct.jsp?userId=<%=member.getId()%>" class="list-group-item">상품 등록</a>
                    <a href="/listBuy.do?userId=<%=member.getId()%>" class="list-group-item">구매 목록</a>
                </div>
            </div>

            <div class="col-md-9">

                <div class="thumbnail" style="width: inherit;">
                    <img class="img-responsive" src="/img/<%=product.getPic() %>" alt="" style="width: 300px;height: 220px;margin: 10px 0px 20px 150px;">
                    <div class="caption-full">
                        <h4 class="pull-right"><%=product.getPrice() %> 원</h4>
                        <h4><%=product.getProdName() %>
                        </h4>
                        <p><%=product.getInfo() %></p>
                    </div>
                    <div class="ratings" style="margin-bottom: 25px;">
                        <p class="pull-right" >
                        	<%
                        	
                        	%>
                        	<a href="javascript:addProduct();"><button id="buy" type="submit" class="btn btn-success" >구 매 </button></a>
                        	<a href="javascript:history.go(-1);"><button id="login" type="submit" class="btn btn-success" >취 소</button></a>
                        </p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
                </div>
            </div>

        </div>

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
