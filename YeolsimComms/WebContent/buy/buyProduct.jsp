<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.List"  %>
<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.yeolsim.service.domain.Product" %>
<%@ page import="com.yeolsim.service.domain.Buket" %>

<% String path=request.getContextPath(); %>
    
<%
		Member member = (Member)session.getAttribute("member");
		Product product=(Product)request.getAttribute("product");
		Buket buket=(Buket)request.getAttribute("buket");
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
    		document.getElementById("addBuy").action="/getBuy.do"
    		
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
              <span  style="color: wheat;"><%=member.getId() %>(<%= member.getName() %>)�� ȯ�� �մϴ�.</span>
            </div>
              <button id="login" type="submit" class="btn btn-success" >Sign out</button>
              <a href="/listProduct.do?userId=<%=member.getId()%>"><button id="addProduct" type="button" class="btn btn-success" >��ǰ����</button></a>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">���� ����Ʈ</h1>
            </div>
        </div>
        <!-- Project One -->
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="/img/<%=product.getPic() %>" alt="" style="width: 320px; height: 200px;">
                </a>
            </div>
            <div class="col-md-5">
                <h3><%=product.getProdName() %></h3>
                <h4>���� : <%=product.getPrice() %></h4>
                <p><%=product.getInfo() %></p>
            </div>
        </div>
        <hr>
        <!-- /.row -->
		<form class="form-horizontal" role="form" method="post" id="addBuy">                  
            <div class="form-group" id="divName">
                <label for="inputName" class="col-lg-2 control-label">������ ��</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyAlphabetAndNumber" id="name"  name="name" data-rule-required="true" placeholder="�̸�" maxlength="30">
                </div>
            </div>
            <div class="form-group" id="divPhone">
                <label for="inputPhone" class="col-lg-2 control-label">��ȭ ��ȣ</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="phone" name="phone" data-rule-required="true" placeholder="������ �� ��ȭ��ȣ" maxlength="50">
                </div>
            </div>
            <div class="form-group" id="divAddr">
                <label for="inputPhone" class="col-lg-2 control-label">����� �ּ�</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="Addr" name="Addr" data-rule-required="true" placeholder="������ �� �ּ�" maxlength="50">
                </div>
            </div>
            <div class="form-group" id="divPrice">
                <label for="inputPrice" class="col-lg-2 control-label">�� �����ݾ�</label>
                <div class="col-lg-10">
                    <div><h3 style="margin: 3px;" ><%=product.getPrice() %>��</h3></div>
                    <input type="hidden" name="price" value="<%=product.getPrice() %>">
                    <input type="hidden" name="totalBuy" value="<%=buket.getTotalBuy() %>">
                </div>
            </div>
            <div class="form-group" id="divPrice">
            <label for="inputPrice" class="col-lg-2 control-label">���� ����</label>
             <div class="col-lg-10">
	            <div class="btn-group" data-toggle="buttons">
	                <label class="btn btn-default">
	                    <input type="radio" id="q156" name="pay" value="1" /> �ſ�ī��
	                </label> 
	                <label class="btn btn-default">
	                    <input type="radio" id="q157" name="pay" value="2" /> ������ü
	                </label> 
	                <label class="btn btn-default">
	                    <input type="radio" id="q158" name="pay" value="3" /> ��Ÿ
	                </label> 
	                <label class="btn btn-default">
	                    <input type="radio" id="q159" name="pay" value="4" /> �ܻ�
	                </label> 
	            </div>
	            </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" class="btn btn-default" id="pay">���� �ϱ�</button>
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
