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
		<span style="margin-left: 40%;font-weight: bold;font-size: 18px;float:left;">工作量汇总</span>
		<span class="editSpan">
				
				<a href="#" class="easyui-menubutton" style="font-weight: bold;""  id="mb" data-options="menu:'#mm'">其它工作量详情</a>
		</span>
</div> 

					<table id="dg" class="easyui-datagrid" border="false" data-options="onLoadSuccess: onLoadSuccess"  fitColumns="true" emptyMsg="暂无数据！" singleSelect="true">
						<thead>	
								<th field="tid" width="60" align="center">申报编号</th>
								<th field="name" width="70" align="center">任课老师</th>
								<th field="coName" width="100" align="center">课程名</th>
								<th field="coType" width="100" align="center">课程类型</th>
								<th field="coWeek" width="80" align="center">周学时</th>
								<th field="coWenum" width="80" align="center">开课周数</th>
								<th field="coTotal" width="80" align="center">总课时</th>
								<th field="clName" width="100" align="center">开课班级</th>
								<th field="coTerm" width="100" align="center">开课学期</th>
								<th field="fname" width="140" align="center">工作量公式名称</th>
								<th field="TWorkload" width="90" align="center">教学工作量</th>
								<th field="OWorkload" width="90" align="center">其它工作量</th>
								<th field="totalworkload" width="100" align="center">工作量总和</th>
								<!-- <th field="examine" width="50" align="center">审核状态</th> -->
						</thead>
						<c:if test="${list.size()==0}">
							<div class="easyui-window" title="提示" style="width:200px;height:130px;text-align: center;">
								<span>暂无任教课程！</span></br>
							</div>
						</c:if>
						<c:if test="${list.size()!=0}">
							<c:forEach items="${list}" var="e">
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
									<td>${e.totalTworkload}</td>
									<td>${totalOworkload}</td>
									<td>${totalworkload}</td>
									<%-- <td>${e.state}</td> --%>
								</tr>
							</c:forEach>	
						</c:if>
					
							
							
				</table>
       
  <div id="mm" style="width:50px;">
      <div onclick="totalOworkload()">查看</div>
       
   </div>
   <div id="other" class="easyui-window" style="width:550px;" title="其它工作量详情">
   		
   		
		<c:if test="${listToworkload.size()==0}">
			
				<p style="text-align: center;"><span>暂无其它工作量！</span></p>
				
		</c:if>
		<c:if test="${listToworkload.size()!=0}">
		<table id="dg1" class="easyui-datagrid" border="false"    emptyMsg="暂无数据" singleSelect="true">
				<thead>	
						<th field="toname" width=250" align="center" >工作量名称</th>
						<th field="ovalue" width="80" align="center">工作量值</th>
						<th field="totime" width="200" align="center">工作时间</th>
						
				</thead>
				<c:forEach items="${listToworkload}" var="li">
					<tr>
						<td>${li.toname}</td>
						<td>${li.oworkload.ovalue}</td>
						<td>${li.totime }</td>
					
				</c:forEach>	
			</table>
		</c:if>
  	
   	
   
   </div>
   	
</body> 

<script type="text/javascript">
	$(function(){
		$("#other").window("close");
		
	});


	function totalOworkload(){
		$("#other").window("open");
	}
	
	function onLoadSuccess(data){
		 //datagrid的index，表示从第几行开始合并；紫色的内容需是最精髓的，就是记住最开始需要合并的位置
		 //合并单元格的区域，就是clomun中的filed对应的列
		  //纵向合并的格数，如果想要横向合并，就使用colspa
		  console.info(data);
		$('#dg').datagrid('mergeCells',{ 
				index:'0',                
				field:'OWorkload',                 	
				rowspan:data.rows.length
		　}); 
		
		$('#dg').datagrid('mergeCells',{ 
			index:'0',                
			field:'name',               	
			rowspan:data.rows.length 
		}); 
		$('#dg').datagrid('mergeCells',{ 
			index:'0',                
			field:'totalworkload',               	
			rowspan:data.rows.length 
		});

	};
	
	





</script>
</html>