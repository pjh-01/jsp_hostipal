<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>预约</title>
<link rel="stylesheet" href="order.css">
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="keshidata.js"></script>
<script type="text/javascript">
	function load(){
		for(i=0;i<keshi.length;i++){
			$('.b-select').append('<div onclick="loadkeshi('+keshi[i].id+')">'+keshi[i].name+'</div>');
		}
		
	}
	function loadkeshi(n){
		console.log(keshi[n].value.length);
		$('.b-keshi').empty();
		for(i=0;i<keshi[n].value.length;i++){
			$('.b-keshi').append('<div>'+keshi[n].value[i]+'</div>')
		}
	}
</script>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String connStr = "jdbc:mysql://localhost:3306/hospital?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
	Connection conn = DriverManager.getConnection(connStr, "root", "yqc2001yqc");
	Statement stmt = conn.createStatement();
	
	String sql = "select * from doctor";
	
	ResultSet rs=stmt.executeQuery(sql);
	
%>
</head>
<body onload="load()">
	<div class="m-box">
		<div class="m-head">
			<div class="m-title">
				<div class="t-name">XXXXX医院</div>
				<div class="t-return"><a href='main.jsp?account=<%=request.getParameter("account") %>' style="color: white">返回</a></div>
			</div>
		</div>
			
		<div class="m-body">
			<div class="b-select">
				<div>科室：</div>
			</div>
			<div class="b-keshi">
			</div>
			<div class="b-list">
				<div class="list-title">
					<div>医生</div>
					<div>本院共1万+医生</div>
				</div>
			<%
				if(rs!=null){
					while(rs.next()){
						int id = rs.getInt("did");
						String dname=rs.getString("dname");
						String darea = rs.getString("darea");
						String intr = rs.getString("intr");
			%>
				<div class="list-item">
					<div class="doctor-photo">
						<img src="image/doctor.png">
					</div>
					<div class="item-info">
						<div class="doctor-info">
							<span class="doctor_name" onclick="window.location.href='do.jsp?account=<%=request.getParameter("account") %>&did=<%=id%>'"><%=dname %></span>
							<span class="doctor_rank">主治医师</span>
							<span class="doctor_department"><%=darea %></span>
							<span class="doctor_content"><%=intr %></span>
						</div>
						<div>
							<div class="sp">预约挂号</div>
							<div class="sp">点击咨询</div>
							<span class="eva"><span class="count">0条</span>患者评价</span>
						</div>
					</div>
				</div>
			<%
					}
				}
			%>
				
			</div>
		</div>
		
	</div>
</body>
</html>