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
		input{
			width:100%;
			height: 100%;
		
		}
		
			#tb{
		height:40px;
		background: #efefef;
		
		
	}
.editSpan{
	position: relative;
	text-align:center;
	top: 6px;
	right: 30px;

}
		
	</style>
</head>
<body>

<div id="tb">
				<span class="editSpan1">
					审核状态:&nbsp;&nbsp;<select id="selectresult" style="height:30px;border-radius: 5px;text-decoration: none;" >
							<option value="全部">---全部---</option>
								<c:choose>
									<c:when test="${result==0}">
										<option value="0" selected="selected">审核中</option>
										<option value="1">申报通过</option>
										<option value="2">申报失败</option>
									</c:when>
									<c:when test="${result==1}">
										<option value="0" >审核中</option>
										<option value="1" selected="selected">申报通过</option>
										<option value="2">申报失败</option>
									</c:when>
									<c:when test="${result==3}">
										<option value="0" >审核中</option>
										<option value="1" >申报通过</option>
										<option value="2" selected="selected">申报失败</option>
									</c:when>
									<c:otherwise>
										<option value="0" >审核中</option>
										<option value="1" >申报通过</option>
										<option value="2" >申报失败</option>
									</c:otherwise>
									
								
								</c:choose>
							
								
					</select>
					<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="searchByresult()"  iconCls="icon-search">搜索</a>
				 </span>
				
			</div> 

	<table id="dg" class="easyui-datagrid" border="false" autoRowHeight="true"  fitColumns="true"  singleSelect="true">
						<thead>	
								<th field="eid" width="50" align="center">申报编号</th>
								<th field="coName" width="80" align="center">任课课程</th>
								<th field=coTerm width="80" align="center">开课学期</th>
								<th field="eWeek" width="100" align="center">第几周</th>
								<th field="value" width="80" align="center">工作量值</th>
								<th field="etime" width="80" align="center">申报时间</th>
								<th field="result" width="30" align="center">审核状态</th>
								
						</thead>
						<c:if test="${list.size()==0}">
								<div class="easyui-window" title="提示" style="width:200px;height:100px;text-align: center;">
									<span>暂无数据！</span>
								</div>
						</c:if>
						<c:if test="${list.size()!=0}">
							<c:forEach items="${list}" var="e">
								<tr>
									<td>${e.eid}</td>
									<td>${e.courses.coName}</td>
									<td>${e.courses.coTerm}</td>
									<td>${e.eWeek}</td>
									<td>${e.value}</td>
									<td>${e.etime}</td>
									<td>${e.result}</td>
								</tr> 
							
							</c:forEach>
						</c:if>
								
	</table>

</body>
<script type="text/javascript">
	function searchByresult(){
		var result=$("#selectresult option:selected").val();
		window.location="${pageContext.request.contextPath}/examines/MoWorkLoadByResult.action?result="+result;
	}

</script>
</html>