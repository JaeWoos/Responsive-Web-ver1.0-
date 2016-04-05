<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.List"  %>
<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.yeolsim.service.domain.Product" %>
<%@ page import="com.yeolsim.service.domain.Buket" %>

<% String path=request.getContextPath(); %>
    
<%
		Member member = (Member)session.getAttribute("member");
		List<Product> prodList =(List<Product>)request.getAttribute("product");
		System.out.println(prodList);
		List<Buket> buketList=(List<Buket>)request.getAttribute("buy");
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
                <h3><%=prod.getProdName() %></h3>
                <h4>가격 : <%=prod.getPrice() %></h4>
                <p><%=prod.getInfo() %></p>
                <a class="btn btn-primary" href="#">결제 하기 <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
        <hr>
        <%} %>
        <!-- /.row -->


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
