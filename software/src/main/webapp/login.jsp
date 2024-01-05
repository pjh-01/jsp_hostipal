<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<link rel="stylesheet" href="login.css">
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
<script>
	var message = '<%=request.getParameter("message")%>';
	var account = '<%=request.getParameter("account")%>';
	if(message == "yes"){
		window.location.href = "main.jsp?account="+account;
	}
	else if(message == "account"){
		alert("该账号不存在！");	
	}
	else if(message == "password"){
		alert("密码错误！");
	}
	
	function validate(){
		var account = $('#account').val();
		var password = $('#password').val();
		if(account == ""){
			$('#tips').text("请输入用户名");
			return false;
		}
		else if(password == ""){
			$('#tips').text("请输入密码");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="l-bk"><img src="image/login-2.png"></div>
	<div class="l-box">
		<div class="l-bd">
			<div class="bd-title">
				<div>XXXXX医院</div>
				<div>统一身份验证</div>
			</div>
			<form class="bd-input" action="LoginServlet" method="get" onsubmit="return validate()">
				<div class="i-title">账号登录</div>
				<div class="i-account">
					<svg t="1669709988505" class="icon-account" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3968" width="30" height="30"><path d="M511.333 63.333c-247.424 0-448 200.576-448 448s200.576 448 448 448 448-200.576 448-448-200.576-448-448-448z m0 832c-51.868 0-102.15-10.144-149.451-30.15-36.011-15.231-69.123-35.67-98.812-60.897 12.177-31.985 42.226-63.875 84.223-88.903C396.189 686.243 456.222 669.53 512 669.53c55.631 0 115.416 16.658 164.026 45.703 41.762 24.953 71.689 56.812 83.863 88.804-29.764 25.342-62.976 45.865-99.106 61.146-47.299 20.006-97.582 30.15-149.45 30.15z m296.268-139.658c-20.493-35.937-54.353-68.855-98.747-95.381C649.75 624.979 579.839 605.53 512 605.53c-67.964 0-138.094 19.488-197.471 54.875-44.644 26.606-78.656 59.594-99.195 95.586-23.835-28.755-43.234-60.652-57.85-95.208-20.006-47.3-30.15-97.583-30.15-149.451s10.144-102.15 30.15-149.451c19.337-45.719 47.034-86.792 82.321-122.078 35.286-35.287 76.359-62.983 122.078-82.321 47.3-20.006 97.583-30.15 149.451-30.15 51.868 0 102.15 10.144 149.451 30.15 45.719 19.337 86.792 47.034 122.078 82.321 35.287 35.286 62.983 76.359 82.321 122.078 20.006 47.3 30.15 97.583 30.15 149.451s-10.144 102.15-30.15 149.451c-14.563 34.429-33.869 66.22-57.583 94.892z" fill="#ffffff" p-id="3969"></path><path d="M512 220.223c-88.224 0-160 71.776-160 160s71.776 160 160 160c88.225 0 160-71.775 160-160s-71.775-160-160-160z m0 256c-52.935 0-96-43.065-96-96s43.065-96 96-96 96 43.065 96 96-43.065 96-96 96z" fill="#ffffff" p-id="3970"></path></svg>
					<input class="in" id="account" type="text" name="account" placeholder="请输入账号">
				</div>
				<div class="i-password">
					<svg t="1669709954199" class="icon-password" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1387" width="30" height="30"><path d="M288 384v-74.666667c0-123.722667 100.266667-224 224-224s224 100.224 224 224v74.666667h10.677333C811.445333 384 864 436.597333 864 501.333333v320c0 64.821333-52.469333 117.333333-117.322667 117.333334H277.333333C212.554667 938.666667 160 886.069333 160 821.333333V501.333333c0-64.821333 52.469333-117.333333 117.322667-117.333333H288z m64 0h320v-74.666667c0-88.426667-71.605333-160-160-160-88.384 0-160 71.626667-160 160v74.666667zM224 501.333333v320c0 29.397333 23.914667 53.333333 53.322667 53.333334H746.666667A53.269333 53.269333 0 0 0 800 821.333333V501.333333c0-29.397333-23.914667-53.333333-53.322667-53.333333H277.333333A53.269333 53.269333 0 0 0 224 501.333333z" p-id="1388" fill="#ffffff"></path></svg>
					<input class="in" id="password" type="password" name="password" placeholder="请输入密码">
				</div>
				<div class="i-check">
					<input type="checkbox" name="renumber" value="1"> 记住我
					<div id="tips"></div>
				</div>
				
				<input type="submit" class="i-submit" value="登录">
			</form>				
			<div class="bd-extr">
				<div>忘记密码</div>
				<div onclick="window.location.href='register.jsp'">注册</div>
			</div>
		</div>
	</div>	
</body>
</html>