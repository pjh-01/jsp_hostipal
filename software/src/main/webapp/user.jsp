<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@ page import="util.JDBCUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人界面</title>
<link rel="stylesheet" href="user.css">
</head>
<script type="text/javascript"></script>

<script>
    window.onload = function () {
        // 解析 URL 参数
        var urlParams = new URLSearchParams(window.location.search);
        var executeFunF = urlParams.get('executeFunF');
        if (executeFunF === 'true') {
            // 执行 funF 函数
            funF();
        }
    };

    function showAddForm() {
        // 显示悬浮表单
        document.getElementById('floatingForm').style.display = 'block';
        document.getElementsByClassName('mask')[0].style.display = 'block';
    }

    function closeFloatingForm() {
        // 关闭悬浮表单
        document.getElementById('floatingForm').style.display = 'none';
        document.getElementsByClassName('mask')[0].style.display = 'none';
    }

    function uploadAvatar() {
        // 触发文件上传表单
        document.getElementById('avatarInput').click();
    }

    function funA() {
        var a = document.getElementById("a");
        var mess = document.getElementById("mess");
        var A = a.parentNode.children;
        for (var i = 0; i < A.length; i++) {
            A[i].style.backgroundColor = "#e5e5e5";
            A[i].style.borderLeft = "none";
        }
        var B = mess.parentNode.children;
        for (var i = 0; i < B.length; i++) {
            B[i].style.display = "none";
        }
        a.style.backgroundColor = "#fff";
        a.style.borderLeft = "10px solid #38ABBB";
        mess.style.display = "flex";
    }

    function funC() {
        var a = document.getElementById("c");
        var mess = document.getElementById("ic_order");
        var A = a.parentNode.children;
        for (var i = 0; i < A.length; i++) {
            A[i].style.backgroundColor = "#e5e5e5";
            A[i].style.borderLeft = "none";
        }
        var B = mess.parentNode.children;
        for (var i = 0; i < B.length; i++) {
            B[i].style.display = "none";
        }
        a.style.backgroundColor = "#fff";
        a.style.borderLeft = "10px solid #38ABBB";
        mess.style.display = "flex";
    }

    function funD() {
        var a = document.getElementById("d");
        var mess = document.getElementById("c_order");
        var A = a.parentNode.children;
        for (var i = 0; i < A.length; i++) {
            A[i].style.backgroundColor = "#e5e5e5";
            A[i].style.borderLeft = "none";
        }
        var B = mess.parentNode.children;
        for (var i = 0; i < B.length; i++) {
            B[i].style.display = "none";
        }
        a.style.backgroundColor = "#fff";
        a.style.borderLeft = "10px solid #38ABBB";
        mess.style.display = "flex";
    }

    function funE() {
        var a = document.getElementById("e");
        var mess = document.getElementById("cc_order");
        var A = a.parentNode.children;
        for (var i = 0; i < A.length; i++) {
            A[i].style.backgroundColor = "#e5e5e5";
            A[i].style.borderLeft = "none";
        }
        var B = mess.parentNode.children;
        for (var i = 0; i < B.length; i++) {
            B[i].style.display = "none";
        }
        a.style.backgroundColor = "#fff";
        a.style.borderLeft = "10px solid #38ABBB";
        mess.style.display = "flex";
    }

    function funF() {
        var a = document.getElementById("f");
        var mess = document.getElementById("cs");
        var A = a.parentNode.children;
        for (var i = 0; i < A.length; i++) {
            A[i].style.backgroundColor = "#e5e5e5";
            A[i].style.borderLeft = "none";
        }
        var B = mess.parentNode.children;
        for (var i = 0; i < B.length; i++) {
            B[i].style.display = "none";
        }
        a.style.backgroundColor = "#fff";
        a.style.borderLeft = "10px solid #38ABBB";
        mess.style.display = "flex";
    }

    function cancel(o, a) {
        var i = confirm("确认取消预约？");
        if (i == true) {
            console.log(o);
            window.location.href = 'cancel.jsp?oid=' + o + '&account=' + a;
        }

    }

    function searchRecord(recordType,date,account) {
	    // 创建 XMLHttpRequest 对象
	    var xhr = new XMLHttpRequest();
	    // 监听状态变化
	    xhr.onreadystatechange = function () {
	        if (xhr.readyState == 4 && xhr.status == 200) {
	            // 更新订单区域
	            switch(recordType){
	            	case 1:
	            		document.getElementById("order1").innerHTML = xhr.responseText;
	            		break;
            		case 2:
            			document.getElementById("order2").innerHTML = xhr.responseText;
	            		break;
            		case 3:
            			document.getElementById("order3").innerHTML = xhr.responseText;
	            		break;
	            }
	        }
	    };
	    // 发送 GET 请求，注意替换为你的 Servlet 或 JSP 地址
	    xhr.open("POST", "/software/RecordSearchServlet?recordType=" + recordType + "&date=" + date + "&account=" + account, true);
	    xhr.send();
	}

