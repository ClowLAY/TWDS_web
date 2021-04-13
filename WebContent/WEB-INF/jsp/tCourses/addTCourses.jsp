<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
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
	width:145px;
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
<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datetime = sdf.format(date);
		
	%>

	<h3 style="margin-left: 40%;"></h3>
	<div class="easyui-panel" border="false"  style="text-align: center;">
			<div style="margin-top: 20px;">
			
				<div style="width:50%;float: left;text-align: center;" >
					<div style="margin-top: 10px;">
						<div class="name"><span>任课教师:</span></div>
						<input class="easyui-textbox" readonly="readonly"  id="name" value="${name}"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>周学时:</span></div>
						<input class="easyui-textbox" readonly="readonly"  prompt="自动填充数据"  id="coWeek" value="${courses.coWeek }"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>开课周数:</span></div>
						<input class="easyui-textbox"  id="coWenum"  prompt="自动填充数据" readonly="readonly" value="${courses.coWenum }"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>总课时:</span></div>
						<input class="easyui-textbox"  id="coTotal"  prompt="自动填充数据"   readonly="readonly" value="${courses.coTotal }"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>开课学期:</span></div>
						<input class="easyui-textbox"  id="coTerm"  readonly="readonly"  prompt="自动填充数据" id="coTotal" value="${courses.coTerm }"/>
					</div>
				</div>
				<div style="width:50%;float:right;text-align: left;">
					<div style="margin-top:10px;">
						<div class="name" ><span >任课课程:</span></div>
						<select id="selectCourses" style="width:250px;height:30px;border-radius: 5px;" >
							<option >请选择课程</option>
							<c:forEach items="${list}" var="c">
								<c:choose>
									<c:when test="${c.courses.coId==courses.coId}">
										<option value="${c.courses.coId}" selected="selected">${c.courses.coName}/${c.courses.coTerm }</option>
									</c:when>
									<c:otherwise>
										<option value="${c.courses.coId}" >${c.courses.coName}/${c.courses.coTerm }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div style="margin-top: 10px;">
						<div class="name"><span>课程类型:</span></div>
						<input class="easyui-textbox"  id="coType" readonly="readonly"  prompt="自动填充数据"  value="${courses.coType}"/>
					</div>
					
					<div style="margin-top: 10px;">
						<div class="name"><span>开课院系:</span></div>
						<input class="easyui-textbox"  id="cName"  readonly="readonly"  prompt="自动填充数据" value="${courses.college.cName}"/>
					</div>
					<div style="margin-top:10px;">
						<div class="name" ><span >开课班级:</span></div>
						<input class="easyui-textbox"  id="clName"  readonly="readonly"  prompt="自动填充数据" value="${Classes.clName}"/>
					</div>
					<div style="margin-top: 10px;">
						<div class="name"><span>工作量公式名称:</span></div>
						<input class="easyui-textbox"  id="fname"  readonly="readonly"  prompt="自动填充数据"  value="${courses.formula.fname}"/>
					</div>
					
				</div>
			</div>
			
	</div>
	<hr>
	<div id="month">
	
	</div>
	<div class="easyui-panel" border="false"  style="text-align: center;">
				<div style="margin-top: 10px;">
			
				<div id="week" style="width:50%;float: left;text-align: center;" >
					
					
				</div>
				<div style="width:50%;float:right;text-align: left;">
					
					<div style="margin-top: 10px;">
						<div class="name"><span>教学工作量实际总课时:</span></div>
						<input class="easyui-textbox" prompt="16.0"   id="totalTworkload" "/>
					</div>
					
					 <div style="margin-top: 10px;">
						<div class="name"><span>其它工作量实际总课时:</span></div>
						<input class="easyui-textbox"   prompt="6.0"   id="totaOTworkload"  />
					</div>
					<div style="margin-top:10px;">
						<div class="name" ><span >总计:</span></div>
						<input class="easyui-textbox" prompt="22.0" id="totalworkload"  />
					</div>
					<div style="margin-top: 10px;">
						<a href="javascript:void(0)" onclick="addTCourses()" class="easyui-linkbutton" style="width:70px;height:35px;outline: none;" iconCls="icon-add">申报	</a>
					</div>
					
				</div>
			</div>
	</div>

