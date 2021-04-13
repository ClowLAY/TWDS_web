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

.name{
	width:120px;
	text-align: right;
	display: inline-block;
	margin-right: 20px;
	
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

	<div class="easyui-panel" style="text-align: center;"  border="false" >
		<div style="margin-top: 30px;">
			<div class="name"><span >其它工作量类型:</span></div>
			<input type="text" class="easyui-textbox" data-options="required:true"  prompt="如:监考"   id="otype"/>
		</div>
		<div style="margin-top: 10px;">
			<div class="name"><span >工作量值:</span></div>
			<input type="text" class="easyui-textbox" data-options="required:true"  prompt="如:4.0" id="ovalue"/>
		</div>
		<div style="margin-top: 10px;">
			<a href="javascript:void(0)" onclick="addOworkload()" class="easyui-linkbutton" style="width:100px;" iconCls="icon-add">添加</a>
			
		</div>
	
	</div>


</body>
<script type="text/javascript">

	function addOworkload(){
		
		var otype=$("#otype").val();
		var ovalue=$("#ovalue").val();
		if(otype==""){
			alert("请输入其它工作量类型");
			return false;
		}
		if(ovalue==""){
			alert("请输入工作量值");
			return false;
		}
		var data={'otype':otype,'ovalue':ovalue}
		$.ajax({
			url:'${pageContext.request.contextPath}/Oworkload/insert.action',
			type:'post',
			data:data,
			success:function(e){
				alert(e.msg);
				if(e.success){
					window.location="${pageContext.request.contextPath}/Oworkload/insertView.action";
				}
			}
		})
	}

</script>
</html>