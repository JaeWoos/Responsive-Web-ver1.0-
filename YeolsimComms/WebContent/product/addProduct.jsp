<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="com.yeolsim.service.domain.Member"%>

<% String path=request.getContextPath(); %>
<%
	Member member = (Member)session.getAttribute("member");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Yeolsim Commse</title>

<!-- 부트스트랩 -->
<link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/css/fileinput.min.css" media="all"
	rel="stylesheet">
<link href="<%=path %>/bootstrap/css/shop-homepage.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>

<script src="<%=path%>/javascript/canvas-to-blob.js"
	type="text/javascript"></script>
<script src="<%=path%>/javascript/fileinput.js" type="text/javascript"></script>
<script src="<%=path%>/javascript/fileinput_locale_LANG.js"></script>

<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
    
    function productCheck(){
		
		if($('#prodName').val()==""){
       	 alert("상품명을 입력하세요");
       	 focus();
        }else if($('#price').val()==""){
        	 alert("가격을 입력하세요");
        	 focus();
        }else if($.trim($('#info').val())==""){
        	 alert("상품정보를 입력하세요");
        	 focus();
        }
		document.getElementById("formAddProduct").action="/addProduct.do?userId=<%=member.getId()%>";
		}
    window.onload = function(){ 

		 $('#prodName').focusout(function(event){
             
             var divProdName = $('#divProdName');
                        
             if($('#prodName').val()==""){
            	 divProdName.removeClass("has-success");
            	 divProdName.addClass("has-error");
             }else{
            	 divProdName.removeClass("has-error");
            	 divProdName.addClass("has-success");
             }
         });
          
         $('#price').focusout(function(event){
              
             var divPrice = $('#divPrice');
             if($('#price').val()==""){
            	 divPrice.removeClass("has-success");
                 divPrice.addClass("has-error");
             }else{
            	 divPrice.removeClass("has-error");
            	 divPrice.addClass("has-success");
             }
         });
                
         $('#info').focusout(function(event){
             
             var divInfo = $('#divInfo');
              
             if($.trim($('#info').val())==""){
            	 divInfo.removeClass("has-success");
            	 divInfo.addClass("has-error");
             }else{
            	 divInfo.removeClass("has-error");
            	 divInfo.addClass("has-success");
             }
         });
         
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
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/login.do">Yeolsim Shop</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<form class="navbar-form navbar-right" action="/logout.do"
				method="post">
				<div class="form-group">
					<span style="color: wheat;"><%=member.getId() %>(<%= member.getName() %>)님
						환영 합니다.</span>
				</div>
				<button id="login" type="submit" class="btn btn-success">Sign
					out</button>
				<a href="/listProduct.do?userId=<%=member.getId()%>"><button
						id="addProduct" type="button" class="btn btn-success">상품관리</button></a>

			</form>
		</div>
		<!--/.navbar-collapse -->
	</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<p class="lead">개인 관리</p>
				<div class="list-group">
					<a href="/updateMemberView.do?userId=<%=member.getId()%>" class="list-group-item"  style="background-color: #DCDCDC">개인정보 수정</a>
					<a href="/product/addProduct.jsp?userId=<%=member.getId()%>" class="list-group-item">상품 등록</a>
					<a href="/addBuketList.do" class="list-group-item"  >장바 구니</a>
                    <a href="/listBuy.do?userId=<%=member.getId()%>" class="list-group-item"  >구매 목록</a>
				</div>
			</div>

			<div class="col-md-9" style="margin-top: 3%;">
				<div class="row" style="margin-top: 20px;">
					<form class="form-horizontal" role="form" id="formAddProduct"
						action="javascript:productCheck()" method="post"
						enctype="multipart/form-data">
						<!-- 사진 업로드 -->
						<div class="form-group" id="divPic">
							<label for="divPic" class="col-lg-2 control-label">상품 사진</label>
							<div class="col-lg-10">

								<input id="input-2" name="input2[]" type="file" class="file"
									multiple data-show-upload="false" data-show-caption="true">
							</div>
						</div>

						<div class="form-group" id="divProdName">
							<label for="divProdName" class="col-lg-2 control-label">상품명</label>
							<div class="col-lg-10">
								<input type="text" class="form-control onlyAlphabetAndNumber"
									id="prodName" name="prodName" data-rule-required="true"
									placeholder="상품명을 입력해주세요">
							</div>
						</div>
						<div class="form-group" id="divPrice">
							<label for="inputPrice" class="col-lg-2 control-label">상품
								가격</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="price" name="price"
									data-rule-required="true" placeholder="가격 원">
							</div>
						</div>
						<div class="form-group" id="divInfo">
							<label for="inputInfo" class="col-lg-2 control-label">상품
								정보</label>
							<div class="col-lg-10">
								<input type="text" class="form-control onlyHangul" id="info"
									name="info" data-rule-required="true"
									placeholder="상품 설명을 간략히 하세요">
							</div>
						</div>
						<div class="form-group" id="divDate">
							<label for="inputDate" class="col-lg-2 control-label">등록일</label>
							<div class="col-lg-10" style="padding-top: 7px;">
								<span>등록일 기준으로 자동 입력 됩니다.</span>
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

	<footer>
	<div class="row">
		<div class="col-lg-12">
			<p>Copyright &copy; Yeolsim Comms 2016</p>
		</div>
	</div>
	</footer>
</body>
</html>