<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path=request.getContextPath(); %>
    
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>Yeolsim Commse</title>

    <!-- 부트스트랩 -->
    <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    
    window.onload = function(){ 

    $("#login").click(function(){
   		var id=$("#navbar .form-group").find("input[name='userId']").val();
		var pw=$("#navbar .form-group").find("input[name='password']").val();

		if(id == null || id.length <1) {
			alert('ID 를 확인하세요.');
			$("#navbar .form-group").find("input[name='userId']").focus();
			return;
		}
		
		if(pw == null || pw.length <1) {
			alert('패스워드를 입력하지 않으셨습니다.');
			$("#navbar .form-group").find("input[name='userId']").focus();
			return;
		}
    })
    
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
          <a class="navbar-brand" href="/main.jsp">Yeolsim Shop</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="/login.do" method="post">
            <div class="form-group">
              <input type="text" placeholder="ID" name="userId" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" name="password" class="form-control">
            </div>
		      <button id="login" type="submit" class="btn btn-success" >Sign in</button>
		       <a href="/member.jsp"><button id="member" type="button" class="btn btn-success">Sign up</button></a>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
    
<div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 500px; margin-bottom: 60px;">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item">
          <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item active">
          <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    
    <div class="container">
		
		<div class="row">
		  <div class="col-md-4">
		    <h2>Heading</h2>
		    <p>테스트요요요오오오오옹</p>
		    <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		  </div>
		  <div class="col-md-4">
		    <h2>Heading</h2>
		    <p>테스트요요요오오오오옹</p>
		    <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		 </div>
		  <div class="col-md-4">
		    <h2>Heading</h2>
		    <p>테스트요요요오오오오옹</p>
		    <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		  </div>
		</div>
		
		<div class="row">
		   <div class="col-md-4">
		     <h2>Heading</h2>
		     <p>테스트요요요오오오오옹</p>
		     <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		   </div>
		   <div class="col-md-4">
		     <h2>Heading</h2>
		        <p>테스트요요요오오오오옹</p>
		     <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		  </div>
		   <div class="col-md-4">
		     <h2>Heading</h2>
		        <p>테스트요요요오오오오옹</p>
		     <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		   </div>
		</div>
		  
		<div class="row">
		   <div class="col-md-4">
		     <h2>Heading</h2>
		        <p>테스트요요요오오오오옹</p>
		     <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		   </div>
		   <div class="col-md-4">
		     <h2>Heading</h2>
		        <p>테스트요요요오오오오옹</p>
		     <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		  </div>
		   <div class="col-md-4">
		     <h2>Heading</h2>
		        <p>테스트요요요오오오오옹</p>
		     <p><a class="btn btn-default" href="#" role="button">View details </a></p>
		   </div>
		</div>
		
		
  

  </body>
</html>