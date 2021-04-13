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
</style>
</head>
<body>


	<div id="tb">
			<span class="editSpan">
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteTCourses()">删除</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateTCourses()">修改</a>
			</span>
	</div> 




					<table id="dg" class="easyui-datagrid" border="false"   fitColumns="true" emptyMsg="暂无数据！" singleSelect="true">
						<thead>	
								<th field="tid" width="60" align="center">编号</th>
								<th field="name" width="70" align="center">任课老师</th>
								<th field="coName" width="100" align="center">课程名</th>
								<th field="coType" width="100" align="center">课程类型</th>
								<th field="coWeek" width="80" align="center">周学时</th>
								<th field="coWenum" width="80" align="center">开课周数</th>
								<th field="coTotal" width="80" align="center">总课时</th>
								<th field="clName" width="100" align="center">开课班级</th>
								<th field="coTerm" width="100" align="center">开课学期</th>
								<th field="fname" width="140" align="center">工作量公式名称</th>
								<th field="expression" width="140" align="center">表达式</th>
								<th field="xvalue" width="90" align="center">X系数取值</th>
									<th field="yvalue" width="90" align="center">Y系数取值</th>
								<th field="TWorkload" width="90" align="center">教学工作量</th>
								
								<!-- <th field="examine" width="50" align="center">审核状态</th> -->
						</thead>
						<c:if test="${listTCourses.size()==0}">
							<div class="easyui-window" title="提示" style="width:200px;height:130px;text-align: center;">
								<span>暂无任教课程！</span></br>
							</div>
						</c:if>
						<c:if test="${listTCourses.size()!=0}">
							<c:forEach items="${listTCourses}" var="e">
								<tr>
									<td>${e.tid}</td>
									<td>${e.user.name}</td>
									<td>${e.courses.coName }</td>
									<td>${e.courses.coType }</td>
									<td>${e.courses.coWeek }</td>
									<td>${e.courses.coWenum }</td>
									<td>${e.courses.coTotal }</td>
									<td>${e.classes.clName}</td>
									<td>${e.courses.coTerm}</td>
									<td>${e.formula.fname}</td>
									<td>${e.formula.expression}</td>
									<td>${e.xvalue}</td>
									<td>${e.yvalue}</td>
									<td>${e.totalTworkload}</td>
									
									<%-- <td>${e.state}</td> --%>
								</tr>
							</c:forEach>	
						</c:if>
					
							
							
				</table>
       
 <div class="easyui-window" id="ew" title="修改数据" style="width:400px;height:260px; ">
	
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
	function deleteTCourses(){
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
			url:'${pageContext.request.contextPath}/tCourses/delete.action',
			type:'post',
			data:{'tid':row.tid},
			success:function(e){
				
				window.location="${pageContext.request.contextPath}/tCourses/selectAllTworkload.action";
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
	function updateTCourses(){
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
								'<input type="text" class="easyui-validatebox"  readonly="readonly"  style="width:70px;text-align:center;font-weight: bold;" id="tid" value="'+(row.tid)+'"/>'+
							'</div>'+
							'<div style="margin-top: 10px;">'+
								'<div class="name"><span>任课老师:</span></div>'+
								'<select id="selectuserID" style="width:250px;height:30px;border-radius: 5px;"><div></div></select>'+
							'</div>'+
							'<div style="margin-top: 10px;">'+
								'<div class="name"><span>开课班级:</span></div>'+
								'<select id="selectclid" style="width:250px;height:30px;border-radius: 5px;"><div></div></select>'+
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
				 //获取全部班级
				 $.ajax({
					 url:'${pageContext.request.contextPath}/classes/selectAllClasses.action',
						type:'post',
						data:'',
				 		success:function(listCla){
				 			console.log(listCla);
				 			
				 			 $.each(listCla,function(d,f){
								 
								 if(row.clName==f.clName){
										
										var html1='<option value="'+(f.clId)+'" selected="selected">'+(f.clName)+'</option>';
									}else{
										var html1='<option value="'+(f.clId)+'">'+(f.clName)+'</option>';
									}
									
									$("#selectclid").append(html1);
							 })
				 		}
				 })
				}
				
			})
			
		}
		
	}
	
	function update(){
		var tid=$("#tid").val();
		var userid=$("#selectuserID option:selected").val();
		var clid=$("#selectclid option:selected").val();
		
		
		var data={'tid':tid,'userid':userid,'clid':clid}
		$.ajax({
			url:'${pageContext.request.contextPath}/tCourses/update.action',
			type:'post',
			data:data,
			success:function(e){
					alert(e.msg);
					window.location="${pageContext.request.contextPath}/tCourses/selectAllTworkload.action";
				
			}
		});
		
	}
	





</script>
</html>