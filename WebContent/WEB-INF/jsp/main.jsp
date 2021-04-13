<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师工作量申报系统</title>
<link href="${pageContext.request.contextPath}//css/main.css" rel="stylesheet" type="text/css" charset="utf-8"/> 
<link href="${pageContext.request.contextPath}/easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css"/>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	$(function(){
		$("#ew").window("close");
		$("#warn").window("close");
		var roleid='<%=session.getAttribute("roleid")%>';
		if(roleid==1||roleid==2){
			addTabs('首页','courses/selectAll');
		}else{
			addTabs('首页','tCourses/selectAll');
		}
		
		
	})
	
	function addTab(title,url){
		
		if($("#tabs").tabs('exists',title)){
			$('#tabs').tabs('select',title);
		}else{
		
			addTabs(title,url);
		}
	}
	
	
	
	function warn(){
		$("#warn").window("close");
	}



</script>



</head>
<body class="easyui-layout" style="margin: 3px;" >
<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = sdf.format(date);
	%>

	<div data-options="region:'north',split:true" style="height:90px;background:linear-gradient(#4169E1,#fff);border-radius: 5px;" >
		<h1 class="title" style="color: white;">教师工作量申报系统</h1>
		<p class="title-username">欢迎您!  &nbsp; <span style="color: blue;">${user.name}</span><span>&nbsp;&nbsp;${role.level}&nbsp;&nbsp;</span> <a href="logout.action" class="easyui-linkbutton" >注销</a>
		</br><span style="color: #000;" >登录时间:<%= datetime%></span></p>	
		
	</div>
	<div data-options="region:'west',split:true,title:'目录',iconCls:'icon-back'"  style="width:200px;">
		<ul class="easyui-tree"  data-options="lines:true">
		<c:if test="${role.roleid==4||role.roleid==3}">
			<li><a href="javascript:void(0)" onclick="addTabs('月度教学工作量申报','tCourses/DeclareTCoursesView')" >月度教学工作量申报</a></li>
			<li><a href="javascript:void(0)" onclick="addTabs('已申报月度教学工作量汇总','examines/MoWorkLoad')" >已申报月度教学工作量汇总</a></li>
		</c:if>
		<c:if test="${role.roleid==3}">
			<li><a href="javascript:void(0)" onclick="addTabs('课程信息','courses/selectAll')" >课程信息</a></li>
		</c:if>
		
		<c:if test="${role.roleid==2||role.roleid==1||role.roleid==3}">
			<li data-options="state:'closed'">
							<span>工作量审核管理</span>
							<ul>
								<li ><a href="javascript:void(0)" onclick="addTabs('待审核工作量汇总','examines/selectAllTCourses')" >待审核工作量汇总</a></li>
								<li><a href="javascript:void(0)" onclick="addTabs('已审核工作量汇总','examines/selectAllexamines')" >已审核工作量汇总</a></li>
							</ul>
			</li>
			<c:if test="${role.roleid==1||role.roleid==2}">
				
				<li data-options="state:'closed'">
					<span>课程信息管理</span>
					<ul>
						<li><a href="javascript:void(0)" onclick="addTabs('分配课程','courses/DisCoursesView')">分配课程</a></li>
						<li><a href="javascript:void(0)" onclick="addTabs('添加课程','courses/addCoursesView')">添加课程</a></li>
					</ul>
				</li>
				<li data-options="state:'closed'">
					<span>教师工作量汇总管理</span>
					<ul>
						<li><a href="javascript:void(0)" onclick="addTabs('教师教学工作量汇总','tCourses/selectAllTworkload')">教师教学工作量汇总</a></li>
						<li><a href="javascript:void(0)" onclick="addTabs('教师其它工作量汇总','tCourses/selectAllOworkload')">教师其它工作量汇总</a></li>
					</ul>
				</li >
				
				
				
				<li data-options="state:'closed'">	
					<span>工作量计算公式管理</span>
					<ul>
						<li><a href="javascript:void(0)" onclick="addTabs('工作量计算公式','formula/selectAll')">工作量计算公式</a></li>
						<li><a href="javascript:void(0)" onclick="addTabs('添加工作量计算公式','formula/addFormulaView')">添加工作量计算公式</a></li>
					</ul>
				</li >
				
				<li data-options="state:'closed'">
					<span>其它工作量管理</span>
					<ul>
						<li><a href="javascript:void(0)" onclick="addTabs('其它工作量信息','Oworkload/selectAll')">其它工作量信息</a></li>
						<li><a href="javascript:void(0)" onclick="addTabs('分配工作量','Oworkload/DisOworkload')">分配工作量</a></li>
						<li><a href="javascript:void(0)" onclick="addTabs('添加其它工作量','Oworkload/insertView')">添加其它工作量</a></li>
					</ul>
				</li>
					
				<li data-options="state:'closed'">
					<span>学院管理</span>
					<ul>
						<li><a href="javascript:void(0)" onclick="addTabs('学院信息','college/selectAll')">学院信息</a></li>
						<li><a href="javascript:void(0)" onclick="addTabs('添加学院','college/insertView')">添加学院</a></li>
					</ul>
				</li>
				<li data-options="state:'closed'">
					<span>班级管理</span>
					<ul>
						<li><a href="javascript:void(0)" onclick="addTabs('班级信息','classes/selectAll')">班级信息</a></li>
						<li><a href="javascript:void(0)" onclick="addTabs('添加班级','classes/addClassView')">添加班级</a></li>
					</ul>
				</li>
				
				<li data-options="state:'closed'">
					<span>专业管理</span>
					<ul>
						<li><a href="javascript:void(0)" onclick="addTabs('专业信息','major/selectAll')">专业信息</a></li>
						<li><a href="javascript:void(0)" onclick="addTabs('添加专业','major/insertView')">添加专业</a></li>
					</ul>
				</li>
			</c:if>
			
			<li data-options="state:'closed'">
				<span>教研室管理</span>
				<ul>
					<li><a href="javascript:void(0)" onclick="addTabs('教研室管理','workteam/selectAll')">教研室信息</a></li>
					<li><a href="javascript:void(0)" onclick="addTabs('添加教研室','workteam/insertView')">添加教研室</a></li>
				
				</ul>
			</li>
			<li data-options="state:'closed'">
				<span>用户管理</span>
				<ul>
					<li><a href="javascript:void(0)" onclick="addTabs('用户信息','user/selectAll')">用户信息</a></li>
					<li><a href="javascript:void(0)" onclick="addTabs('添加用户','user/insertUser')">添加用户</a></li>
				
				</ul>
			</li>
		</c:if>
		
			
			<li data-options="state:'closed'">
				<span>个人中心</span>
				<ul>
					<li><a href="javascript:void(0)" onclick="addTabs('修改密码','personal/updatePasswordView')" >修改密码</a></li>
				
				</ul>
			</li>
		</ul>
	</div>
	<div  data-options="region:'center',title:''" style="overflow: hidden;" >
		<div id="tabs" class="easyui-tabs" border="false"  fit="true" style="overflow: hidden;" >
			<%-- <c:if test="${role.roleid==1||role.roleid==2||role.roleid==3}">
				
			</c:if>
		
			
			<c:if test="${role.roleid==4}">
				<div title="首页" >
					hello world!333333</br>
					hello world!333333
				</div>
			</c:if> --%>
		</div>
	</div>
	<div region="south" title="" split="true" style="height: 54px;background:linear-gradient(#4169E1,#fff);border-radius: 2px solid #1E90FF; " >
		<p style="text-align: center;color: white;">技术支持    |  关于   |   @版权所有</p>
	</div>

	
	
	
<div class="easyui-window" id="ew" title="修改数据" style="width:500px;height:500px; ">
	
</div>

<div class="easyui-window" id="warn" title="警告" style="width:200px;height:150px;text-align: center;">
	<p>请选择一行数据!</p>
	<div style="margin-top: 20px;">
		<a href="javascript:void(0)" onclick="warn()" class="easyui-linkbutton" >确定</a>
	</div>
</div>
	
	
	
</body>
</html>