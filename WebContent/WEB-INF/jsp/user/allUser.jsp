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
	width:100px;
	text-align: right;
	display: inline-block;
	margin-right: 10px;
	
}

input{
	width:250px;
	height:27px;
	border-radius:7px;
	outline:none;
	

}


</style>

<script type="text/javascript">

var workName="";
$(function(){
	$("#ew").window("close");
	$("#warn").window("close");
	$("#warn1").window("close");
	$("#delete").window("close");
});

	function deleteUser(){
		var row=$("#dg").datagrid("getSelected");
		
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			$("#warn1").window("open");
		}
		
		
	}
	
	function certain(){
		var row=$("#dg").datagrid("getSelected");
		$.ajax({
			url:'${pageContext.request.contextPath}/user/delete.action',
			type:'post',
			data:{'userId':row.userid},
			success:function(e){
				var html='<span>'+(e.msg)+'</span>';
				$("#delete").html(html);
				$("#delete").window("open");
				$("#warn1").window("close");
				//window.location="${pageContext.request.contextPath}/user/selectAll.action";
			}
		})
	}
	
	
	function cancel(){
		$("#warn1").window("close");
	}


	function delHtmlTag(str){
	
		return str.toString().match(/[\u4e00-\u9fa5]/g).join("");//取其中的汉字
		//.*\/(?<room>.*)(?<shi>\d).*(?<ting>\d).*(?<wei>\d).*
	}
	
	function delHtmlTag1(str){
		return str.toString().match(/[0-9a-zA-Z\u4e00-\u9fa5]/g).join("");//取其中的汉字与数字
	}
	
function updateUser(){
	var row=$("#dg").datagrid("getSelected");
	if(row==null||row==""){
		$("#warn").window("open");
	}else{
		$("#ew").window("open");
		var roleid=delHtmlTag(row.roleid);
		var workName=delHtmlTag1(row.wId);//获取原用户所属教研室
		$.ajax({
			url:'${pageContext.request.contextPath}/workteam/selectAllworkteam.action',
			type:'post',
			data:'',
			success:function(e){
				console.log(e[0].wId);
				
				var html="";
				 html+='<div style="margin-top: 30px;">'+
					'<span class="name">用户编号:</span>'+
					'<input type="text" class="easyui-validatebox" readonly="readonly" style="width:70px;text-align:center;font-weight: bold;"  id="userid" value="'+(row.userid)+'" />'+
				'</div>'+
					 '<div style="margin-top: 10px;" >'+
					'<div class="name"><span>用户类型:</span></div>'+
					'<select id="selectLevel" style="width:250px;height:30px;border-radius: 5px;" >'+
						'<option value="1">系统管理员</option>'+
						'<option value="2">教务管理员</option>'+
						'<option value="3">系部管理员</option>'+
						'<option value="4">老师</option>'+
					'</select>'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
				'<div class="name"><span>所属教研室:</span></div>'+
				'<select id="selectwId" style="width:250px;height:30px;border-radius: 5px;"><div></div></select>'+
			'</div>';
			
			
			
		html+='<div style="margin-top: 10px;">'+
				'<span class="name">用户名:</span>'+
				'<input type="text" class="easyui-validatebox"  id="username" value="'+(row.username)+'" />'+
			'</div>'+
			/* '<div style="margin-top: 10px;">'+
			'<div class="name"><span>密码:</span></div>'+
				'<input class="easyui-validatebox"  data-options="required:true,validType:'+"length[6,12]"+'" type="password" id="password"  value="'+(row.password)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
				'<div class="name"><span>确认密码:</span></div>'+
				'<input class="easyui-validatebox" type="password"  data-options="required:true,validType:'+"length[6,12]"+'"   id="password1" value="'+(row.password)+'" />'+
			'</div>'+ */
			'<div style="margin-top: 10px;">'+
			'<span class="name">用户名姓名:</span>'+
			'<input type="text" class="easyui-validatebox"  id="name" value="'+(row.name)+'" />'+
		'</div>'+
			'<div style="margin-top: 10px;">'+
				'<div class="name"><span>邮箱:</span></div>'+
				'<input class="easyui-validatebox " data-options="required:true,validType:'+"email"+'" id="email" value="'+(row.email)+'"  />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
				'<div class="name"><span>电话号码:</span></div>'+
				'<input class="easyui-validatebox" data-options="required:true,validType:'+"length[11,11]"+'"" id="phone"  value="'+(row.phone)+'"   />'+
			'</div>'+
			'<div style="margin-top: 10px;text-align:center; ">'+
				'<a href="javascript:void(0)" onclick="update()" style="width:100px;"><button style="width:100px;" type="sumbit">提交</button></a>'+
			'</div>';
			
			$("#ew").html(html);
			
			 $.each(e,function(n,v){
					console.info(v.wId+"--"+v.workName);
					console.info(v.workName+"---"+workName)
					if(workName==v.workName){
						
						var html1='<option value="'+(v.wId)+'" selected="selected">'+(v.workName)+'</option>';
					}else{
						var html1='<option value="'+(v.wId)+'">'+(v.workName)+'</option>';
					}
					
					$("#selectwId").append(html1);
						
				});
			 
			 
			 
			if(roleid=="系统管理员"){
				$("#selectLevel option[value='1']").attr("selected","selected");
			}else if(roleid=="教务管理员"){
				$("#selectLevel option[value='2']").attr("selected","selected");
			}else if(roleid=="系部管理员"){
				$("#selectLevel option[value='3']").attr("selected","selected");
			}else if(roleid=="老师"){
				$("#selectLevel option[value='4']").attr("selected","selected");
			}
		 
		
				
			} 
		});
		
	
	}
}

