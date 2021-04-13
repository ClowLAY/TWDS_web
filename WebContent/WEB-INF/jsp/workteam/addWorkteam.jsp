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
</head>
<body>

	<div class="easyui-panel" style="text-align: center;"  border="false" >
		<div style="margin-top: 30px;">
			<span style="font-style: blod;margin-right: 10px;">所属二级学院:</span>
			<select id="select" style="width:250px;height:30px;border-radius: 5px;" >
				<c:forEach items="${list}" var="li">
					<option value="${li.cId}">${li.cName }</option>
				</c:forEach>
				
				<!-- <option value="1">信息工程学院</option>
				<option value="2">经济管理学院</option>
				<option value="3">艺术设计学院</option>
				<option value="4">车辆运用学院</option>
				<option value="5">车辆工程学院</option>
				<option value="6">机电管理学院</option>
				<option value="7">士官教育学院</option> -->
			</select>
		</div>
		<div style="margin-top: 10px;">
			<span style="font-style: blod;margin-right: 10px;">&nbsp;&nbsp;&nbsp;教研室名称:</span>
			<input type="text" class="easyui-textbox" style="width:250px;height:30px;border-radius:7px; "  id="workteamName"/>
		</div>
		<div style="margin-top: 10px;">
			<a href="javascript:void(0)" onclick="addWorkteam()" class="easyui-linkbutton" style="width:100px;" iconCls="icon-add">添加</a>
			
		</div>
	
	</div>


</body>
<script type="text/javascript">

	function addWorkteam(){
		var college=$("#select option:selected").val();
		
		var workteamName=$("#workteamName").val();
		if(college==""){
			alert("请选择二级学院");
			return false;
		}
		if(workteamName==""){
			alert("请输入教研室名称");
			return false;
		}
		var data={'cId':college,'workName':workteamName}
		$.ajax({
			url:'${pageContext.request.contextPath}/workteam/insert.action',
			type:'post',
			data:data,
			success:function(e){
				alert(e.msg);
				if(e.success){
					window.location="${pageContext.request.contextPath}/workteam/insertView.action";
				}
			}
		})
	}

</script>

</html>