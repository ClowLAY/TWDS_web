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
	width:120px;
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
	$(function(){
		$("#ew").window("close");
		$("#warn").window("close");
		$("#warn1").window("close");
	});
	
	function warn(){
		$("#warn").window("close");
	}
	
	
	function deleteOworkload(){
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			//alert("--"+cId+"--"+row.workName);
			$("#warn1").window("open");
		}
		
		
	}
	
	function certain(){
		var row=$("#dg").datagrid("getSelected");
		$.ajax({
			url:'${pageContext.request.contextPath}/Oworkload/delete.action',
			type:'post',
			data:{'oid':row.oid},
			success:function(e){
				window.location="${pageContext.request.contextPath}/Oworkload/selectAll.action";
			}
		});
	}
	

	function cancel(){
		$("#warn1").window("close");
	}

	
	function updateOworkload(){
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			$("#ew").window("open");
		
			var html='<div style="margin-top: 30px;">'+
				'<div class="name"><span">其它工作量编号:</span></div>'+
				'<input type="text" class="easyui-validatebox"  readonly="readonly"  style="width:70px;text-align:center;font-weight: bold;" id="oid" value="'+(row.oid)+'"/>'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
			'<div class="name"><span >其它工作量类型:</span></div>'+
			'<input type="text" class="easyui-validatebox" data-options="required:true"  id="otype" value="'+(row.otype)+'"/>'+
		'</div>'+
		'<div style="margin-top: 10px;">'+
			'<div class="name"><span">工作量值:</span></div>'+
			'<input type="text" class="easyui-validatebox" data-options="required:true"  id="ovalue" value="'+(row.ovalue)+'"/>'+
		'</div>'+
		'<div style="margin-top: 10px;text-align:center; ">'+
			'<a href="javascript:void(0)" onclick="update()" ><button style="width:150px;"  type="sumbit">提交</button></a>'+
		'</div>';
		
		$("#ew").html(html);
		}
		
	}
	
		function update(){
			var row=$("#dg").datagrid("getSelected");
			var oid=$("#oid").val();
			var otype=$("#otype").val();
			var ovalue=$("#ovalue").val();
			
			if(otype==""){
				alert("请输入工作量类型");
				return false;
			}
			if(ovalue==""){
				alert("请输入工作量值");
				return false;
			}
			var data={'oid':oid,'otype':otype,'ovalue':ovalue,'oldotype':row.otype}
			$.ajax({
				url:'${pageContext.request.contextPath}/Oworkload/update.action',
				type:'post',
				data:data,
				success:function(e){
					alert(e.msg);
					window.location="${pageContext.request.contextPath}/Oworkload/selectAll.action";
					
				}
			});
			
		}



</script>
</head>
<body>

<div id="tb">
			<span class="editSpan">
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteOworkload()">删除</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateOworkload()">修改</a>
			</span>
	</div> 
	
	<table id="dg" class="easyui-datagrid" border="false"  data-options="pagination:true,fitColumns:true,singleSelect:true" >
		<thead>	
			<th field="oid" width="150" align="center">其它工作量编号</th>
			<th field="otype" width="250" align="center">其它工作量类型</th>
			<th field="ovalue" width="200;" align="center">工作量值</th>
		</thead>
		<c:if test="${list.size()==0}">
				<div class="easyui-window" title="提示" style="width:200px;height:130px;text-align: center;">
					<span>暂无数据！</span></br>
					<a href="${pageContext.request.contextPath}/Oworkload/insertView.action"  class="easyui-linkbutton" style="width:100px;margin-top: 20px;" iconCls="icon-add">去添加</a>
					
				</div>
		</c:if>
		<c:if test="${list.size()!=0}">
		<c:forEach  items="${list}" var="o">
			<tr>
				<td>${o.oid}</td>
				<td>${o.otype}</td>
				<td>${o.ovalue}</td>
			</tr>
		</c:forEach>
		</c:if>
	
	</table>
	<div class="easyui-window" id="ew" title="修改数据" style="width:420px;height:250px; ">
		
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