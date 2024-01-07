<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <title>医生界面</title>
    
    <link href="https://static.39.net/pub/yyk/v3/pc/css/base.css" rel="stylesheet">
    <link href="https://static.39.net/pub/yyk/v3/pc/css/hospital.css" rel="stylesheet">
    <link rel="stylesheet" href="do.css">
    <script src="https://static.39.net/lib/jquery/core/jquery-1.7.2.min.js"></script>
    <script>
    	function toRegister(did,account,time){
    		var c = confirm("确认预约？");
    		if(c==true){
    			window.location.href='ok.jsp?did='+did+'&account='+account+'&time='+time;
    		}
    	}
    </script>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String connStr = "jdbc:mysql://localhost:3306/hospital?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
	Connection conn = DriverManager.getConnection(connStr, "root", "123456");
	Statement stmt = conn.createStatement();	
	int did = 1;
	String sql = "select * from doctor where did="+did;
	
	String account = request.getParameter("account");
	Calendar c = Calendar.getInstance();
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH)+1;
	int date = c.get(Calendar.DATE);
	
	ResultSet rs=stmt.executeQuery(sql);
	String dname = "1";
	String darea = "2";
	String intr = "3";
	if(rs.next()){
		dname=rs.getString("dname");
		darea = rs.getString("darea");
		intr = rs.getString("intr");
	}
%>

</head>
<body>
  	<div class="m-box">
		<div class="m-head">
			<div class="m-title">
				<div class="t-name">XXXXX医院</div>
				<div class="t-return"><a href='main.jsp?account=<%=account %>' style="color: white">返回</a></div>
			</div>
		</div>
	</div>	
	<div class="wrap">
	
		<div class="mainframe">
			<section class="block doctorcalendar">
			    <div class="hospitalselect">
			        <div class="swiper-container">
			            <div class="swiper-wrapper">
			                    <div class="swiper-slide"><em>XXXXXXX医院 - XX科</em></div>
			            </div>
			        </div>
			        <div class="swiper-button-prev"></div>
			        <div class="swiper-button-next"></div>
			    </div>
			    <div class="calendartable">
			        <div class="ampm">
			        	<em>时段</em>
			        	<em>8:00-9:00</em>
			        	<em>9:00-10:00</em>
			       		<em>10:00-11:00</em>
			      		<em>11:00-12:00</em>
			    		<em>13:00-14:00</em>
			    		<em>14:00-15:00</em>
			    		<em>15:00-16:00</em>
			        </div>
			        <div class="muticalendar">
						<div class="row">
							<div><%=month %>-<%=date+1 %></div>
				    		<div><%=month %>-<%=date+2 %></div>
				    		<div><%=month %>-<%=date+3 %></div>
				    		<div><%=month %>-<%=date+4 %></div>
				    		<div><%=month %>-<%=date+5 %></div>
				    		<div><%=month %>-<%=date+6 %></div>
				    		<div><%=month %>-<%=date+7 %></div>
						</div>
				    	<div class="row">
							<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
						</div>
						<div class="row">
							<div></div>
				    		<div class="chuzhen"><a href='order.jsp?account=<%=account %>'>可选</div>
				    		<div></div>
				    		<div class="chuzhen"><a href='order.jsp?account=<%=account %>'>可选</div>
				    		<div></div>
				    		<div></div>
				    		<div class="chuzhen"><a href='order.jsp?account=<%=account %>'>可选</div>
						</div>	
						<div class="row">
							<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
						</div>
						<div class="row">
							<div></div>
				    		<div class="chuzhen"><a href='order.jsp?account=<%=account %>'>可选</div>
				    		<div></div>
				    		<div class="chuzhen"><a href='order.jsp?account=<%=account %>'>可选</div>
				    		<div></div>
				    		<div></div>
				    		<div class="chuzhen"><a href='order.jsp?account=<%=account %>'>可选</div>
						</div>	
						<div class="row">
							<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
				    		<div></div>
						</div>
			        </div>
			    </div>
			    
			    <div class="calendarrules">
			            <div class="explain">
			                【说明】<br>
			                突发情况会导致医生出诊时间、出诊地点、挂号费用等改变，具体请以医院官方信息为准。<br>
			            </div>
			    </div>
			</section>  
		</div>   
	</div>
</body>
</html>