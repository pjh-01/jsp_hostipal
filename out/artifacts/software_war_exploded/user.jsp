<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人界面</title>
<link rel="stylesheet" href="user.css">
</head>
<script type="text/javascript" ></script>

<script>
	function funA(){
		var a=document.getElementById("a");
		var mess=document.getElementById("mess");
		var A = a.parentNode.children;
		for(var i = 0; i < A.length; i++){  
		    A[i].style.backgroundColor ="#e5e5e5";  
		    A[i].style.borderLeft="none";
		}
		var B = mess.parentNode.children;
		for(var i = 0; i < B.length; i++){  
		    B[i].style.display ="none";  
		} 
		a.style.backgroundColor ="#fff";
		a.style.borderLeft="10px solid #38ABBB";
		mess.style.display="flex";
	}
	function funC(){
		var a=document.getElementById("c");
		var mess=document.getElementById("ic_order");
		var A = a.parentNode.children;
		for(var i = 0; i < A.length; i++){  
		    A[i].style.backgroundColor ="#e5e5e5";  
		    A[i].style.borderLeft="none";
		}
		var B = mess.parentNode.children;
		for(var i = 0; i < B.length; i++){  
		    B[i].style.display ="none";  
		} 
		a.style.backgroundColor ="#fff";
		a.style.borderLeft="10px solid #38ABBB";
		mess.style.display="flex";
	}
	function funD(){
		var a=document.getElementById("d");
		var mess=document.getElementById("c_order");
		var A = a.parentNode.children;
		for(var i = 0; i < A.length; i++){  
		    A[i].style.backgroundColor ="#e5e5e5";  
		    A[i].style.borderLeft="none";
		}
		var B = mess.parentNode.children;
		for(var i = 0; i < B.length; i++){  
		    B[i].style.display ="none";  
		} 
		a.style.backgroundColor ="#fff";
		a.style.borderLeft="10px solid #38ABBB";
		mess.style.display="flex";
	}
	function funE(){
		var a=document.getElementById("e");
		var mess=document.getElementById("cc_order");
		var A = a.parentNode.children;
		for(var i = 0; i < A.length; i++){  
		    A[i].style.backgroundColor ="#e5e5e5";  
		    A[i].style.borderLeft="none";
		}
		var B = mess.parentNode.children;
		for(var i = 0; i < B.length; i++){  
		    B[i].style.display ="none";  
		} 
		a.style.backgroundColor ="#fff";
		a.style.borderLeft="10px solid #38ABBB";
		mess.style.display="flex";
	}
	function funF(){
		var a=document.getElementById("f");
		var mess=document.getElementById("cs");
		var A = a.parentNode.children;
		for(var i = 0; i < A.length; i++){  
		    A[i].style.backgroundColor ="#e5e5e5";  
		    A[i].style.borderLeft="none";
		}
		var B = mess.parentNode.children;
		for(var i = 0; i < B.length; i++){  
		    B[i].style.display ="none";  
		} 
		a.style.backgroundColor ="#fff";
		a.style.borderLeft="10px solid #38ABBB";
		mess.style.display="flex";
	}
	function cancel(o,a){
		var i = confirm("确认取消预约？");
		if(i==true){
			console.log(o);	
			window.location.href='cancel.jsp?oid='+o+'&account='+a;
		}
		
	}
</script>
<body>
<%
	String account = "";
	if(request.getParameter("account") != null){
		account = request.getParameter("account");
	}
