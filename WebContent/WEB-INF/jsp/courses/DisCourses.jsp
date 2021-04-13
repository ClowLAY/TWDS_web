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
							<option>请选择任课老师</option>
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
						<div class="name"><span>开课学期:</span></div>
						<input class="easyui-textbox"  id="coTerm"  readonly="readonly" prompt="自动填充数据" id="coTotal" value="${courses.coTerm }"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>周学时:</span></div>
						<input class="easyui-textbox" readonly="readonly"  id="coWeek" prompt="自动填充数据" value="${courses.coWeek }"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>开课周数:</span></div>
						<input class="easyui-textbox"  id="coWenum"  readonly="readonly" prompt="自动填充数据" value="${courses.coWenum }"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>总课时:</span></div>
						<input class="easyui-textbox"  id="coTotal"  readonly="readonly" prompt="自动填充数据"  value="${courses.coTotal }"/>
					</div>
					
					
				</div>
				<div style="width:50%;float:right;text-align: left;">
					<div style="margin-top:30px;">
						<div class="name" ><span >课程名称:</span></div>
						<select id="selectCourses" style="width:250px;height:30px;border-radius: 5px;" >
							<option value="请选择课程" >请选择课程</option>
							<c:forEach items="${listcourses}" var="c">
								<c:choose>
									<c:when test="${c.coId==courses.coId}">
										<option value="${c.coId}" selected="selected">${c.coName}</option>
									</c:when>
									<c:otherwise>
										<option value="${c.coId}" >${c.coName}/${c.coTerm}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div style="margin-top: 10px;">
						<div class="name"><span>课程类型:</span></div>
						<input class="easyui-textbox"  id="coType" readonly="readonly" prompt="自动填充数据" value="${courses.coType}"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>开课院系:</span></div>
						<input class="easyui-textbox"  id="cName"  readonly="readonly" prompt="自动填充数据" value="${courses.college.cName}"/>
					</div>
					<div style="margin-top:10px;">
						<div class="name" ><span >开课班级:</span></div>
						<select id="selectClass" style="width:250px;height:30px;border-radius: 5px;" >
							<option >请选择开课班级</option>
							<c:forEach items="${listClasses}" var="c">
									<option value="${c.clId}" >${c.clName}</option>
							</c:forEach>
						</select>
					</div>
					<div style="margin-top: 10px;">
						<div class="name"><span>工作量公式名称:</span></div>
						<input class="easyui-textbox"  id="fname"  readonly="readonly" prompt="自动填充数据"  value="${courses.formula.fname}"/>
					</div>
					
				</div>
			</div>
			
			
			<div style="margin-top: 10px;">
				<a href="javascript:void(0)" onclick="addTCourses()" class="easyui-linkbutton" style="width:70px;height:35px;outline: none;" iconCls="icon-add">分配	</a>
			</div>
			
	</div>

</body>
<script type="text/javascript">
	
		$("#selectCourses").change(function(){
			var coId=$("#selectCourses option:selected").val();
			var userid=$("#selectUserid option:selected").val();
			
			if(coId!="请选择课程"){
				window.location="${pageContext.request.contextPath}/courses/addDisCoursesView.action?coId="+coId+"&userid="+userid;
			}else{
				location.reload();
			}
			
		})
		
		


	function addTCourses(){
		var userid=$("#selectUserid option:selected").val();
		var coId=$("#selectCourses option:selected").val();
		var clId=$("#selectClass option:selected").val();
		if(userid==""||userid=='请选择任课老师'){
			alert("请选择老师");
			return false;
		}
		if(coId==""||coId=='请选择课程'){
			alert("请选择开课课程");
			return false;
		}
		if(clId==""||clId=='请选择开课班级'){
			alert("请选择开课班级");
			return false;
		}
		
		var data={coId:coId,clId:clId,userid:userid};
		$.ajax({
			url:'${pageContext.request.contextPath}/tCourses/insert.action',
			type:'post',
			data:data,
			success:function(e){
				alert(e.msg);
				window.location="${pageContext.request.contextPath}/courses/DisCoursesView.action";
			}
		})
		
		
	}
</script>
</html>