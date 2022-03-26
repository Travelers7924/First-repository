<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%@page import="entity.User" %>
<head>
    <title>index.jsp</title>
    <style type="text/css">
    	#con{
    position:absolute;
    top:0;
    left:0;
    height:100%;
    width:100%;
    background-image:url("./image/index.jpg");
    background-position: center 0;
    background-repeat: no-repeat;
    background-attachment:fixed;
    background-size: cover;
    -webkit-background-size: cover;
    -o-background-size: cover;
    zoom: 1;
}
.login_out{
    float: right;
    margin-right: 3%;
    margin-top: 2%;
    background-color: red;
    border-color: aqua;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
    -khtml-border-radius: 10px;
    text-align: center;
    vertical-align: middle;
    border: 1px solid transparent;
    font-weight: 900;
    font-size:125%
}
.center{
    position: absolute;
    top: 35%;
    left: 45%;
}
.anniu{
    width: 200px;
    padding:8px;
    background-color: red;
    border-color: aqua;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;
    -khtml-border-radius: 10px;
    text-align: center;
    vertical-align: middle;
    border: 1px solid transparent;
    font-weight: 900;
    font-size:125%
}
.btn_sub{
            width: 100px;
            height: 50px;
            line-height: 30px;
            font-size: 30px;
            padding-left: 30px;
            border-radius: 50px;
            background-color: gainsboro;
            border: none;
        }    	    
    </style>
</head>
<body>
<%
	User user = (User)session.getAttribute("user");
	String username = user.getUsername();
	System.out.println(username);
%>
	<div id="con">
	<h1 align="center">欢迎登陆<%=username%></h1>
		<a class="login_out" href="logOutServlet" >退  出</a>
		<a class="login_out" href="charts.jsp" >查看成绩</a>
		<div>
				<form action="test.jsp" method="post">
			<div class="center">
				<div>
					<tr><td>普通模式<input class="anniu" type="radio" name="type" value="question_01" checked="checked"></td> </tr>
				</div>
				<br>
				<div>
					<tr><td>中等模式<input class="anniu" type="radio" name="type" value="question_02"></td> </tr>
				</div>
				<br>
				<div>
					<tr><td>困难模式<input class="anniu" type="radio" name="type" value="question_03"></td> </tr>
				</div>
				<br>
			
					<td class="btn_sub"><input type="submit" class="btn_sub" value="做题"></td>
			</form>
		</div>
		</div>
	</div>
	
</body>

