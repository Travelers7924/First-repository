<%@page import="service.InsertUser"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="service.SelectQuestion_01" %>
<%@page import="javax.servlet.jsp.JspWriter" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entity.Question" %>
<%@page import="entity.User" %>
<html>
<head>
<meta charset="UTF-8">
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
</style>
<title>check.jsp</title>
</head>
<body id ="con">
<% 
	User user = (User)session.getAttribute("user");
	int i;
	int score = 0;
	JspWriter mount =pageContext.getOut();
	List<String> us = new ArrayList<String>();
	List<Question> lt = (List<Question>)session.getAttribute("lt");
	for(i = 0; i < 20; i++){
		String name = "qt_" + (i + 1);
		String userResult = request.getParameter(name);
		us.add(userResult);
		String result = lt.get(i).getResult( );
		if(userResult.equals(result)){
			score += 5;
		}
	}
	user.setScores(score);
	InsertUser.doService(user);
	
%>
	<h1 align="center">您的成绩是<%=score%>!</h1>	
	<table border="1" width="600px" height="144px" align="center" cellspacing="0" cellspadding="0">
	<%
			for( i = 0; i < 20; i++){
	%><tr align="left"><td align="center">
	<%
				mount.print("&nbsp&nbsp&nbsp" + "第" + (i+1) + "个问题:" +"&nbsp&nbsp&nbsp" + lt.get(i).getContent()+"&nbsp&nbsp&nbsp");
	%></td><td align="left">
	<%
				mount.print("&nbsp&nbsp&nbsp" + "您的答案:" +"&nbsp&nbsp&nbsp" + us.get(i)+"&nbsp&nbsp&nbsp");
		%></td>
		<td align="left"><% mount.print("&nbsp&nbsp&nbsp" + "正确答案:" +"&nbsp&nbsp&nbsp" + lt.get(i).getResult()+"&nbsp");%></td></tr>
		<% } %>
		</table>
	<p align="center">
		<a href="logOutServlet" color=bule>退出</a>
		<a href="index.jsp" color=bule>重新考试</a>
	</p>
</body>
</html>





