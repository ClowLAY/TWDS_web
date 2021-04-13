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
	<div class="easyui-panel" border="false" style="text-align: center;">
		<div style="margin-top: 30px;">
				<div class="name"><span >所属专业:</span></div>
				<select id="select" style="width:250px;height:30px;border-radius: 5px;" >
					<c:forEach items="${list}" var="c">
						<option value="${c.mid}">${c.mname}</option>
					</c:forEach>
				
				</select>
			</div>
			
			<div style="margin-top: 10px;">
				<div class="name"><span>班级名称:</span></div>
				<input class="easyui-textbox" data-options="required:true" id="clName"/>
			</div>
			
			<div style="margin-top: 10px;">
				<div class="name"><span>入学年份:</span></div>
				<input class="easyui-datebox" data-options="required:true,formatter:myformatter1,parser:myparser1" prompt="如：2017" id="clYear"  />
			</div>
			
			<div style="margin-top: 10px;">
				<div class="name"><span>学生人数:</span></div>
				<input class="easyui-textbox" data-options="required:true" id="clNum"/>
			</div>
			
			<div style="margin-top: 20px;">
			<a href="javascript:void(0)" onclick="addClass()" class="easyui-linkbutton" style="width:100px;outline: none;" iconCls="icon-add">添加</a>
		</div>
			
			
	</div>
</body>
<script type="text/javascript">
			
		 function myformatter1(date){
			var y=date.getFullYear();
			return y;
		} 
		
		 
		 function myparser1(s){
			 var t = Date.parse(s);
			 if (!isNaN(t)){
					return new Date(t);
				} else {
					return new Date();
				}
	          
		 }
		function addClass(){
				var mid=$("#select option:selected").val();
				var clName=$("#clName").val();
				var clYear=$("#clYear").val();
				var clNum=$("#clNum").val();
				
				if(mid==""){
					alert("请选择专业!");
					return false;
				}
				if(clName==""){
					alert("班级名称不能为空!");
					return false;
				}
				if(clYear==""){
					alert("入学年份不能为空!");
					return false;
				}
			
				if(clNum==""){
					alert("班级人数不能为空!");
					return false;
				}
			
				var data={
						mid:mid,
						clName:clName,
						clYear:clYear,
						clNum:clNum
					};
				$.ajax({
					url:'${pageContext.request.contextPath}/classes/insert.action',
					type:'post',
					data:data,
					success:function(e){
						alert(e.msg);
						window.location="${pageContext.request.contextPath}/classes/addClassView.action";
					}
				})
				
				
			}

</script>

</html>