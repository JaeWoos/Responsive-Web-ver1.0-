<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.List"  %>
<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.yeolsim.service.domain.Product" %>
<%@ page import="com.yeolsim.service.domain.Buy" %>

<% String path=request.getContextPath(); %>
    
<%
		Member member = (Member)session.getAttribute("member");
		List<Product> prodList= (List<Product>)request.getAttribute("product");
		List<Buy> buyList= (List<Buy>)request.getAttribute("buy");
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
            <div class="col-md-3">
                <p class="lead">���� ����</p>
                <div class="list-group">
                    <a href="/updateMemberView.do?userId=<%=member.getId()%>" class="list-group-item">�������� ����</a>
                    <a href="/product/addProduct.jsp?userId=<%=member.getId()%>" class="list-group-item" >��ǰ ���</a>
                    <a href="/addBuketList.do" class="list-group-item"  >��� ����</a>
                    <a href="/listBuy.do?userId=<%=member.getId()%>" class="list-group-item"  >���� ���</a>
                </div>
            </div>
            
            <div class="col-md-9">
                <div class="row">
                    <%
							for(int i=0; i<prodList.size(); i++) {
								Product product = prodList.get(i);
								Buy	 buy=buyList.get(i);
					%>
					 <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">	
                            <img src="/img/<%=product.getPic() %>" alt="" style="width: 320px; height: 200px;">
                              <div class="caption">
                                <h4 class="pull-right"><%=product.getPrice() %> ��</h4>
                                <h4 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                			<a href="/listGetBuy.do?prodNo=<%=product.getProdNo()%>&buyNo=<%=buy.getBuyNo()%>"><%=product.getProdName() %></a>
                                </h4>
                                <p><%=product.getInfo() %></p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
	<% } %>	 
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
