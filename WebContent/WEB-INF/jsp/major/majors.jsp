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
<script type="text/javascript">

	var mname="";//定义一个mname全局变量
	$(function(){
		$("#ew").window("close");
		$("#warn").window("close");
		$("#warn1").window("close");
	});
	

 	 function delHtmlTag(str){
	  return str.toString().match(/[\u4e00-\u9fa5]/g).join("");//取其中的汉字
	} 
	
	function deleteMajor(){
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			//alert("--"+cId+"--"+row.workName);
			$("#warn1").window("open");
		}
		
		
	}
	
	function certain(){
		var row=$("#dg").datagrid("getSelected");
		$.ajax({
			url:'${pageContext.request.contextPath}/major/delete.action',
			type:'post',
			data:{'mid':row.mid},
			success:function(e){
				window.location="${pageContext.request.contextPath}/major/selectAll.action";
			}
		});
	}
	

	function cancel(){
		$("#warn1").window("close");
	}

	
	function updateMajor(){
		var row=$("#dg").datagrid("getSelected");
		if(row==null||row==""){
			$("#warn").window("open");
		}else{
			$("#ew").window("open");
			var cId=delHtmlTag(row.cId);
		
			mname=row.mname;
			var html='<div style="margin-top: 30px;">'+
				'<div class="name"><span">专业编号:</span></div>'+
				'<input type="text" class="easyui-validatebox"  readonly="readonly"  style="width:70px;text-align:center;font-weight: bold;" id="mId" value="'+(row.mid)+'"/>'+
			'</div>'+
			'<div style="margin-top: 10px;">'+
			'<div class="name"><span >所属二级学院:</span></div>'+
			'<select id="select" style="width:250px;height:30px;border-radius: 5px;" >'+
				'<option value="1">信息工程学院</option>'+
				'<option value="2">经济管理学院</option>'+
				'<option value="3">艺术设计学院</option>'+
				'<option value="4">车辆运用学院</option>'+
				'<option value="5">车辆工程学院</option>'+
				'<option value="6">机电管理学院</option>'+
				'<option value="7">士官教育学院</option>'+
			'</select>'+
		'</div>'+
		'<div style="margin-top: 10px;">'+
			'<div class="name"><span">专业名称:</span></div>'+
			'<input type="text" class="easyui-validatebox" data-options="required:true"  id="mName" value="'+(row.mname)+'"/>'+
		'</div>'+
		'<div style="margin-top: 10px;text-align:center; ">'+
			'<a href="javascript:void(0)" onclick="update()" ><button style="width:150px;"  type="sumbit">提交</button></a>'+
		'</div>';
		$("#ew").html(html);
			if(cId=="信息工程学院"){
				$("#select option[value='1']").attr("selected","selected");
			}else if(cId=="经济管理学院"){
				$("#select option[value='2']").attr("selected","selected");
			}else if(cId=="艺术设计学院"){
				$("#select option[value='3']").attr("selected","selected");
			}else if(cId=="车辆运用学院"){
				$("#select option[value='4']").attr("selected","selected");
			}else if(cId=="车辆工程学院"){
				$("#select option[value='5']").attr("selected","selected");
			}else if(cId=="机电管理学院"){
				$("#select option[value='6']").attr("selected","selected");
			}else if(cId=="士官教育学院"){
				$("#select option[value='7']").attr("selected","selected");
			}
		
		}
	}
	function warn(){
		$("#warn").window("close");
	}
	
	
	
	function update(){
		
		var college=$("#select option:selected").val();
		var mName=$("#mName").val();
		var mId=$("#mId").val();
		
		if(college==""){
			alert("请选择二级学院");
			return false;
		}
		if(mName==""){
			alert("请输入专业名称");
			return false;
		}
		var data={'mId':mId,'cId':college,'mname':mName,'olkdWorkName':mname}
		$.ajax({
			url:'${pageContext.request.contextPath}/major/update.action',
			type:'post',
			data:data,
			success:function(e){
				alert(e.msg);
				window.location="${pageContext.request.contextPath}/major/selectAll.action";
				
			}
		});
		
	}

</script>

</head>
<body>
	<div id="tb">
			<span class="editSpan">
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteMajor()">删除</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateMajor()">修改</a>
			</span>
	</div> 
	
	<table id="dg" class="easyui-datagrid" border="false"  data-options="pagination:true,fitColumns:true,rownumbers:true,singleSelect:true" >
		<thead>	
			<th field="mid" width="150" align="center">专业编号</th>
			<th field="cId" width="250" align="center">所属二级学院</th>
			<th field="mname" width="950;" align="center">专业名称</th>
		</thead>
		<c:if test="${list.size()==0}">
				<div class="easyui-window" title="提示" style="width:200px;height:100px;text-align: center;">
					<span>暂无数据！</span>
				</div>
		</c:if>
		<c:if test="${list.size()!=0}">
		<c:forEach  items="${list}" var="m">
			<tr>
				<td>${m.mid}</td>
				<td>
					<c:if test="${m.cId==1}">
						<span>信息工程学院</span>
					</c:if>
					<c:if test="${m.cId==2}">
						经济管理学院
					</c:if>
					<c:if test="${m.cId==3}">
						艺术设计学院
					</c:if>
					<c:if test="${m.cId==4}">
						车辆运用学院
					</c:if>
					<c:if test="${m.cId==5}">
						车辆工程学院
					</c:if>
					<c:if test="${m.cId==6}">
						机电管理学院
					</c:if>
					<c:if test="${m.cId==7}">
						士官教育学院
					</c:if>
					
				</td>
				<td>${m.mname}</td>
			</tr>
		</c:forEach>
		</c:if>
	
	</table>
	<div class="easyui-window" id="ew" title="修改数据" style="width:420px;height:250px; ">
		
	</div>
	
	<div class="easyui-window" id="warn" title="警告" style="width:200px;height:150px;text-align: center;">
		<p>请选择一行数据!</p>
		<div style="margin-top: 20px;">
			<a href="javascript:void(0)" onclick="warn()" class="easyui-linkbutton" >确定</a>
		</div>
	</div>
	
	<div class="easyui-window" id="warn1" title="警告" style="width:200px;height:150px;text-align: center;">
		<p>确定删除数据!</p>
		<div style="margin-top: 20px;">
			<a href="javascript:void(0)" onclick="certain()" class="easyui-linkbutton" >确定</a>
			<a href="javascript:void(0)" onclick="cancel()" class="easyui-linkbutton" >取消</a>
		</div>
	</div>
	


</body>
</html>