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

.editSpan1{
	position: relative;
	float:left;
	top: 6px;
	left: 30px;

}
.name{
	width:100px;
	text-align: right;
	display: inline-block;
	margin-right: 10px;
	
}

a{
	text-decoration: none;
	outline: none;
}
</style>
</head>
<body>
			
			<div id="tb">
				<span class="editSpan1">
					开课学期: <input class="easyui-searchbox" data-options="searcher:doSearch" style="width:200px;" id="coTerm1" value="${coTerm}"/>
					<c:if test="${roleId!=3}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院:&nbsp;&nbsp;<select id="selectCollege" style="height:30px;border-radius: 5px;text-decoration: none;" >
								<option value="全部">---全部---</option>
								<c:forEach items="${listCollege}" var="c">
									<c:if test="${cId==c.cId}">
										<option value="${c.cId}" selected="selected">${c.cName}</option>
									
									</c:if>
									<c:if test="${cId!=c.cId}">
										<option value="${c.cId}">${c.cName}</option>
									</c:if>
									
								</c:forEach>
						</select>
						<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="searchByCid()"  iconCls="icon-search">搜索</a>
					</c:if>
				 </span>
				<span class="editSpan">
						<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteCourses()">删除</a>
						<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateCourses()">修改</a>
				</span>
			</div> 
					<table id="dg" class="easyui-datagrid" border="false"   fitColumns="true"   emptyMsg="暂无数据！" singleSelect="true">
						<thead>	
								<th field="coId" width="70" align="center">课程编号</th>
								<th field="cId" width="150" align="center">所属院系</th>
								<th field="fId" width="150" align="center">公式名称</th>
								<th field="coName" width="200" align="center">课程名称</th>
								<th field="coType" width="150" align="center">课程类型</th>
								<th field="coWeek" width="132" align="center">周学时</th>
								<th field="coWeNum" width="140" align="center">开课周数</th>
								<th field="coTotal" width="132" align="center">总课时</th>
								<th field="coTerm" width="150" align="center">开课学期</th>
								<th field="state1" width="150" align="center">分配状态</th>
						</thead>
						<c:forEach items="${list}" var="co">
							<tr>
								<td>${co.coId }</td>
								<td>${ co.college.cName}</td>
								<td>${co.formula.fname }</td>
								<td>${co.coName }</td>
								<td>${co.coType }</td>
								<td>${co.coWeek }</td>
								<td>${co.coWenum }</td>
								<td>${co.coTotal }</td>
								<td>${co.coTerm }</td>
								<td>${co.state }</td>
							</tr>
						</c:forEach>		
							
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
	
	
	function deleteCourses(){
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			 
			$("#warn1").window("open");
		}
		
		
	}
	
	//确定删除
	function certain(){
		var row=$("#dg").datagrid("getSelected");
		$.ajax({
			url:'${pageContext.request.contextPath}/courses/delete.action',
			type:'post',
			data:{'coId':row.coId},
			success:function(e){
				window.location="${pageContext.request.contextPath}/courses/selectAll.action";
			}
		});
	}
	

	function cancel(){
		$("#warn1").window("close");
	}

	//修改课程
	function updateCourses(){
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			$("#ew").window("open");
			$.ajax({
				url:'${pageContext.request.contextPath}/college/selectAllCollege.action',
				type:'post',
				data:'',
				success:function(e){
					console.log(e);
					var clName=row.clName;
					var html='<div style="margin-top: 30px;">'+
						'<span class="name">课程编号:</span>'+
						'<input type="text" class="easyui-validatebox" readonly="readonly" style="width:70px;text-align:center;font-weight: bold;"  id="coId" value="'+(row.coId)+'" />'+
					'</div>'+
					'<div style="margin-top: 10px;">'+
					'<div class="name"><span>所属院系:</span></div>'+
					'<select id="selectcId" style="width:250px;height:30px;border-radius: 5px;"><div></div></select>'+
				'</div>'+
				'<div style="margin-top: 10px;">'+
				'<div class="name"><span>公式名称:</span></div>'+
				'<select id="selectFor" style="width:250px;height:30px;border-radius: 5px;"><div></div></select>'+
			'</div>'+
				'<div style="margin-top: 10px;">'+
				'<div class="name"><span>课程名称:</span></div>'+
				'<input class="easyui-validatebox " data-options="required:true" id="coName" value="'+(row.coName)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
				'<div class="name"><span>课程类型:</span></div>'+
				'<input class="easyui-datebox" data-options="required:true" id="coType" value="'+(row.coType)+'" />'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
			'<div class="name"><span>周学时:</span></div>'+
				'<input class="easyui-validatebox"  data-options="required:true"  id="coWeek"  value="'+(row.coWeek)+'" />'+
			'</div>'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
			'<div class="name"><span>开课周数:</span></div>'+
			'<input class="easyui-validatebox " data-options="required:true" id="coWeNum" value="'+(row.coWeNum)+'" />'+
		'</div>'+
		'<div style="margin-top: 10px;">'+
			'<div class="name"><span>总课时:</span></div>'+
			'<input class="easyui-datebox" data-options="required:true" id="coTotal" value="'+(row.coTotal)+'" />'+
		'</div>'+
		'<div style="margin-top: 10px;">'+
		'<div class="name"><span>开课学期:</span></div>'+
			'<input class="easyui-validatebox"  data-options="required:true"  id="coTerm"  value="'+(row.coTerm)+'" />'+
		'</div>'+
			'<div style="margin-top: 10px;text-align:center; ">'+
				'<a href="javascript:void(0)" onclick="update()" style="width:100px;"><button style="width:100px;" type="sumbit">提交</button></a>'+
			'</div>';
			
			
				 $("#ew").html(html);
				 
				 $.each(e,function(a,b){
					 
					 if(row.cId==b.cName){
							
							var html1='<option value="'+(b.cId)+'" selected="selected">'+(b.cName)+'</option>';
						}else{
							var html1='<option value="'+(b.cId)+'">'+(b.cName)+'</option>';
						}
						
						$("#selectcId").append(html1);
				 });
				 //获取全部工作量计算公式
				 $.ajax({
					 url:'${pageContext.request.contextPath}/formula/selectAllFormula.action',
						type:'post',
						data:'',
				 		success:function(listFor){
				 			console.log(listFor);
				 			
				 			 $.each(listFor,function(d,f){
								 
								 if(row.fid==f.fid){
										
										var html1='<option value="'+(f.fid)+'" selected="selected">'+(f.fname)+'</option>';
									}else{
										var html1='<option value="'+(f.fid)+'">'+(f.fname)+'</option>';
									}
									
									$("#selectFor").append(html1);
							 })
				 		}
				 })
				}
			});
		}
	}
	
	//修改课程
	function update(){
		var row=$("#dg").datagrid("getSelected");
		var cId=$("#selectcId option:selected").val();
		var fid=$("#selectFor option:selected").val();
		
		var coId=$("#coId").val();
		var coName=$("#coName").val();
		var coType=$("#coType").val();
		var coWeek=$("#coWeek").val();
		var coWeNum=$("#coWeNum").val();
		var coTotal=$("#coTotal").val();
		var coTerm=$("#coTerm").val();
		
		if(coName==""){
			alert("课程名称不能为空!");
			return false;
		}
		
		if(coType==""){
			alert("课程类型不能为空!");
			return false;
		}
		
		if(coWeek==""){
			alert("请输入课程周课时!");
			return false;
		}
		if(coWeNum==""){
			alert("请输入课程开课周数!");
			return false;
		}
		if(coTotal==""){
			alert("请输入课程总课时!");
			return false;
		}
		if(coTerm==""){
			alert("请输入开课学期!");
			return false;
		}
		
		
		var data={
				coId:coId,
				cId:cId,
				fid:fid,
				coName:coName,
				coType:coType,
				coWeek:coWeek,
				coWenum:coWeNum,
				coTotal:coTotal,
				coTerm:coTerm,
				oldcoName:row.coName
			};
		 $.ajax({
			url:'${pageContext.request.contextPath}/courses/update.action',
			type:'post',
			data:data,
			success:function(e){
					alert(e.msg);
					window.location="${pageContext.request.contextPath}/courses/selectAll.action";
				
			}
		}); 
	}

	 function doSearch(value){
		 var cId=$("#selectCollege option:selected").val();
		 
		 window.location="${pageContext.request.contextPath}/courses/selectAllBycoTerm.action?coTerm="+value+"&cId="+cId;
		 
		
     }
	 
	 
	 //通过学院搜索
	 
	function searchByCid(){
		 var coTerm1=$("#coTerm1").val();
		var cId=$("#selectCollege option:selected").val();
		window.location="${pageContext.request.contextPath}/courses/selectAllBycId.action?cId="+cId+"&coTerm1="+coTerm1;
					
		
	 }

</script>
</html>