</script>
<body>
	<div class="mask" style="display: none"></div>
	<%
	String account = "";
	if (request.getParameter("account") != null) {
		account = request.getParameter("account");
	}
	%>
	<div class="m-head">
		<div class="m-title">
			<div class="t-name">XXXXX医院</div>
			<div class="t-return">
				<a href='index2.jsp?account=<%=account%>' style="color: white">返回</a>
			</div>
		</div>
	</div>
	<div class="u-box">
		<div class="u-left" id="all">
			<div onclick="window.location.href='main.jsp?account=<%=account%>'">首页</div>
			<div id="a" onclick="funA()">个人信息</div>
			<div id="c" onclick="funC()">未完成订单</div>
			<div id="d" onclick="funD()">已完成订单</div>
			<div id="e" onclick="funE()">已取消订单</div>
			<div id="f" onclick="funF()">管理就诊人</div>
			<div>
				<a href="main.jsp">退出登录</a>
			</div>
		</div>


		<div class="u-right">
			<div class="mess" id="mess">
				<%
				Connection conn = JDBCUtil.getConnection();
				PreparedStatement stmt;
				int userId = 1;
				try {

					String sql = "select * from user where account = ?";
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, account);
					ResultSet rs = stmt.executeQuery();
					while (rs.next()) {
						userId = rs.getInt("id");
						String username = rs.getString("username");
						String realName = rs.getString("realName");
						String gender = rs.getInt("gender") == 0 ? "男" : "女";
						String identification = rs.getString("identification");
						String phone = rs.getString("phone");
						String avatar = rs.getString("avatar");
				%>
				<div class="u-profile">
					<div class="intr">
						<div class="photo" style="cursor: pointer;"
							onclick="uploadAvatar()">
							<div>
								<img src="<%=avatar%>" alt="User Avatar">
							</div>
						</div>
					</div>

					<!-- 添加隐藏的文件上传表单 -->
					<form id="avatarForm" style="display: none;"
						enctype="multipart/form-data" action="FileUploadServlet"
						method="post">
						<input type="file" name="avatar" id="avatarInput" accept="image/*">
						<input type="submit" value="上传">
					</form>

					<div class="info">
						<form action="modify.jsp?account=<%=account%>" method="post">
							<label for="username">用户名：</label> <input type="text"
								name="username" id="username" value="<%=username%>"> <br>
							<label for="realName">姓名：</label> <input type="text"
								name="realName" id="realName" value="<%=realName%>"> <br>
							<label for="gender">性别：</label> <input type="text" name="gender"
								id="gender" value="<%=gender%>"> <br> <label
								for="identification">身份证号码：</label> <input type="text"
								name="identification" id="identification"
								value="<%=identification%>"> <br> <label
								for="phone">电话号码：</label> <input type="text" name="phone"
								id="phone" value="<%=phone%>"> <br> <input
								type="submit" value="保存修改">
						</form>
					</div>
				</div>
				<%
				}
				} catch (SQLException e) {
				throw new RuntimeException(e);
				}
				%>
			</div>


			<div id="ic_order">
				<%
				Statement stmt1 = conn.createStatement();
				String sql = "select * from record natural join doctor where ostatus=1 and account ='" + account + "'";
				ResultSet rs = stmt1.executeQuery(sql);
				if (rs != null) {
				%>
				<div class="ic_o_title">
					<span>未完成订单</span> <input class="search_input"
						id="record1_search_input" type="text"
						placeholder="请输入日期进行查询，如12-1">
					<button class="search_bt"
						onclick="searchRecord(1,document.getElementById('record1_search_input').value,'<%=account%>')">
						搜索</button>
				</div>
				<div class="all_order" id="order1">
					<%
					while (rs.next()) {
						int oid = rs.getInt("oid");
						String time = rs.getString("time");
						String department = rs.getString("darea");
						String dname = rs.getString("dname");
					%>
					<div class="order">
						<div class="ac">
							订单号<span>( <%=oid%> )
							</span>
						</div>
						<div class="ac_d">
							<div class="department">
								科室：<span>【<%=department%>】
								</span>
							</div>
							<div class="doc">
								就诊医师<span><%=dname%></span>
							</div>
							<div class="time">
								时间:<span><%=time%></span>
							</div>
							<div class="cancel" onclick="cancel(<%=oid%>,'<%=account%>')">取消预约</div>
						</div>
					</div>

					<%
					}
					}
					%>
				</div>
			</div>
			<div id="c_order">
				<%
				sql = "select * from record natural join doctor where ostatus=2 and account ='" + account + "'";
				rs = stmt.executeQuery(sql);
				if (rs != null) {
				%>
				<div class="ic_o_title">
					<span>已完成订单</span> <input class="search_input"
						id="record2_search_input" type="text"
						placeholder="请输入日期进行查询，如12-1">
					<button class="search_bt"
						onclick="searchRecord(2,document.getElementById('record2_search_input').value,'<%=account%>')">搜索</button>
				</div>
				<div class="all_order" id="order2">
					<%
					while (rs.next()) {
						int oid = rs.getInt("oid");
						String time = rs.getString("time");
						String department = rs.getString("darea");
						String dname = rs.getString("dname");
					%>
					<div class="order">
						<div class="ac">
							订单号<span>( <%=oid%> )
							</span>
						</div>
						<div class="ac_d">
							<div class="department">
								科室：<span>【<%=department%>】
								</span>
							</div>
							<div class="doc">
								就诊医师<span><%=dname%></span>
							</div>
							<div class="time">
								时间:<span><%=time%></span>
							</div>
						</div>
					</div>

					<%
					}
					}
					%>
				</div>
			</div>

			<div id="cc_order">
				<%
				sql = "select * from record natural join doctor where ostatus=3 and account ='" + account + "'";
				rs = stmt.executeQuery(sql);
				if (rs != null) {
				%>
				<div class="ic_o_title">
					<span>已取消订单</span> <input class="search_input"
						id="record3_search_input" type="text"
						placeholder="请输入日期进行查询，如12-1">
					<button class="search_bt"
						onclick="searchRecord(3,document.getElementById('record3_search_input').value,'<%=account%>')">
						搜索</button>
				</div>
				<div class="all_order" id="order3">
					<%
					while (rs.next()) {
						int oid = rs.getInt("oid");
						String time = rs.getString("time");
						String department = rs.getString("darea");
						String dname = rs.getString("dname");
					%>
					<div class="order">
						<div class="ac">
							订单号<span>( <%=oid%> )
							</span>
						</div>
						<div class="ac_d">
							<div class="department">
								科室：<span>【<%=department%>】
								</span>
							</div>
							<div class="doc">
								就诊医师<span><%=dname%></span>
							</div>
							<div class="time">
								时间:<span><%=time%></span>
							</div>
						</div>
					</div>

					<%
					}
					}
					%>
				</div>
			</div>


			<div id="cs">
				<!-- 悬浮的表单 -->
				<div id="floatingForm" class="floating-form" style="display: none;">
					<form id="floatingFormInner"
						action="AddPeopleServlet?account=<%=account%>&userId=<%=userId%>"
						method="post">
						<!-- 表单内容，根据你的需求添加相应的输入字段 -->
						<label for="newName">姓名：</label> <input type="text" id="newName"
							name="newName" required><br> <label for="newSex">性别：</label>
						<input type="text" id="newSex" name="newSex" required><br>
						<label for="newIdentity">身份证号码：</label> <input type="text"
							id="newIdentity" name="newIdentity" required><br>
						<button>保存</button>
					</form>
				</div>

				<div class="ic_o_title">
					<span>就诊人列表</span>
					<button onclick="showAddForm()">新增</button>
				</div>

				<%
				try {
					sql = "SELECT p.*\n" + "FROM user u\n" + "         JOIN user_people up ON u.id = up.userId\n"
					+ "         JOIN people p ON up.peopleId = p.id\n" + "WHERE u.id = ?;\n";
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, userId);
					ResultSet resultSet = stmt.executeQuery();
					while (resultSet.next()) {
						String peopleId = resultSet.getString("id");
						String sex = resultSet.getString("sex");
						String name = resultSet.getString("name");
						String identity = resultSet.getString("identity");
				%>
				<div class="all_order">
					<div class="order">
						<div class="ac">
							ID<span>( <%=peopleId%> )
							</span>
						</div>
						<div class="ac_d">
							<div class="department">
								性别<span>【<%=sex%>】
								</span>
							</div>
							<div class="doc">
								就诊人姓名<span><%=name%></span>
							</div>
							<div class="time">
								身份证号码：<br>
								<span><%=identity%></span>
							</div>
							<a
								href="deletePeople.jsp?userId=<%=userId%>&peopleId=<%=peopleId%>&account=<%=account%>">删除</a>
						</div>
					</div>
				</div>
				<%
				}
				} catch (SQLException e) {
				throw new RuntimeException(e);
				}
				%>
			</div>

		</div>
	</div>
</body>
</html>
