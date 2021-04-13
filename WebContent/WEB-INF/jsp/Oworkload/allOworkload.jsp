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
	width:270px;
	height:27px;
	border-radius:7px;
	outline:none;

}
</style>
</head>
<body>


	<div id="tb">
			<span class="editSpan">
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteToworkload()">删除</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateToworkload()">修改</a>
			</span>
	</div> 

	
	<table id="dg" class="easyui-datagrid" border="false"   data-options="pagination:true,fitColumns:true,singleSelect:true" >
		<thead>	
			<th field="toid" width="70" align="center">其它工作量编号</th>
			<th field="name" width="100" align="center">教师名字</th>
			<th field="otype" width="250" align="center">其它工作量类型</th>
			<th field="toname" width="250" align="center">工作量名称</th>
			<th field="totime" width="250" align="center">工作时间</th>
			<th field="ovalue" width="200;" align="center">工作量值</th>
			
			
		</thead>
		<c:if test="${listOworkload.size()==0}">
				<div class="easyui-window" title="提示" style="width:200px;height:130px;text-align: center;">
					<span>暂无数据！</span></br>
				</div>
		</c:if>
		<c:if test="${listOworkload.size()!=0}">
		<c:forEach  items="${listOworkload}" var="o">
			<tr>
				<td>${o.toid}</td>
				<td>${o.user.name}</td>
				<td>${o.oworkload.otype}</td>
				<td>${o.toname}</td>
				<td>${o.totime}</td>
				<td>${o.oworkload.ovalue}</td>
			</tr>
		</c:forEach>
		</c:if>
	
	</table>
	
       
 <div class="easyui-window" id="ew" title="修改数据" style="width:420px;height:300px; ">
	
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
	
	//删除数据
	function deleteToworkload(){
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
			url:'${pageContext.request.contextPath}/Toworkload/delete.action',
			type:'post',
			data:{'toid':row.toid},
			success:function(e){
				
				window.location="${pageContext.request.contextPath}/tCourses/selectAllOworkload.action";
			}
		});
	}
	
	function cancel(){
		$("#warn1").window("close");
	}
	
	
	function warn(){
		
		$("#warn").window("close");
	
	}	
	
	//修改数据
	function updateToworkload(){
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			$("#ew").window("open");
			$.ajax({
				url:'${pageContext.request.contextPath}/user/selectAllUser.action',
				type:'post',
				data:'',
				success:function(e){
					console.log(e);
					var html='<div style="margin-top: 30px;">'+
								'<div class="name"><span">编号:</span></div>'+
								'<input type="text" class="easyui-validatebox"  readonly="readonly"  style="width:70px;text-align:center;font-weight: bold;" id="toid" value="'+(row.toid)+'"/>'+
							'</div>'+
							'<div style="margin-top: 10px;">'+
								'<div class="name"><span>任课老师:</span></div>'+
								'<select id="selectuserID" style="width:200px;height:30px;border-radius: 5px;" ><div></div></select>'+
							'</div>'+
							'<div style="margin-top: 10px;">'+
								'<div class="name"><span>工作量名称:</span></div>'+
								'<input type="text" class="easyui-validatebox"    id="toname" value="'+(row.toname)+'"/>'+
							'</div>'+
							'<div style="margin-top: 10px;">'+
								'<div class="name"><span>工作时间:</span></div>'+
								'<input type="text" class="easyui-datetimebox"    id="totime" value="'+(row.totime)+'"/>'+
							'</div>'+
							'<div style="margin-top: 10px;text-align:center; ">'+
								'<a href="javascript:void(0)" onclick="update()" ><button style="width:100px;"  type="sumbit">提交</button></a>'+
							'</div>';
				$("#ew").html(html);
 				$.each(e,function(a,b){
					 
					 if(row.name==b.name){
							
							var html1='<option value="'+(b.userid)+'" selected="selected">'+(b.name)+'</option>';
						}else{
							var html1='<option value="'+(b.userid)+'">'+(b.name)+'</option>';
						}
						
						$("#selectuserID").append(html1);
				 });
				
				}
				
			})
			
		}
		
	}
	
	function update(){
		var toid=$("#toid").val();
		var userid=$("#selectuserID option:selected").val();
		var toname=$("#toname").val();
		var totime=$("#totime").val();
		if(toname==""){
			alert("请输入工作量名称");
			return false;
		}
		
		if(totime==""){
			alert("请输入工作时间");
			return false;
		}
		
		var data={toid:toid,toname:toname,userid:userid,totime:totime}
		$.ajax({
			url:'${pageContext.request.contextPath}/Toworkload/update.action',
			type:'post',
			data:data,
			success:function(e){
					alert(e.msg);
					window.location="${pageContext.request.contextPath}/tCourses/selectAllOworkload.action";
				
			}
		});
		
	}

	</script>
	

</html>