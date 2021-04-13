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
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteClass()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateClass()">修改</a>
		</span>
</div> 

<table id="dg" class="easyui-datagrid" border="false" data-options="pagination:true,fitColumns:true,rownumbers:true,singleSelect:true,emptyMsg:'暂无数据！'" >
		<thead>	
			<th field="clId" width="100" align="center">班级编号</th>
			<th field="mname" width="250" align="center">专业名称</th>
			<th field=clName width="250" align="center">班级名称</th>
			<th field="clYear" width="250" align="center">入学年份</th>
			<th field="clNum" width="250" align="center">学生人数</th>
		</thead>
		<c:if test="${list.size()==0}">
				<div class="easyui-window" title="提示" style="width:200px;height:100px;text-align: center;">
					<span>暂无数据！</span>
				</div>
		</c:if>
		<c:if test="${list.size()!=0}">
		<c:forEach items="${list}" var="cl">
			<tr>
				<td>${cl.clId}</td>
				<td>${cl.majors.mname}</td>
				<td>${cl.clName}</td>
				<td>${cl.clYear}</td>
				<td>${cl.clNum}</td>
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
	
	function deleteClass(){
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
			url:'${pageContext.request.contextPath}/classes/delete.action',
			type:'post',
			data:{'clId':row.clId},
			success:function(e){
				window.location="${pageContext.request.contextPath}/classes/selectAll.action";
			}
		});
	}
	

	function cancel(){
		$("#warn1").window("close");
	}
	
	function delHtmlTag1(str){
		return str.toString().match(/[0-9a-zA-Z\u4e00-\u9fa5]/g).join("");//取其中的汉字与数字
	}
	
	function updateClass(){
		
		
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			$("#ew").window("open");
			$.ajax({
				url:'${pageContext.request.contextPath}/major/selectAllMajor.action',
				type:'post',
				data:'',
				success:function(e){
					console.log(e);
					var mname=row.mname;
					var html='<div style="margin-top: 30px;">'+
						'<span class="name">班级编号:</span>'+
						'<input type="text" class="easyui-validatebox" readonly="readonly" style="width:70px;text-align:center;font-weight: bold;"  id="clId" value="'+(row.clId)+'" />'+
					'</div>'+
					'<div style="margin-top: 10px;">'+
					'<div class="name"><span>专业名称:</span></div>'+
					'<select id="selectmId" style="width:250px;height:30px;border-radius: 5px;"><div></div></select>'+
				'</div>'+
				'<div style="margin-top: 10px;">'+
				'<div class="name"><span>班级名称:</span></div>'+
				'<input class="easyui-validatebox " data-options="required:true" id="clName" value="'+(row.clName)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
				'<div class="name"><span>入学年份:</span></div>'+
				'<input class="easyui-datebox" data-options="required:true" id="clYear" value="'+(row.clYear)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
			'<div class="name"><span>学生人数:</span></div>'+
				'<input class="easyui-validatebox"  data-options="required:true"  id="clNum"  value="'+(row.clNum)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;text-align:center; ">'+
				'<a href="javascript:void(0)" onclick="update()" style="width:100px;"><button style="width:100px;" type="sumbit">提交</button></a>'+
			'</div>';
			
					 
				 $("#ew").html(html);
				 
				 $.each(e,function(a,b){
					 
					 if(mname==b.mname){
							
							var html1='<option value="'+(b.mid)+'" selected="selected">'+(b.mname)+'</option>';
						}else{
							var html1='<option value="'+(b.mid)+'">'+(b.mname)+'</option>';
						}
						
						$("#selectmId").append(html1);
				 })
				}
			});
		}
	}
	
	
	function update(){
		var row=$("#dg").datagrid("getSelected");
		var mId=$("#selectmId option:selected").val();
		
		var clId=$("#clId").val();
		var clName=$("#clName").val();
		var clYear=$("#clYear").val();
		var clNum=$("#clNum").val();
		
		if(clName==""){
			alert("班级名称不能为空!");
			return false;
		}
		
	
		if(mId==""){
			alert("专业名称不能为空!");
			return false;
		}
		
		
		if(clYear==""){
			alert("请输入入学年份!");
			return false;
		}
		if(clNum==""){
			alert("学生人数不能为空!");
			return false;
		}
		
		
		var data={
				clId:clId,
				clName:clName,
				mId:mId,
				clYear:clYear,
				clNum:clNum,
				olkdclName:row.clName
			};
		 $.ajax({
			url:'${pageContext.request.contextPath}/classes/update.action',
			type:'post',
			data:data,
			success:function(e){
					alert(e.msg);
					window.location="${pageContext.request.contextPath}/classes/selectAll.action";
				
			}
		}); 
	}


</script>
</html>