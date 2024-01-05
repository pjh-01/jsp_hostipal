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
	int did = Integer.parseInt(request.getParameter("did").toString());
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
				<div class="t-return"><a href='order.jsp?account=<%=account %>' style="color: white">返回</a></div>
			</div>
		</div>
	</div>	
	<div class="wrap">
		<section class="block detailnav">
		    <div class="doctorinfo">
		        <div class="doctoravatar">
		        	<img src="image/doctor.png">
		        </div>
		        <div class="doctordetail">
		            <div class="hospitalname">
		                <h1><%=dname %></h1>
		                <i>主治医师</i>
		            </div>
		            <p class="address">
		                <em>出诊地点：</em>
		                <span class="foldcontent">
		                	<a><%=darea %></a>
		                </span>
		            </p>
		            <p class="goodat">
		      			<em>擅长领域：</em>
		          		<span class="foldcontent">
							<%=intr %>
		       			</span>
		           	</p>
		        </div>
		    </div>
		    <ul>
		        <li class="current"><a href='main.jsp?account=<%=account %>'>首页</a></li>
		        <li class=""><a>就诊评价</a></li>
		    </ul>
		</section>
		
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
				    		<div class="chuzhen" onclick="toRegister(<%=did%>,'<%=account %>','<%=month %>-<%=date+2 %> 9:00-10:00')">出诊</div>
				    		<div></div>
				    		<div class="chuzhen" onclick="toRegister(<%=did%>,'<%=account %>','<%=month %>-<%=date+4 %> 9:00-10:00')">出诊</div>
				    		<div></div>
				    		<div></div>
				    		<div class="chuzhen" onclick="toRegister(<%=did%>,'<%=account %>','<%=month %>-<%=date+7 %> 9:00-10:00')">出诊</div>
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
				    		<div class="chuzhen" onclick="toRegister(<%=did%>,'<%=account %>','<%=month %>-<%=date+2 %> 11:00-12:00')">出诊</div>
				    		<div></div>
				    		<div class="chuzhen" onclick="toRegister(<%=did%>,'<%=account %>','<%=month %>-<%=date+4 %> 11:00-12:00')">出诊</div>
				    		<div></div>
				    		<div></div>
				    		<div class="chuzhen" onclick="toRegister(<%=did%>,'<%=account %>','<%=month %>-<%=date+7 %> 11:00-12:00')">出诊</div>
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
	
		    <section class="block" id="practiceExperience">
		        <div class="title">
		            医生介绍
		        </div>
		        <div class="guide">
		                <div class="blockart foldcontent">
		                    <strong>医生简介</strong>
		                    <span>
								<p>
									<%=intr %>
								</p>                    
							</span>
		                </div>
		        </div>
		    </section>
		    <section class="block">
		        <div class="title">
		            就诊评价<span><b>0</b>条</span>
		            <a class="ask">我要评价</a>
		        </div>
		    </section>
		</div>
		<div class="sideframe">
		    <section class="block">
		        <div class="title2">同科室其他医生<a href="/hospital/1bcce_doctors.html?labId=76126">更多</a></div>
		        <ul class="sidedoctorlist">
		                <li>
		                    <strong class=""><a href="/doctor/372347.html">陈医生</a><i>主治医师</i></strong>
		                    <span>擅长：擅长治疗一切急慢性咳嗽、肺癌，胃癌，失眠；复发性口腔溃疡、口腔扁平苔癣、口腔肿瘤、牙痛，舌癌、鼻咽癌、口臭、舌痛症，牙龈...</span>
		                </li>
		                <li>
		                    <strong class=""><a href="/doctor/296002.html">蔡医生</a><i>主任医师</i></strong>
		                    <span>擅长：肝胆、消化系统疾病、特别对慢性乙肝、肝硬化、脂肪肝、胆囊炎、结石等有较多的实践与研究</span>
		                </li>
		                <li>
		                    <strong class=""><a href="/doctor/296000.html">李医生</a><i>副主任医师</i></strong>
		                    <span>擅长：擅长于月经不调、盆腔炎、更年期综合症等妇科疾病的中医治疗,在胃肠、肝病、呼吸道等内科疾病中医治疗方面亦有较深造诣</span>
		                </li>
		                <li>
		                    <strong class=""><a href="/doctor/295996.html">邓医生</a><i>主任医师</i></strong>
		                    <span>擅长：肝胆胃肠病、糖脂代谢病、咳嗽虚损及各种肿瘤和疑难病症的中医诊治；养生保健咨询</span>
		                </li>
		                <li>
		                    <strong class=""><a href="/doctor/295995.html">吴医生</a><i>主任医师</i></strong>
		                    <span>擅长：中西医结合融会贯通治疗各种疑难病症</span>
		                </li>
		                <li>
		                    <strong class=""><a href="/doctor/295997.html">范医生</a><i>副主任医师</i></strong>
		                    <span>擅长：消化道疾病、脂肪肝、糖尿病、肿瘤及老年性疾病的中医治疗</span>
		                </li>
		        </ul>
		    </section>
		 </div>   
	</div>
</body>
</html>