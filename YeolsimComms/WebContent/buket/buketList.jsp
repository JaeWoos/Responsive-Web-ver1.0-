<%@page import="java.util.ArrayList"%>
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
		List<Buket> buketList=(List<Buket>)request.getAttribute("buket");
		System.out.println(buketList);
		
		String temp;
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
    	function buy(){
			var totalNo=$(":checked");
 			var list=[];
			var listTotalNo ="";
			console.log(totalNo);
			for(var i=0 ; i<totalNo.size(); i++){
				list=totalNo[i].name;
				listTotalNo+=list+",";
			}
			postGo("/addBuketBuy.do", {"totalNo":listTotalNo})
    	}
    	
    	function postGo(path, params, method){
    		  method = method || "post";
    		  var form = document.createElement("form");
    		    form.setAttribute("method", method);
    		    form.setAttribute("action", path);
    		    for(var key in params) {
    		        var hiddenField = document.createElement("input");
    		        hiddenField.setAttribute("type", "hidden");
    		        hiddenField.setAttribute("name", key);
    		        hiddenField.setAttribute("value", params[key]);
    		 
    		        form.appendChild(hiddenField);
    		    }
    		    console.log(form)
    		    document.body.appendChild(form);
    		   form.submit();
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
                <h1 class="page-header">장바구니 리스트</h1>
            </div>
        </div>
        <form  action="/addBuketBuy.do" method="POST">
  
        <!-- Project One -->
         <%
        	for(int i=0 ; i<prodList.size() ; i++){
        		Product prod=prodList.get(i);
        		Buket buket=buketList.get(i);
        %>
        <div class="row">
          <div>
    		<div class="checkbox">
      			<label>
      			<input type="checkbox" name="check" value="<%=buket.getTotalBuy()%>">
      			</label>
    		</div>
  		 </div>
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="/img/<%=prod.getPic() %>" alt="" style="width: 320px; height: 200px;">
                </a>
            </div>
            <div class="col-md-5">
                <div> <h3><%=prod.getProdName() %></h3></div>
                <div> <h4>가격 : <%=prod.getPrice() %></h4></div>
                <div> <p><%=prod.getInfo() %></p></div>
                <div> <h4>수량 : <%=buket.getCount()%></h4></div>
            </div>
        </div>
        <hr>
        <%} %> 
                <button class="btn btn-primary" type="submit" >결제 하기 <span class="glyphicon glyphicon-chevron-right"></span></button>
        </form>
        <!-- /.row -->
        </div>
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