function update(){
	var row=$("#dg").datagrid("getSelected");
	var level=$("#selectLevel option:selected").val();
	var wId=$("#selectwId option:selected").val();
	
	var userid=$("#userid").val();
	//alert(userid);
	var username=$("#username").val();
	/* var password=$("#password").val();
	var password1=$("#password1").val(); */
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
	/* if(password==""||password1==""){
		alert("用户密码不能为空!");
		return false;
	}
	if(password!=password1){
		alert("输入密码不一致!");
		return false;
	} */
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
			userid:userid,
			roleid:	level,
			wId:wId,
			username:username,
			name:name,
			email:email,
			phone:phone,
			oldusername:row.username
		};
	 $.ajax({
		url:'${pageContext.request.contextPath}/user/update.action',
		type:'post',
		data:data,
		success:function(e){
			if(e.success){
				window.location="${pageContext.request.contextPath}/user/selectAll.action";
			}else {
				alert(e.msg);
				window.location="${pageContext.request.contextPath}/user/selectAll.action";
			}
		}
	}); 
}
function warn(){
	$("#warn").window("close");
}








</script>
</head>
<body>
<div id="tb">
		<span class="editSpan">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteUser()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateUser()">修改</a>
		</span>
</div> 
<table id="dg" class="easyui-datagrid" border="false" order="false" data-options="pagination:true,fitColumns:true,rownumbers:true,singleSelect:true" emptyMsg="暂无数据！" >
		<thead>	
			<th field=userid width="100" align="center">用户编号</th>
			<th field=roleid width="100" align="center">用户类型</th>
			<th field=wId width="200" align="center">所属教研室</th>
			<th field=username width="200" align="center">用户名</th>
			<th field=password width="270" align="center">密码</th>
			<th field=name width="200" align="center">用户名姓名</th>
			<th field=email width="250" align="center">邮箱</th>
			<th field=phone width="200" align="center">电话号码</th>
		</thead>
		<c:if test="${list.size()==0}">
				<div class="easyui-window" title="提示" style="width:200px;height:100px;text-align: center;">
					<span>暂无数据！</span>
				</div>
		</c:if>
		<c:if test="${list.size()!=0}">
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.userid }</td>
				<td>
					<c:if test="${u.roleid==1}">
						<span>系统管理员</span>
					</c:if>
					<c:if test="${u.roleid==2}">
						<span>教务管理员</span>
					</c:if>
					<c:if test="${u.roleid==3}">
						<span>系部管理员</span>
					</c:if>
					<c:if test="${u.roleid==4}">
						<span>老师</span>
					</c:if>
				</td>
				<td>
					<c:forEach items="${listworkteam}" var="w">
						<c:if test="${w.wId==u.wId}">${w.workName}</c:if>
					</c:forEach>
				</td>
				<td>${u.username}</td>
				<td>${u.password}</td>
				<td>${u.name}</td>
				<td>${u.email}</td>
				<td>${u.phone}</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<div class="easyui-window" id="ew" title="修改数据" style="width:500px;height:500px; ">
	
</div>

<div class="easyui-window" id="delete" title="提示" style="width:200px;height:100px;text-align: center; ">
	
</div>

<div class="easyui-window" id="warn" title="警告" style="width:200px;height:150px;text-align: center;">
	<p>请选择一行数据!</p>
	<div style="margin-top: 20px;">
		<a href="javascript:void(0)" onclick="warn()" class="easyui-linkbutton" >确定</a>
	</div>
</div>

<div class="easyui-window" id="warn1" title="警告" style="width:200px;height:150px;text-align: center;">
	<p>确定删除数据!</p>
	<div style="margin-top: 20px;">
		<a href="javascript:void(0)" onclick="certain()" class="easyui-linkbutton" >确定</a>
		<a href="javascript:void(0)" onclick="cancel()" class="easyui-linkbutton" >取消</a>
	</div>
</div>

</body>
</html>