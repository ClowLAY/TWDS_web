<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function addCollege(){
		var cName=$("#cName").val();
		if(cName==""){
			alert("二级学院名称不能为空!");
			return false;
		}
		$.ajax({
			url:'${pageContext.request.contextPath}/college/insert.action',
			type:'post',
			data:{'cName':cName},
			success:function(e){
				alert(e.msg);
				window.location="${pageContext.request.contextPath}/college/insertView.action";
			}
		});
		
	}

</script>
</head>
<body>

<div class="easyui-window" title="添加二级学院" style="text-align: center;width: 350px;height:120px;"   >
		<div style="margin-top: 30px;">
			<span>二级学院名称：</span>
			<input class="easyui-textbox" name="cName" id="cName" style="float: left;"/>
			<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="addCollege();" style="float: right;" iconCls="icon-add">添加</a>
		</div>
		

</div>

</body>
</html>