<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.List"  %>
<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.yeolsim.service.domain.Product" %>

<%
	Member member = (Member)session.getAttribute("member");
	List<Product> list= (List<Product>)request.getAttribute("product");
%>	  
<% String path=request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Yeolsim Commse</title>

    <!-- 부트스트랩 -->
    <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path %>/bootstrap/css/shop-homepage.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    
    window.onload = function(){ 
		$('form').submit(function(){
			var divId = $('#divId').value();
            var divPassword = $('#divPassword');
            var divPasswordCheck = $('#divPasswordCheck');
            var divName = $('#divName');
            var divEmail = $('#divEmail');
            var divPhoneNumber = $('#divPhoneNumber');
            console.log(divId);
			
		})
		 $('#id').focusout(function(event){
             
             var divId = $('#divId');
             var temp=$("#id").val();
              alert(temp);
             if($('#id').val()==""){
                 divId.removeClass("has-success");
                 divId.addClass("has-error");
             }else{
                 divId.removeClass("has-error");
                 divId.addClass("has-success");
             }
         });
          
         $('#password').focusout(function(event){
              
             var divPassword = $('#divPassword');
              
             if($('#password').val()==""){
                 divPassword.removeClass("has-success");
                 divPassword.addClass("has-error");
             }else{
                 divPassword.removeClass("has-error");
                 divPassword.addClass("has-success");
             }
         });
         
         $('#passwordCheck').focusout(function(event){
             
             var passwordCheck = $('#passwordCheck').val();
             var password = $('#password').val();
             var divPasswordCheck = $('#divPasswordCheck');
              
             if((passwordCheck=="") || (password!=passwordCheck)){
                 divPasswordCheck.removeClass("has-success");
                 divPasswordCheck.addClass("has-error");
             }else{
                 divPasswordCheck.removeClass("has-error");
                 divPasswordCheck.addClass("has-success");
             }
         });
         
         $('#name').focusout(function(event){
             
             var divName = $('#divName');
              
             if($.trim($('#name').val())==""){
                 divName.removeClass("has-success");
                 divName.addClass("has-error");
             }else{
                 divName.removeClass("has-error");
                 divName.addClass("has-success");
             }
         });
         
         $('#email').keyup(function(event){
             
             var divEmail = $('#divEmail');
              
             if($.trim($('#email').val())==""){
                 divEmail.removeClass("has-success");
                 divEmail.addClass("has-error");
             }else{
                 divEmail.removeClass("has-error");
                 divEmail.addClass("has-success");
             }
         });
         
         $('#phoneNumber').keyup(function(event){
             
             var divPhoneNumber = $('#divPhoneNumber');
              
             if($.trim($('#phoneNumber').val())==""){
                 divPhoneNumber.removeClass("has-success");
                 divPhoneNumber.addClass("has-error");
             }else{
                 divPhoneNumber.removeClass("has-error");
                 divPhoneNumber.addClass("has-success");
             }
         });
         
         $('#Addr').keyup(function(event){
             
             var divPhoneNumber = $('#divAddr');
              
             if($.trim($('#Addr').val())==""){
                 divPhoneNumber.removeClass("has-success");
                 divPhoneNumber.addClass("has-error");
             }else{
                 divPhoneNumber.removeClass("has-error");
                 divPhoneNumber.addClass("has-success");
             }
         });
    }
	</script>    
    
  </head>
<title>Insert title here</title>
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
				<form class="form-horizontal"
					action="/UpdateMember.do?id=<%=member.getId() %>" method="post">
					<div class="form-group" id="divId">
						<label for="inputId" class="col-lg-2 control-label">아이디</label>
						<div class="col-lg-10" style="padding-top: 7px;">
							<div><%=member.getId() %></div>
						</div>
					</div>
					<div class="form-group" id="divPassword">
						<label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
						<div class="col-lg-10">
							<input type="password" class="form-control" id="password"
								name="excludeHangul" data-rule-required="true"
								value="<%=member.getPassword() %>" maxlength="30">
						</div>
					</div>
					<div class="form-group" id="divName">
						<label for="inputName" class="col-lg-2 control-label">이름</label>
						<div class="col-lg-10">
							<input type="text" class="form-control onlyHangul" id="name"
								name="name" data-rule-required="true"
								value="<%=member.getName() %>" maxlength="15">
						</div>
					</div>
					<div class="form-group" id="divEmail">
						<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
						<div class="col-lg-10">
							<input type="email" class="form-control" id="email" name="email"
								data-rule-required="true" value="<%=member.getEmail() %>"
								maxlength="40">
						</div>
					</div>
					<div class="form-group" id="divPhoneNumber">
						<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
							번호</label>
						<div class="col-lg-10">
							<input type="tel" class="form-control onlyNumber"
								id="phoneNumber" name="phoneNumber" data-rule-required="true"
								value="<%=member.getPhone() %>" maxlength="11">
						</div>
					</div>
					<div class="form-group" id="divAddr">
						<label for="inputAddr" class="col-lg-2 control-label">주소</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="Addr" name="Addr"
								data-rule-required="true" value="<%=member.getAddr() %>"
								maxlength="50">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
						<div class="col-lg-10">
							<select class="form-control" id="gender" name="gender">
								<option value="M">남</option>
								<option value="F">여</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-10">
							<button type="submit" class="btn btn-default">Update</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>