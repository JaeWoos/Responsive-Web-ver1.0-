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

<!-- ��Ʈ��Ʈ�� -->
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
       	 alert("��ǰ���� �Է��ϼ���");
       	 focus();
        }else if($('#price').val()==""){
        	 alert("������ �Է��ϼ���");
        	 focus();
        }else if($.trim($('#info').val())==""){
        	 alert("��ǰ������ �Է��ϼ���");
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
					<span style="color: wheat;"><%=member.getId() %>(<%= member.getName() %>)��
						ȯ�� �մϴ�.</span>
				</div>
				<button id="login" type="submit" class="btn btn-success">Sign
					out</button>
				<a href="/listProduct.do?userId=<%=member.getId()%>"><button
						id="addProduct" type="button" class="btn btn-success">��ǰ����</button></a>

			</form>
		</div>
		<!--/.navbar-collapse -->
	</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<p class="lead">���� ����</p>
				<div class="list-group">
					<a href="/updateMemberView.do?userId=<%=member.getId()%>" class="list-group-item"  style="background-color: #DCDCDC">�������� ����</a>
					<a href="/product/addProduct.jsp?userId=<%=member.getId()%>" class="list-group-item">��ǰ ���</a>
					<a href="/addBuketList.do" class="list-group-item"  >��� ����</a>
                    <a href="/listBuy.do?userId=<%=member.getId()%>" class="list-group-item"  >���� ���</a>
				</div>
			</div>

			<div class="col-md-9" style="margin-top: 3%;">
				<div class="row" style="margin-top: 20px;">
					<form class="form-horizontal" role="form" id="formAddProduct"
						action="javascript:productCheck()" method="post"
						enctype="multipart/form-data">
						<!-- ���� ���ε� -->
						<div class="form-group" id="divPic">
							<label for="divPic" class="col-lg-2 control-label">��ǰ ����</label>
							<div class="col-lg-10">

								<input id="input-2" name="input2[]" type="file" class="file"
									multiple data-show-upload="false" data-show-caption="true">
							</div>
						</div>

						<div class="form-group" id="divProdName">
							<label for="divProdName" class="col-lg-2 control-label">��ǰ��</label>
							<div class="col-lg-10">
								<input type="text" class="form-control onlyAlphabetAndNumber"
									id="prodName" name="prodName" data-rule-required="true"
									placeholder="��ǰ���� �Է����ּ���">
							</div>
						</div>
						<div class="form-group" id="divPrice">
							<label for="inputPrice" class="col-lg-2 control-label">��ǰ
								����</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="price" name="price"
									data-rule-required="true" placeholder="���� ��">
							</div>
						</div>
						<div class="form-group" id="divInfo">
							<label for="inputInfo" class="col-lg-2 control-label">��ǰ
								����</label>
							<div class="col-lg-10">
								<input type="text" class="form-control onlyHangul" id="info"
									name="info" data-rule-required="true"
									placeholder="��ǰ ������ ������ �ϼ���">
							</div>
						</div>
						<div class="form-group" id="divDate">
							<label for="inputDate" class="col-lg-2 control-label">�����</label>
							<div class="col-lg-10" style="padding-top: 7px;">
								<span>����� �������� �ڵ� �Է� �˴ϴ�.</span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPhoneNumber" class="col-lg-2 control-label">�з�</label>
							<div class="col-lg-10">
								<select class="form-control" id="cate" name="cate">
									<option value="�Ƿ�">�Ƿ�</option>
									<option value="����">����</option>
									<option value="����">����</option>
									<option value="����">����</option>
									<option value="��Ÿ">��Ÿ</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button type="submit" class="btn btn-default">��ǰ ���</button>
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