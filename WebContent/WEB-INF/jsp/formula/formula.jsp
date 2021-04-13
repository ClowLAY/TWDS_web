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

</head>
<body>

<div id="tb">
		<span class="editSpan">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteFormula()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateFormula()">修改</a>
		</span>
</div> 

<table id="dg" class="easyui-datagrid" border="false" data-options="pagination:true,fitColumns:true,singleSelect:true,emptyMsg:'暂无数据！'" >
		<thead>	
			<th field="fid" width="100" align="center">公式编号</th>
			<th field="expression" width="300" align="center">表达式</th>
			<th field=fname width="250" align="center">公式名称</th>
			<th field="p1" width="230" align="center">参数1</th>
			<th field="p2" width="230" align="center">参数2</th>
			<th field="p3" width="230" align="center">参数3</th>
		</thead>
		<c:if test="${list.size()==0}">
				<div class="easyui-window" title="提示" style="width:200px;height:100px;text-align: center;">
					<span>暂无数据！</span>
				</div>
		</c:if>
		<c:if test="${list.size()!=0}">
		<c:forEach items="${list}" var="f">
			<tr>
				<td>${f.fid}</td>
				<td>${f.expression}</td>
				<td>${f.fname}</td>
				<td>${f.p1}</td>
				<td>${f.p2}</td>
				<td>${f.p3}</td>
			</tr>
		</c:forEach>
			
				
		
		</c:if>
		
</table>

<div class="easyui-window" id="ew" title="修改数据" style="width:500px;height:500px; ">
	
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
<script type="text/javascript">

	$(function(){
		$("#ew").window("close");
		$("#warn").window("close");
		$("#warn1").window("close");
	});
	
	
	function warn(){
		$("#warn").window("close");
	}
	
	function deleteFormula(){
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			//var cId=delHtmlTag(row.cId);
			//alert("--"+cId+"--"+row.workName); 
			$("#warn1").window("open");
		}
		
		
	}
	
	function certain(){
		var row=$("#dg").datagrid("getSelected");
		$.ajax({
			url:'${pageContext.request.contextPath}/formula/delete.action',
			type:'post',
			data:{'fid':row.fid},
			success:function(e){
				window.location="${pageContext.request.contextPath}/formula/selectAll.action";
			}
		});
	}
	

	function cancel(){
		$("#warn1").window("close");
	}
	
	function delHtmlTag1(str){
		return str.toString().match(/[0-9a-zA-Z\u4e00-\u9fa5]/g).join("");//取其中的汉字与数字
	}
	
	
	function updateFormula(){
		
		
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			$("#ew").window("open");
			
					var fname=row.fname;
					var html='<div style="margin-top: 30px;">'+
						'<span class="name">班级编号:</span>'+
						'<input type="text" class="easyui-validatebox" readonly="readonly" style="width:70px;text-align:center;font-weight: bold;"  id="fid" value="'+(row.fid)+'" />'+
					'</div>'+
				'<div style="margin-top: 10px;">'+
				'<div class="name"><span>表达式:</span></div>'+
				'<input class="easyui-validatebox " data-options="required:true" id="expression" value="'+(row.expression)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
				'<div class="name"><span>公式名称:</span></div>'+
				'<input class="easyui-datebox" data-options="required:true" id="fname" value="'+(row.fname)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
			'<div class="name"><span>参数1:</span></div>'+
				'<input class="easyui-validatebox"  data-options="required:true"  id="p1"  value="'+(row.p1)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
			'<div class="name"><span>参数2:</span></div>'+
				'<input class="easyui-validatebox"  data-options="required:true"  id="p2"  value="'+(row.p3)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
			'<div class="name"><span>参数3:</span></div>'+
				'<input class="easyui-validatebox"  data-options="required:true"  id="p3"  value="'+(row.p3)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;text-align:center; ">'+
				'<a href="javascript:void(0)" onclick="update()" style="width:100px;"><button style="width:100px;" type="sumbit">提交</button></a>'+
			'</div>';
			
					 
				$("#ew").html(html);
				 
					
		
		}
	}
	
	
	function update(){
		var row=$("#dg").datagrid("getSelected");
		var fid=$("#fid").val();
		var expression=$("#expression").val();
		var fname=$("#fname").val();
		var p1=$("#p1").val();
		var p2=$("#p2").val();
		var p3=$("#p3").val();
		
		if(expression==""){
			alert("表达式不能为空!");
			return false;
		}
		
	
		if(fname==""){
			alert("公式名称不能为空!");
			return false;
		}
		
		
	
		
		
		var data={
				fid:fid,
				expression:expression,
				fname:fname,
				p1:p1,
				p2:p2,
				p3:p3,
				oldfname:row.fname
			};
		 $.ajax({
			url:'${pageContext.request.contextPath}/formula/update.action',
			type:'post',
			data:data,
			success:function(e){
					alert(e.msg);
					window.location="${pageContext.request.contextPath}/formula/selectAll.action";
				
			}
		}); 
	}
</script>
</html>