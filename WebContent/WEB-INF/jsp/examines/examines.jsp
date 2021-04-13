<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师工作量申报系统</title>
<link href="${pageContext.request.contextPath}/easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
	#tb{
		height:40px;
		background: #efefef;
		
		
	}
.editSpan{
	position: relative;
	float:right;
	top: 6px;
	right: 30px;

}
.name{
	width:110px;
	text-align: right;
	display: inline-block;
	margin-right: 20px;
	
}

input{
	width:250px;
	height:27px;
	border-radius:7px;
	outline:none;

}


</style>
</head>
<body>

	<div class="easyui-panel" border="false"  style="text-align: center;">
			<div style="margin-top: 20px;">
			
				<div style="width:50%;float: left;text-align: center;" >
					<div style="margin-top: 30px;">
						<div class="name"><span>任课教师:</span></div>
						<input class="easyui-textbox" readonly="readonly"  id="name" value="${name}"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>周学时:</span></div>
						<input class="easyui-textbox" readonly="readonly"  id="coWeek" value="${courses.coWeek }"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>开课周数:</span></div>
						<input class="easyui-textbox"  id="coWenum"  readonly="readonly" value="${courses.coWenum }"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>总课时:</span></div>
						<input class="easyui-textbox"  id="coTotal"  readonly="readonly" value="${courses.coTotal } "/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>开课学期:</span></div>
						<input class="easyui-textbox"  id="coTerm"  readonly="readonly"  id="coTotal" value="${courses.coTerm }"/>
					</div>
					<div style="margin-top: 10px;">
						<div class="name"><span>工作量公式名称:</span></div>
						<input class="easyui-textbox"  id="fname"  readonly="readonly"  id="coTotal" value="${courses.coTerm }"/>
					</div>
					<div style="margin-top:10px;">
						<div class="name" ><span >X系数取值:</span></div>
						<input class="easyui-textbox"  id="Xvalue"  readonly="readonly" value="${courses.clName}"/>
					</div>
				</div>
				<div style="width:50%;float:right;text-align: left;">
					<div style="margin-top:30px;">
						<div class="name" ><span >课程名称:</span></div>
						<input class="easyui-textbox"  id="coName" readonly="readonly"  value="${courses.coName}"/>
					</div>
					<div style="margin-top: 10px;">
						<div class="name"><span>课程类型:</span></div>
						<input class="easyui-textbox"  id="coType" readonly="readonly"  value="${courses.coType}"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>开课院系:</span></div>
						<input class="easyui-textbox"  id="cName"  readonly="readonly" value="${courses.college.cName}"/>
					</div>
					<div style="margin-top:10px;">
						<div class="name" ><span >开课班级:</span></div>
						<input class="easyui-textbox"  id="clName"  readonly="readonly" value="${courses.clName}"/>
					</div>
					<div style="margin-top:10px;">
						<div class="name" ><span >班级人数:</span></div>
						<input class="easyui-textbox"  id="clName"  readonly="readonly" value="${courses.clName}"/>
					</div>
					<div style="margin-top: 10px;">
						<div class="name"><span>工作量计算公式:</span></div>
						<input class="easyui-textbox"  id="expression"  readonly="readonly" value="${courses.formula.expression}"/>
					</div>
					
					<div style="margin-top:10px;">
						<div class="name" ><span >Y系数取值:</span></div>
						<input class="easyui-textbox"  id="Yvalue"  readonly="readonly" value="${courses.clName}"/>
					</div>
					
				</div>
			</div>
			
			
			<div style="margin-top: 10px;">
				<a href="javascript:void(0)" onclick="addTCourses()" class="easyui-linkbutton" style="width:80px;height:35px;outline: none;" iconCls="icon-ok">通过</a>
				<a href="javascript:void(0)" onclick="addTCourses()" class="easyui-linkbutton" style="width:80px;height:35px;outline: none;" iconCls="icon-no">不通过</a>
			</div>
			
	</div>

</body>
</html>