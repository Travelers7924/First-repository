<%@page import="service.*" %>
<%@page import="javax.servlet.jsp.JspWriter" %>
<%@page import="java.util.List" %>
<%@page import="entity.Question" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
  Created by IntelliJ IDEA.
  User: 86178
  Date: 2022/3/16
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">
    <title>做题页面</title>
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

        .rg_right{
            /*border: 1px solid red;*/
            float: right;
            margin: 15px;
        }
        .ziti{
            font-size: large;
            color: black;
            line-height: normal;
            text-align: left;
        }
        .anniu{
            width: 100px;
            padding:8px;
            background-color: chartreuse;
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
        td{
            width: 10px;
        }
    </style>
    <script>
        var s=2400;
        window.onload=function start(){
            if(s==2400){
                var btn=document.getElementsByTagName("button")[0];
                var time=setInterval(function (){
                    if(s<=0){
                        clearInterval(time);
                        s=5;
                        finish(s);
                    }else{
                        var f = parseInt(s/60);
                        btn.innerHTML=f+":"+s%60;
                        s--;
                    }
                },1000);
            }

        }
        function finish(x){
            if(s==0){
                alert('考试时间到，考试结束。');
            }else{
                var h = x-s-1;
                var y = parseInt(h/60);
                alert('总用时 '+y+':'+h%60);
            }
        }
    </script>
</head>
<body>
<%
	String type = request.getParameter("type");
	List<Question> lt = null;
	if(type.equals("question_01")){
		lt = SelectQuestion_01.doService();
	} else if(type.equals("question_02")) {
		lt = SelectQuestion_02.doService();
	} else if(type.equals("question_03")){
		lt = SelectQuestion_03.doService();
	}
	session.setAttribute("lt", lt);
%>
<div id="con">
    <form action="check.jsp" method="post">
    <h2 align="center">做题界面</h2>
    <div class="rg_right">
        <button class="anniu">计时器</button>
    </div >
    <div class="ziti">
        <table align="center"  cellspacing="5" width="80%">
    <%int i;%>
        <tr>
            <% for( i = 0; i < 2; i++){
            Question q=lt.get(i);%>
<%--            mount.print(q.getContent()+"&nbsp");--%>

        <td><%=q.getContent()%></td>
        <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
    <%} %>
        </tr>
        <tr>
            <% for( i = 2; i < 4;    i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr>
            <% for( i = 4; i < 6; i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr>
            <% for( i = 6; i < 8; i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr>
            <% for( i = 8; i < 10; i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr>
            <% for( i = 10; i < 12; i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr>
            <% for( i = 12; i < 14; i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr>
            <% for( i = 14; i < 16; i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr>
            <% for( i = 16; i < 18; i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr>
            <% for( i = 18; i < 20; i++){
                Question q=lt.get(i);%>
            <%--            mount.print(q.getContent()+"&nbsp");--%>

            <td><%=q.getContent()%></td>
            <td ><input  type="text" name="qt_<%=i+1%>" ><br></td>
            <%} %>
        </tr>
        <tr/><tr/>
      	<tr>
    		<td class="btn_sub" align="center"><input align="right" type="submit" class="btn_sub" onclick="finish(2400)" value="提交"></td>
    		<td></td><td></td>
            <td class="btn_sub" align="center"><input align="left" type="reset" class="btn_sub" value="重置"></td>
 		</tr>
    </table>
    </div>
</form>
</div>
</body>
</html>