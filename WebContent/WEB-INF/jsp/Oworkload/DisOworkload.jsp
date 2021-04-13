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
	width:110px;
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

	<div class="easyui-panel" border="false"  style="text-align: center;">
			<div style="margin-top: 20px;">
			
				<div style="width:50%;float: left;text-align: center;" >
					<div style="margin-top: 30px;">
					<div class="name" ><span >任课教师:</span></div>
						<select id="selectUserid" style="width:250px;height:30px;border-radius: 5px;" >
							<option value="请选择任课老师">请选择任课老师</option>
							<c:forEach items="${listUser}" var="u">
									<c:choose>
									<c:when test="${u.userid==userid1}">
										<option value="${u.userid}" selected="selected" >${u.name}</option>
									</c:when>
									<c:otherwise>
										<option value="${u.userid}" >${u.name}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>工作量值:</span></div>
						<input class="easyui-textbox" readonly="readonly" prompt="自动填充数据" id="ovalue" value="${oworkload.ovalue }"/>
					</div>
					<div style="margin-top: 10px;">
						<div class="name"><span>工作时间:</span></div>
						<input class="easyui-datetimebox" 	  id="totime"/>
					</div>
					
				</div>
				<div style="width:50%;float:right;text-align: left;">
					<div style="margin-top:70px;">
						<div class="name" ><span >其它工作量类型:</span></div>
						<select id="selectOwork" style="width:250px;height:30px;border-radius: 5px;" >
							<option value="请选择工作量类型">请选择工作量类型</option>
							<c:forEach items="${listOwork}" var="o">
								<c:choose>
									<c:when test="${o.oid==oworkload.oid}">
										<option value="${o.oid}" selected="selected">${o.otype}</option>
									</c:when>
									<c:otherwise>
										<option value="${o.oid}" >${o.otype}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>工作量名称:</span></div>
						<input class="easyui-textbox"   id="toname" prompt="监考软件1701班MySQL期末考试"/>
					</div>
					
					
					
				</div>
			</div>
			
			
			<div style="margin-top: 10px;">
				<a href="javascript:void(0)" onclick="addOworkload()" class="easyui-linkbutton" style="width:70px;height:35px;outline: none;" iconCls="icon-add">分配	</a>
			</div>
			
	</div>

</body>
<script type="text/javascript">
	
		$("#selectOwork").change(function(){
			var oid=$("#selectOwork option:selected").val();
			var userid=$("#selectUserid option:selected").val();
			if(oid!="请选择工作量类型"){
				window.location="${pageContext.request.contextPath}/Oworkload/addDisOworkload.action?oid="+oid+"&userid="+userid;
			}else{
				location.reload();
			}
			
		})


	function addOworkload(){
		var userid=$("#selectUserid option:selected").val();
		var oid=$("#selectOwork option:selected").val();
		var toname=$("#toname").val();
		var totime=$("#totime").val();
		
		if(userid==""){
			alert("请选择老师");
			return false;
		}
		if(oid==""){
			alert("请选择其它工作量类型");
			return false;
		}
		if(toname==""){
			alert("请输入工作量名称");
			return false;
		}
		
		if(totime==""){
			alert("请输入工作时间");
			return false;
		}
		
		var data={oid:oid,toname:toname,userid:userid,totime:totime}
		$.ajax({
			url:'${pageContext.request.contextPath}/Toworkload/insert.action',
			type:'post',
			data:data,
			success:function(e){
				alert(e.msg);
				window.location="${pageContext.request.contextPath}/Oworkload/DisOworkload.action";
			}
		})
		
		
	}
</script>
</html>