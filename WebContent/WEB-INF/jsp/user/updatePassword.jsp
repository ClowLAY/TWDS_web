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



function update(){

	var oldpassword=$("#oldpassword").val();
	var newpassword=$("#newpassword").val();
	var newpassword1=$("#newpassword1").val();
	if(oldpassword==""){
		alert("密码不能为空");
		return false;
	}
	if(newpassword!=newpassword1){ 
		alert("两次输入密码不一致");
		return false;
	}
	var data={'oldpassword':oldpassword,'newpassword':newpassword,'newpassword1':newpassword1};
	$.ajax({
		url:'${pageContext.request.contextPath}/personal/updatePassword.action',	
		type:'post',
		data:data,
		success:function(e){
			alert(e.msg);
		}
	});
}

	function cancel(){
		$("#update").window("close");
	}

</script>
</head>
<body>



 <div class="easyui-window" title="修改密码"  id="update" style="width:300px;height:220px;">
			<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;旧密码：</span><input type="password" name="oldpassword" id="oldpassword"/></p>
			<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：</span><input type="password" name="newpassword" id="newpassword"/></p>
			<p><span>&nbsp;&nbsp;确认密码：</span><input type="password" name="newpassword1" id="newpassword1"/></p>
			<p style="text-align: center;padding: 5px;">
				<button  class="easyui-linkbutton" onclick="update();" icon="icon-ok">确认</button>
				<button  class="easyui-linkbutton" onclick="cancel()"  icon="icon-cancel">取消</button>
			</p>
		
	
	</div> 
</div>
</body>
</html>