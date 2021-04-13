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

span{
	width:100px;
	height:30px;
	margin-right: 20px;

}

input{
	width: 250px;
	height:30px;
	border-radius: 6px;
	text-align: left;
	outline: none;
}
.name{
	width:100px;
	text-align: right;
	display: inline-block;
	
}

</style>

</head>
<body>

	<div class="easyui-panel" border="false" style="text-align: center;">
		<div style="margin-top: 30px;" >
			<div class="name"><span>用户类型:</span></div>
			<select id="selectLevel" style="width:250px;height:30px;border-radius: 5px;" >
				<option value="1">系统管理员</option>
				<option value="2">教务管理员</option>
				<option value="3">系部管理员</option>
				<option value="4">老师</option>
			</select>
		</div>
		<div style="margin-top: 10px;">
			<div class="name"><span>所属教研室:</span></div>
			<select id="selectwId" style="width:250px;height:30px;border-radius: 5px;">
				<c:forEach items="${list}" var="w">
					<option value="${w.wId}">${w.workName}</option>		
				</c:forEach>
			</select>
		
		</div>
		<div style="margin-top: 10px;">
			<div class="name"><span>用户名:</span></div>
			<input class="easyui-validatebox" data-options="required:true" id="username"/>
		</div>
		<div style="margin-top: 10px;">
		<div class="name"><span>密码:</span></div>
			<input class="easyui-validatebox" data-options="required:true,validType:'length[6,12]'" type="password" id="password"/>
		</div>
		<div style="margin-top: 10px;">
			<div class="name"><span>确认密码:</span></div>
			<input class="easyui-validatebox" type="password"  data-options="required:true,validType:'length[6,12]'"   id="password1"/>
		</div>
		<div style="margin-top: 10px;">
			<div class="name"><span>用户名姓名:</span></div>
			<input class="easyui-validatebox" data-options="required:true" id="name"/>
		</div>
		<div style="margin-top: 10px;">
			<div class="name"><span>邮箱:</span></div>
			<input class="easyui-validatebox " data-options="required:true,validType:'email'" id="email"/>
		</div>
		<div style="margin-top: 10px;">
			<div class="name"><span>电话号码:</span></div>
			<input class="easyui-validatebox" data-options="required:true,validType:'length[11,11]'" id="phone"/>
		</div>
		<div style="margin-top: 20px;">
			<a href="javascript:void(0)" onclick="insertUser()" class="easyui-linkbutton" style="width:100px;outline: none;" iconCls="icon-add">注册</a>
		</div>
	</div>



</body>

<script type="text/javascript">
	function insertUser(){
		var level=$("#selectLevel option:selected").val();
		var wId=$("#selectwId option:selected").val();
		var username=$("#username").val();
		var password=$("#password").val();
		var password1=$("#password1").val();
		var name=$("#name").val();
		var email=$("#email").val();
		var phone=$("#phone").val();
		if(level==""){
			alert("请选择用户类型!");
			return false;
		}
		if(wId==""){
			alert("请选择用户所属教研室!");
			return false;
		}
		if(username==""){
			alert("用户名不能为空!");
			return false;
		}
		if(password==""||password1==""){
			alert("用户密码不能为空!");
			return false;
		}
		if(password!=password1){
			alert("输入密码不一致!");
			return false;
		}
		if(name==""){
			alert("用户名姓名不能为空!");
			return false;
		}
		
		if(email==""){
			alert("用户邮箱不能为空!");
			return false;
		}
		if(phone==""){
			alert("电话号码不能为空!");
			return false;
		}
		var data={
				roleid:	level,
				wId:wId,
				username:username,
				password:password,
				name:name,
				email:email,
				phone:phone
			};
		$.ajax({
			url:'${pageContext.request.contextPath}/user/insert.action',
			type:'post',
			data:data,
			success:function(e){
				alert(e.msg);
				window.location="${pageContext.request.contextPath}/user/insertUser.action";
			}
		})
		
		
	}

</script>
</html>