<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>index2</title>
    <link rel="stylesheet" href="detail.css" />
    <link
      rel="stylesheet"
      href="http://at.alicdn.com/t/c/font_4198205_8ezycmfr718.css"
    />
    <script type="text/javascript" src="jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		function goTo(){
			if('<%=request.getParameter("account")%>' != 'null'){
				window.location.href = "order.jsp?account="+'<%=request.getParameter("account")%>';
			}
			else{
				alert("请先登录账号")
				window.location.href = "login.jsp";
			}
		}
	</script>
  </head>
  <body>
  <%
	String account = "";
	if(request.getParameter("account") != null){
		account = request.getParameter("account");
	}
	%>
    <div class="container">
      <div id="slide">
        <div class="item" style="background: url(./image/3.png)">
          <div class="content">
            <div class="name">线上就医</div>
            <div class="text">
              XXXXXXXXXXXXXXXXXXXXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
            </div>
            <a href="order.jsp" target="opentype"><button>进入</button></a>
          </div>
        </div>
        
        <div class="item" style="background: url(./image/1.png)">
          <div class="content">
            <div class="name">预约挂号</div>
            <div class="text">XXXXXXXXXXXXXXXXXXXX</div>
            <button onclick="goTo()">进入</button>
            <%
					if(account == ""){
				%>
				<a href="login.jsp" style="color: white"><button>登录</button></a></div>
				<%
					}else{
				%>
				<a href="user.jsp?account=<%=account %>"><button><%=account %></button></a></div>
				<%	} %>
            
          </div>
        </div>

        <div class="item" style="background: url(./image/4.png)">
          <div class="content">
            <div class="name">就诊指南</div>
            <div class="text">XXXXXXXXXXXXXXXXXXXX</div>
            <a href="layout.html" target="opentype"><button>进入</button></a>
          </div>
        </div>

        <div class="item" style="background: url(./image/5.png)">
          <div class="content">
            <div class="name">门诊安排</div>
            <div class="text">XXXXXXXXXXXXXXXXXXXX</div>
            <a href="do2.jsp?account=<%=account %>" target="opentype"><button>进入</button></a>
          </div>
        </div>

        <div class="item" style="background: url(./image/2.png)">
          <div class="content">
            <div class="name">专家介绍</div>
            <div class="text">XXXXXXXXXXXXXXXXXXXX</div>
            <a href="doctors.html?account=<%=account %>" target="opentype"><button>进入</button></a>
          </div>
        </div>
		
		<div class="item" style="background: url(./image/index.jpg)">
          <div class="content">
            <div class="name">XXX</div>
            <div class="text">XXXXXXXXXXXXXXXXXXXX</div>
            <a href="layout.html" target="opentype"><button>进入</button></a>
          </div>
        </div>
      


   
    <div class="buttons">
      <button id="next">
        <i class="iconfont icon-left_double"></i>
      </button>
      <button id="prev">
        <i class="iconfont icon-right_double"></i>
      </button>
    </div>
    <script>
		
		document.getElementById("next").onclick = function () {
  			let lists = document.querySelectorAll(".item");
  			document.getElementById("slide").appendChild(lists[0]);
		};
		document.getElementById("prev").onclick = function () {
  			let lists = document.querySelectorAll(".item");
  			document.getElementById("slide").prepend(lists[lists.length - 1]);
		};

	</script>
  </body>
</html>
