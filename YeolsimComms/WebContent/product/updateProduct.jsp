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

        <!-- /.container -->

    <!-- Page Content -->
    <div class="container">
       <div class="row">
            <div class="col-md-3">
                <p class="lead">개인 관리</p>
                <div class="list-group">
                    <a href="/updateMemberView.do?userId=<%=member.getId()%>" class="list-group-item">개인정보 수정</a>
                    <a href="/product/addProduct.jsp?userId=<%=member.getId()%>" class="list-group-item">상품 등록</a>
                    <a href="/listBuy.do?userId=<%=member.getId()%>" class="list-group-item">구매 목록</a>
                </div>
            </div>

            <div class="col-md-9">

				<div class="thumbnail" style="width: inherit;">
					<form class="form-horizontal"  action="/updateProduct.do?prodNo=<%=product.getProdNo()%>" method="post">                  
                   	 <img class="img-responsive" src="/img/<%=product.getPic() %>" alt="" style="width: 300px;height: 220px;margin: 10px 0px 20px 150px;">
      					<div class="form-group" id="divId">
                			<label for="inputId" class="col-lg-2 control-label">상품명</label>
                				<div class="col-lg-10">
                    				<input type="text" class="form-control" id="prodName" name="prodName" data-rule-required="true" value="<%=product.getProdName() %>">
                				</div>
            			</div>
            			<div class="form-group" id="divPassword">
                			<label for="inputPassword" class="col-lg-2 control-label">상품 가격</label>
               				 <div class="col-lg-10">
                  			  <input type="text" class="form-control" id="prodPrice" name="prodPrice" data-rule-required="true" value="<%=product.getPrice()%>">
                			</div>
            			</div>
            			<div class="form-group" id="divName">
                			<label for="inputName" class="col-lg-2 control-label">상품 설명</label>
                				<div class="col-lg-10">
                    				<input type="text" class="form-control onlyHangul" id="prodInfo" name="prodInfo" data-rule-required="true" value="<%=product.getInfo()%>">
                				</div>
            			</div>
            			<div class="form-group">
               			 <label for="inputPhoneNumber" class="col-lg-2 control-label">분류</label>
                		 <div class="col-lg-10">
                    		<select class="form-control" id="cate" name="cate">
                        		<option value="의류">의류</option>
                        		<option value="가전">가전</option>
                        		<option value="음식">음식</option>
                        		<option value="가구">가구</option>
                        		<option value="기타">기타</option>
	                    	</select>	
                </div>
            </div>
            			
            			<div class="form-group">
                			<div class="col-lg-offset-2 col-lg-10">
                    		<button type="submit" class="btn btn-default">제품 등록</button>
                			</div>
            			</div>
			        </form>
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
