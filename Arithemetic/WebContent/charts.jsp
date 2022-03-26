<%@ page import="entity.User" %>
<%@ page import="service.SelectScores" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="net.sf.json.JSONArray" %><%--
  Created by IntelliJ IDEA.
  User: 86178
  Date: 2022/3/20
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>查看成绩</title>
    <script src="echarts.min.js"></script>
    <style>
        #con{
            background: url("./image/index.jpg") no-repeat fixed center;
            background-size: cover;
        }
        .rg{
            float: right;
            margin: 30px;
        }
    </style>
</head>
<body id="con">
<%
    JspWriter mount = pageContext.getOut();
	User user = (User)session.getAttribute("user");
   	String username = user.getUsername();
   	System.out.print(username);
    List<Integer> list=SelectScores.doService(username);
    HashMap<String,Integer> map = new HashMap<>();
    JSONArray json = JSONArray.fromObject(list);
    request.getSession().setAttribute("json",json);
%>
<div>
<div class="rg"><a href="index.jsp"><button>返回<button></a></div>
<div class="rg">
    <a href="logOutServlet"><button>退出<button></a></div>
</div>
<div id="main" style="width: 600px;height:400px;"></div>
</div>
    <script>
        var json = '${sessionScope.json}';
        var jsonobj = JSON.parse(json);

        var dataName = [];
        var dataNum = [];
        var temp = jsonobj;

        (function (){
            for(var i=0;i<temp.length;i++){
                var a ='第'+(i+1)+'轮'
                dataName.push(a);
                dataNum.push(temp[i]);
            }
        })();
        var myChart2 = echarts.init(document.getElementById('main'));
        var option = {
            title:{
                text:'分数统计',
                padding:-0.5,
                textAlign:'left'
            },
            tooltip:{},
            legend:{
                data:['分数']
            },
            xAxis:{
                data:dataName,
            },
            yAxis: {
                type:"value",
                name:'分数',
                splitNumber:5
            },
            series:[{
                name:'成绩',
                type: 'bar',
                data:dataNum,
                itemStyle:{
                    normal:{
                        label:{
                            show:true,
                            position:'top',
                            textStyle:{
                                color:'black',
                                fontsize:16
                            }
                        }
                    }
                },
                barWidth:20,
                data:dataNum,
            }]
        };
        myChart2.setOption(option);
    </script>
</body>
</html>