%>
	<div class="m-head">
			<div class="m-title">
				<div class="t-name">XXXXX医院</div>
				<div class="t-return"><a href='main.jsp?account=<%=account %>' style="color: white">返回</a></div>
			</div>
		</div>
	<div class="u-box">
		<div class="u-left" id="all">
			<div onclick="window.location.href='main.jsp?account=<%=account %>'">首页</div>
			<div id="a" onclick="funA()">个人信息</div>
			<div id="c" onclick="funC()">未完成订单</div>
			<div id="d" onclick="funD()">已完成订单</div>
			<div id="e" onclick="funE()">已取消订单</div>
			<div id="f" onclick="funF()">管理就诊人</div>	
			<div><a href="main.jsp">退出登录</a></div>
		</div>
		
		
		
		<div class="u-right">
			<div class="mess" id="mess">
				<div class="intr">
					<div class="photo">
						<div>
							<img src="image/touxiang.jpeg">
						</div>
					</div>
				</div>
				<a id="account">用户名：寿司猫猫</a>
				<a id="name">姓名：李XX</a>
				<a id="sex">性别：男</a>
				<a id="identity">身份证号码：1234567890</a>
				<a id="pnum">电话号码：1145141919810</a>
			</div>
			
			

			<div id="ic_order">
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	String connStr = "jdbc:mysql://localhost:3306/hospital?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
	Connection conn = DriverManager.getConnection(connStr, "root", "112629");
	Statement stmt = conn.createStatement();
	String sql = "select * from record natural join doctor where ostatus=1 and account ='"+account+"'";
	ResultSet rs=stmt.executeQuery(sql);
	if(rs!=null){
%>
				<div class="ic_o_title"><span>未完成订单</span></div>
				<div class="all_order">
<%
	int no = 0;
	while(rs.next()){
		no++;
		int oid=rs.getInt("oid");
		String time = rs.getString("time");
		String department = rs.getString("darea");
		String dname = rs.getString("dname");
%>
<div class="order">
	<div class="ac">订单号<span>( <%=no %> )</span></div>
	<div class="ac_d">
		<div class="department">科室：<span>【<%=department %>】</span></div> 
		<div class="doc">就诊医师<span><%=dname %></span></div>
		<div class="time">时间:<span><%=time %></span></div>
		<div class="cancel" onclick="cancel(<%=oid%>,'<%=account%>')">取消预约</div>
	</div>
</div>

<%
	}}
%>
				</div>				
			</div>
			<div id="c_order">
		<%
	sql = "select * from record natural join doctor where ostatus=2 and account ='"+account+"'";
	rs=stmt.executeQuery(sql);
	if(rs!=null){
%>
				<div class="ic_o_title"><span>已完成订单</span></div>
				<div class="all_order">
<%
	int no = 0;
	while(rs.next()){
		no++;
		int oid=rs.getInt("oid");
		String time = rs.getString("time");
		String department = rs.getString("darea");
		String dname = rs.getString("dname");
%>
<div class="order">
	<div class="ac">订单号<span>( <%=no %> )</span></div>
	<div class="ac_d">
		<div class="department">科室：<span>【<%=department %>】</span></div> 
		<div class="doc">就诊医师<span><%=dname %></span></div>
		<div class="time">时间:<span><%=time %></span></div>
	</div>
</div>

<%
	}}
%>
				</div>	
			</div>
			
			
			<div id="cc_order">
<%
	sql = "select * from record natural join doctor where ostatus=3 and account ='"+account+"'";
	rs=stmt.executeQuery(sql);
	if(rs!=null){
%>
				<div class="ic_o_title"><span>已取消订单</span></div>
				<div class="all_order">
<%
	int no = 0;
	while(rs.next()){
		
		no++;
		int oid=rs.getInt("oid");
		String time = rs.getString("time");
		String department = rs.getString("darea");
		String dname = rs.getString("dname");
%>
<div class="order">
	<div class="ac">订单号<span>( <%=no %> )</span></div>
	<div class="ac_d">
		<div class="department">科室：<span>【<%=department %>】</span></div> 
		<div class="doc">就诊医师<span><%=dname %></span></div>
		<div class="time">时间:<span><%=time %></span></div>
	</div>
</div>

<%
	}}
%>
				</div>	
			</div>
			
			
			<div id="cs">
<%
	sql = "select * from people where id=4";
	rs =stmt.executeQuery(sql);
	if(rs!=null){
%>
				<div class="ic_o_title"><span>就诊人列表</span></div>
				<div class="all_order">
<%
	int no = 0;
	while(rs.next()){
		no++;
		int id=rs.getInt("id");
		String sex = rs.getString("sex");
		String name = rs.getString("name");
		String identity = rs.getString("identity");
%>
<div class="order">
	<div class="ac">ID<span>( <%=no %> )</span></div>
	<div class="ac_d">
		<div class="department">性别<span>【<%=sex %>】</span></div> 
		<div class="doc">就诊人姓名<span><%=name %></span></div>
		<div class="time">身份证号码：<br><span><%=identity %></span></div>
	</div>
</div>

<%
	}}
%>
				</div>
				</div>

		</div>
	</div>
</body>
</html>