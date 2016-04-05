<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.List"  %>
<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.yeolsim.service.domain.Product" %>

<% String path=request.getContextPath(); %>
<%
		Member member = (Member)session.getAttribute("member");
		Product product=(Product)request.getAttribute("product");
		String temp=(String)request.getAttribute("addBuket");
						
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
			$("#buket").click(function(){
				alert("장바구니에 추가 되었습니다.")
				document.getElementById("info").action="/addBuket.do";
				})
			
			$("#buy").click(function(){
			alert("구매")
			document.getElementById("info").action="/addBuy.do?prodNo=<%=product.getProdNo()%>";
			})
		}
			
		$(document).ready(function(){ 
	        	var count=$("#count").val();
	        $("#add").click(function(){
				if(count>=10 ){
					alert("최대 구매 수량을 초과 하였습니다.")
				}else{
				count++;
				$("#count").val(parseInt(count));
	        	}
	        })
	        $("#sub").click(function(){
				if(count<=1){
					alert("최소 구매 수량입니다.")
				}else{
					count--;
				$("#count").val(parseInt(count));
				}
	        })
	        
	    })
	        
	   	function addProduct(){
	   		$("div.caption-full").append(
	   				'<hr style="border: solid 1px;"><h4>배송지 정보</h4><br><form class="form-horizontal" role="form" id="formAddProduct"'+
						'action="javascript:productCheck()" method="post"enctype="multipart/form-data">'+
						'<div class="form-group" id="divName">'+
							'<label for="divProdName" class="col-lg-2 control-label">수취인</label>'+
							'<div class="col-lg-10">'+
								'<input type="text" class="form-control" id="prodName" name="prodName" data-rule-required="true"'+
								'placeholder="받으실 분 이름을 입력해주세요"></div></div>'+
					   		'<div class="form-group" id="divPhone">'+
							'<label for="divProdName" class="col-lg-2 control-label">전화번호</label>'+
							'<div class="col-lg-10">'+
								'<input type="text" class="form-control" id="prodName" name="prodName" data-rule-required="true"'+
								'placeholder="전화번호을 입력해주세요"></div></div>'+
							'<div class="form-group" id="divAddr">'+
							'<label for="divProdName" class="col-lg-2 control-label">배송 주소</label>'+
							'<div class="col-lg-10">'+
								'<input type="text" class="form-control" id="prodName" name="prodName" data-rule-required="true"'+
								'placeholder="배송지를 입력해주세요"></div></div>'+
					   		'<div class="form-group" id="divPhone">');
	   		$('<a href="/addBuy.do?prodNo=<%=product.getProdNo()%>"><button id="buy" type="submit" class="btn btn-success" >구매</button></a>').replaceAll("#buy")
	   		$('<a href="javascript:history.go(-1);"><button id="cancel" type="button" class="btn btn-success" >취소</button></a>').replaceAll("#buket")
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
            <div class="col-md-9" style="margin: 0% 20% 0% 20%;">
                <div class="thumbnail" style="width: inherit;height: 390px;">
                    <img class="img-responsive" src="/img/<%=product.getPic() %>" alt=""  style="width: 300px;height: 220px;margin-top: 20px;">
                    <hr style="margin-bottom: auto; border-style: groove;">
                    <div class="caption-full" >
                        <h4 class="pull-right"><%=product.getPrice() %> 원</h4>
                        <h4><%=product.getProdName() %>
                        </h4>
                        <p><%=product.getInfo() %></p>
                    </div>
                    <div class="ratings" style="margin-bottom: 25px;">
                        <form class="counter" id="info">
                        	<p class="pull-right" style="width:250px;">
								<span class="glyphicon glyphicon-chevron-left" id="sub" style="border: solid 2px;padding:2%;margin:3px;"></span>
								<input type="text" value="1" readonly="" name="count" id="count" style="width: 10%;">
								<input type="hidden" value="<%=product.getProdNo() %>" name="prodNo" id="count" style="width: 10%;">
								<span class="glyphicon glyphicon-chevron-right" id="add" style="border:solid 2px;padding:2%;margin:3px;"></span>
                        	<button id="buket" type="submit" class="btn btn-success" >장바구니</button>
                        	<button id="buy" type="submit" class="btn btn-success" >구 매 </button>
                        	</p>
						</form>
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
