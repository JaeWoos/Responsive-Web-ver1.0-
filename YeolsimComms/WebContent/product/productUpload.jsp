<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.yeolsim.service.domain.Member" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>

<% String path=request.getContextPath(); %>

<%
	Member member = (Member)session.getAttribute("member");
%>	    

<!-- ���� ���ε� -->
<%
	String root = request.getSession().getServletContext().getRealPath("/");	
	String uploadPath =root+"img";
	
    // ���ε� ���ϸ�
    String uploadFile = "";
 
    // ���� ������ ���ϸ�
    String newFileName = "";
	
	 int size = 10*1024*1024;    

		 String prodName="";
		 String info="";
		 String pic="";
		 int price;
	 
 	try{
 		 MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr",
 				 				new DefaultFileRenamePolicy());
		
 		prodName=multi.getParameter("prodName");
 		info=multi.getParameter("info");
 		price=Integer.parseInt(multi.getParameter("price"));

 		Enumeration files = multi.getFileNames();

 		String file = (String)files.nextElement();
 		newFileName = multi.getFilesystemName(file);

 	}catch(Exception e){
 		  // ����ó��
 		  e.printStackTrace();
 	}
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Yeolsim Commse</title>

    <!-- ��Ʈ��Ʈ�� -->
    <link href="<%=path %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path %>/css/fileinput.min.css" media="all" rel="stylesheet">
	
	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	
	<script src="<%=path%>/javascript/canvas-to-blob.js" type="text/javascript"></script>
	<script src="<%=path%>/javascript/fileinput.js" type="text/javascript"></script>
	<script src="<%=path%>/javascript/fileinput_locale_LANG.js"></script>
    
    <script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
   		window.onload = function(){ 
         
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
             <a class="navbar-brand" href="/LoginMain.jsp">Yeolsim Shop </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <a href="/updateMemberView.do?userId=<%=member.getId()%>"><span  style="color: wheat;"><%=member.getId() %>(<%= member.getName() %>)�� ȯ�� �մϴ�.</span></a>
            </div>
            <div class="form-group">
              
            </div>
		      <button id="login" type="submit" class="btn btn-success" >Sign out</button>
              <a href="/addProduct?userId=<%=member.getId()%>"><button id="addProduct" type="button" class="btn btn-success" >��ǰ ���</button></a>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
    
		<div class="container" style="margin-top: 7%;">
         <form class="form-horizontal" role="form" action="/addMember.do" method="post"  enctype="multipart/form-data">
         <!-- ���� ���ε� -->
         	<div class="form-group" id="divPic">
         	<label for="divPic" class="col-lg-2 control-label">��ǰ ����</label>
                <div class="col-lg-10">
                
         	     	<input id="input-2" name="input2[]" type="file" class="file" multiple data-show-upload="false" data-show-caption="true">
                </div>
            </div>
            
            <div class="form-group" id="divProdName">
                <label for="divProdName" class="col-lg-2 control-label">��ǰ��</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyAlphabetAndNumber" id="prodName"  name="prodName" data-rule-required="true" placeholder="��ǰ���� �Է����ּ���">
                </div>
            </div>
            <div class="form-group" id="divPrice">
                <label for="inputPrice" class="col-lg-2 control-label">��ǰ ����</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="price" name="price" data-rule-required="true" placeholder="���� ��" >
                </div>
            </div>
            <div class="form-group" id="divInfo">
                <label for="inputInfo" class="col-lg-2 control-label">��ǰ ����</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyHangul" id="info" name="info" data-rule-required="true" placeholder="��ǰ ������ ������ �ϼ���" >
                </div>
            </div>                                
            <div class="form-group" id="divDate">
                <label for="inputDate" class="col-lg-2 control-label">�����</label>
                <div class="col-lg-10">
                    <span>����� �������� �ڵ� �Է� �˴ϴ�.</span>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPhoneNumber" class="col-lg-2 control-label">�з�(���� �߰����)</label>
                <div class="col-lg-10">
                    <select class="form-control" id="gender" name="gender">
                        <option value="�Ƿ�">�Ƿ�</option>
                        <option value="����">����</option>
                        <option value="����">����</option>
                        <option value="����">����</option>
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
  
  
</body>
</html>