</body>
<script type="text/javascript">
	
		$("#selectCourses").change(function(){
			var coId=$("#selectCourses option:selected").val();
			
			if(coId!="请选择课程"){
				window.location="${pageContext.request.contextPath}/tCourses/addDeclareTCoursesView.action?coId="+coId;

			}else{
				location.reload();
			}
		})

		//获取当前月份的周数
		 function getMonthWeek(a, b, c){
			/*  
			a = d = 当前日期  
			b = 6 - w = 当前周的还有几天过完(不算今天)  
			a + b 的和在除以7 就是当天是当前月份的第几周  
			*/
			
			     var date = new Date(a, parseInt(b) - 1, c);
			   
					w = date.getDay(),//获取当前星期值
			        d = date.getDate();//返回当前Date对象中一个月第几天的值
			    
			     return Math.ceil((d + 6 - w) / 7);
		};
		
		today = new Date(); //获取当前时间 
		var y = today.getFullYear();
		var m = today.getMonth() + 1;
		var d = today.getDate();
		$("#month").html('<h3 style="margin-left: 40%;">'+y+'年'+(m-1)+'月份教学工作量申报</h3>')
		
		var week=getMonthWeek(y, m-1, 1);
		week=week+(m-10)*4;
		
		var html1='<div style="margin-top: 20px;">'+
						'<div class="name"><span>第'+week+'周:</span></div>'+
						'<input class="easyui-textbox" prompt="4.0"  id="week1" />'+
					'</div>'+
					'<div style="margin-top: 10px;">'+
						'<div class="name"><span>第'+(week+1)+'周:</span></div>'+
						'<input class="easyui-textbox"  prompt="4.0"  id="week2" />'+
					'</div>'+
					'<div style="margin-top: 10px;">'+
						'<div class="name"><span>第'+(week+2)+'周:</span></div>'+
						'<input class="easyui-textbox" prompt="4.0"  id="week3"/>'+
					'</div>'+
					'<div style="margin-top: 10px;">'+
						'<div class="name"><span>第'+(week+3)+'周:</span></div>'+
						'<input class="easyui-textbox" prompt="4.0"  id="week4"/>'+
					'</div>';
					$("#week").html(html1);
		

	function addTCourses(){
		
		var value1=$("#week1").val();
		var value2=$("#week2").val();
		var value3=$("#week3").val();
		var value4=$("#week4").val();
		
		var totalTworkload=$("#totalTworkload").val();
		var totaOTworkload=$("#totaOTworkload").val();
		var totalworkload=$("#totalworkload").val();
		
		
		var coId=$("#selectCourses option:selected").val();
		
		if(coId=="请选择课程"||coId==""){
			alert("请选择课程");
			return false;
		}
		
		if(value1==""){
			alert("请填写第"+week+"周工作量");
			return false;
		
		}
		if(value2==""){
			alert("请填写第"+(week+1)+"周工作量");
			return false;
		
		}
		if(value3==""){
			alert("请填写第"+(week+2)+"周工作量");
			return false;
		
		}
		if(value4==""){
			alert("请填写第"+(week+3)+"周工作量");
			return false;
		
		}
		
		if(totaOTworkload==""){
			alert("请填写其它工作量实际总课时");
			return false;
		}
		
		if(totalTworkload==""){
			alert("请填写教学工作量实际总课时");
			return false;
		}
		
		if(totalworkload==""){
			alert("请填写本月工作量总计课时");
			return false;
		}
		
		if(Number(totalTworkload)!=(Number(value1)+Number(value2)+Number(value3)+Number(value4))){
			alert("----"+totalTworkload+"-----"+value1+value2+value3+value4)
			alert("教学工作量实际总课时与填写数据不匹配");
			return false;
		}
		
		if(Number(totalworkload)!=(Number(totalTworkload)+Number(totaOTworkload))){
			alert("本月工作量总计课时与填写数据不匹配");
			return false;
		}
		
		var weeks=week+","+(week+1)+","+(week+2)+","+(week+3);
		var values=value1+","+value2+","+value3+","+value4;
		var data={weeks:weeks,values:values,coId:coId};
		
		
		$.ajax({
			url:'${pageContext.request.contextPath}/examines/insert.action',
			type:'post',
			data:data,
			success:function(e){
				alert(e.msg);
				window.location="${pageContext.request.contextPath}/tCourses/DeclareTCoursesView.action";
			}
		});
		
	}
</script>
</html>