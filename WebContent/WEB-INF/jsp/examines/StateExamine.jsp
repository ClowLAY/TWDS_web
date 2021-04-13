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
</style>
</head>
<body>

	<div id="tb">
		<c:if test="${roleId!=3}">
				<span class="editSpan1">
					学院:&nbsp;&nbsp;<select id="selectCollege" style="height:30px;border-radius: 5px;text-decoration: none;" >
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
				 </span>
				 
			</c:if>
				 	<div class="editSpan">
						<a class="easyui-linkbutton"  style="background: #0969A2;color: white;" iconCls="icon-ok" onclick="examineSuccess()">通过</a>
						<a class="easyui-linkbutton" style="background: #0969A2;color: white;" iconCls="icon-no" onclick="examineFail()">不通过</a>
					</div>
				
			</div> 




				<table id="dg" class="easyui-datagrid" border="false"  data-options="onLoadSuccess: onLoadSuccess,autoRowHeight:false,url:'/TWDS_web/examines/selectAllTCourses1',method:'post'"  pagination="true"   fitColumns="true" emptyMsg="暂无数据！" >
						<thead>	
								<th data-options="field:'ck',checkbox:true"></th>
								<th field="eid" width="50" align="center">申报编号</th>
								<th field="name" width="80" align="center">任课教师</th>
								<th field="cName" width="80" align="center">所属学院</th>
								<th field="coName" width="80" align="center">任课课程</th>
								<th field=coTerm width="80" align="center">开课学期</th>
								<th field="eWeek" width="30" align="center">第几周</th>
								<th field="value" width="80" align="center">工作量值</th>
								<th field="etime" width="80" align="center">申报时间</th>
								<!-- <th field="examine" width="50" align="center">审核</th> -->
						</thead>
						<%-- <c:if test="${list.size()==0}">
								<div class="easyui-window" title="提示" style="width:200px;height:100px;text-align: center;">
									<span>暂无数据！</span>
								</div>
						</c:if>
						<c:if test="${list.size()!=0}">
							<c:forEach items="${list}" var="e">
								<tr>
									<td></td>
									<td>${e.eid}</td>
									<td>${e.user.name}</td>
									<td>${e.college.cName}</td>
									<td>${e.courses.coName}</td>
									<td>${e.courses.coTerm}</td>
									<td>${e.eWeek}</td>
									<td>${e.value}</td>
									<td>${e.etime}</td>
									
								</tr> 
							
							</c:forEach>
						</c:if>	 --%>
							
				</table>
				
				
		
								
				



</body>
	<script type="text/javascript">
	
	
	
	
	
	function onLoadSuccess(data){
		$('#dg').datagrid('mergeCells',{ 
			index:'0',                
			field:'examine',               	
			rowspan:data.rows.length 
		}); 
	}
	
	function examineSuccess(){
		 var rows = $('#dg').datagrid('getSelections');
		 var  str="";
		 for(var i=0;i<rows.length;i++){
			 str+=Number(rows[i].eid)+",";
		 }
		
		  
		var data={str:str,result:'1'}
			$.ajax({
				url:'${pageContext.request.contextPath}/examines/update.action',
				type:'post',
				data:data,
				success:function(e){
					alert(e.msg);
					if(e.success){
						window.location="${pageContext.request.contextPath}/examines/selectAllTCourses.action";
					}
				}
			}) 
	}
	
	function examineFail(){
		 var rows = $('#dg').datagrid('getSelections');
		 var  str="";
		 for(var i=0;i<rows.length;i++){
			 str+=Number(rows[i].eid)+",";
		 }
		
		  
		var data={str:str,result:'2'}
			$.ajax({
				url:'${pageContext.request.contextPath}/examines/update.action',
				type:'post',
				data:data,
				success:function(e){
					alert(e.msg);
					if(e.success){
						window.location="${pageContext.request.contextPath}/examines/selectAllTCourses.action";
					}
				}
			}) 
	}
	
	 //通过学院搜索
	 
	function searchByCid(){
		var cId=$("#selectCollege option:selected").val();
		window.location="${pageContext.request.contextPath}/examines/selectAllTCoursesByCid.action?cid="+cId;
					
		
	 }

	
	</script>

</html>