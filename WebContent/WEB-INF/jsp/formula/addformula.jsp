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
<style type="text/css">
	#tb{
		height:40px;
		background: #efefef;
		
		
	}

.name{
	width:100px;
	text-align: left;
	display: inline-block;
	margin-left: 10px;
	
}

input{
	width:200px;
	height:27px;
	border-radius:7px;
	outline:none;

}


</style>
</head>
<body>
<div class="easyui-panel" border="false" >
			<p>公式信息</p>
			<div style="border-top:1px solid #efefef;">
				<div style="margin-top: 5px;">
					<div style="float: left;width:30%">
						<div class="name"><span>输入公式:</span></div>
						P = L <input class="easyui-textbox" data-options="required:true" prompt="*X*Y" id="expression" />
					</div>
					
					<div style="display:inline-block;width:30%">
						<div class="name"><span>p1参数:</span></div>
						<input class="easyui-textbox"  id="p1"  />
					</div>
					
					<div style="display:inline-block;width:30%">
						<div class="name"><span>p3参数:</span></div>
						<input class="easyui-textbox"  id="p3"  />
					</div>
					
					
				</div>
				<div style="margin-top: 10px;">
					<div style="float: left;width:30%">
						<div class="name"><span>公式名称:</span></div>
						<input class="easyui-textbox" data-options="required:true"  id="fname"  />
					</div>
					<div style="display:inline-block;width:30%">
						<div class="name"><span>p2参数:</span></div>
						<input class="easyui-textbox"   id="p2"  />
					</div>
					
				</div>
				
			</div>
			<p>公共参数</p>
			<div style="border-top:1px solid #efefef;">
				<div style="margin-top: 5px;">
					<div class="name"><span>X值:</span></div>
					<input class="easyui-textbox" data-options="required:true" prompt="1.00" id="Xvalue1"  />
				</div>
				
				<div style="margin-top: 10px;">
					<div class="name"><span>X值:</span></div>
					<input class="easyui-textbox" prompt="0.8" id="Xvalue2"/>
				</div>
			</div>
			<div style="margin-top: 10px;">
				<div style="float: left;width:30%">
					<div class="name"><span>Y值:</span></div>
					<input class="easyui-textbox"  data-options="required:true" prompt="1.00" id="Yvalue1"  />
				</div>
				
				<div style="float:left;width:260px;">
					<span>当人数:</span>
					<input class="easyui-textbox" data-options="required:true"  prompt="0" id="floor1"  />
				</div>
				<div style="display:inline-block;   width:250px;">
					<span>≤ Y <</span>
					<input class="easyui-textbox" data-options="required:true"  prompt="30" id="toplimit1" />
				</div>
				
			</div>
			
			<div style="margin-top: 10px;">
				<div style="float: left;width:30%">
					<div class="name"><span>Y值:</span></div>
					<input class="easyui-textbox"  prompt="1.10" id="Yvalue2"  />
				</div>
				
				<div style="float:left;width:260px;">
					<span>当人数:</span>
					<input class="easyui-textbox"  prompt="30" id="floor2"  />
				</div>
				<div style="display:inline-block;  width:250px;">
					<span>≤ Y <</span>
					<input class="easyui-textbox"  prompt="60" id="toplimit2" />
				</div>
				
			</div>
			
			<div style="margin-top: 10px;">
				<div style="float: left;width:30%">
					<div class="name"><span>Y值:</span></div>
					<input class="easyui-textbox"  prompt="1.20" id="Yvalue3"  />
				</div>
				
				<div style="float:left;width:260px;">
					<span>当人数:</span>
					<input class="easyui-textbox"  prompt="60" id="floor3"  />
				</div>
				<div style="display:inline-block;  width:250px;">
					<span> ≤ Y <</span>
					<input class="easyui-textbox"  prompt="90" id="toplimit3" />
				</div>
				
			</div>
			
			<div style="margin-top: 10px;">
				<div style="float: left;width:30%">
					<div class="name"><span>Y值:</span></div>
					<input class="easyui-textbox"  prompt="1.30" id="Yvalue4"  />
				</div>
				
				<div style="float:left;width:260px;">
					<span>当人数:</span>
					<input class="easyui-textbox"  prompt="90" id="floor4"  />
				</div>
				<div style="display:inline-block;  width:250px;">
					<span>  ≤ Y <</span>
					<input class="easyui-textbox"  prompt="120" id="toplimit4" />
				</div>
				
			</div>
			
			
			
		
			<div style="margin-top: 20px;">
			<a href="javascript:void(0)" onclick="addFormula()" class="easyui-linkbutton" style="width:100px;outline: none;" iconCls="icon-add">添加</a>
		</div>
		<div style="position:absolute;   left:78%;bottom:50%;color: red;">
			<p>注:X值:班级或教学组织形式校正系数(课时)</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;Y值:授课人数校正系数(课时)</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;Y:授课人数</p>
		</div>
			
	</div>
</body>

<script type="text/javascript">

function addFormula(){
	
	var expression=$("#expression").val();
	var fname=$("#fname").val();
	var p1=$("#p1").val();
	var p2=$("#p2").val();
	var p3=$("#p3").val();
	
	var Xvalue1=$("#Xvalue1").val();
	var Xvalue2=$("#Xvalue2").val();
	
	var Yvalue1=$("#Yvalue1").val();
	var floor1=$("#floor1").val();
	var toplimit1=$("#toplimit1").val();
	
	var Yvalue2=$("#Yvalue2").val();
	var floor2=$("#floor2").val();
	var toplimit2=$("#toplimit2").val();
	
	var Yvalue3=$("#Yvalue3").val();
	var floor3=$("#floor3").val();
	var toplimit3=$("#toplimit3").val();
	
	var Yvalue4=$("#Yvalue4").val();
	var floor4=$("#floor4").val();
	var toplimit4=$("#toplimit4").val();

	var Xvalues="";
	var Yvalues="";
	var floors="";
	var toplimits="";	

	if(expression==""){
		alert("表达式不能为空!");
		return false;
	}
	if(fname==""){
		alert("公式名称不能为空!");
		return false;
	}
	if(Xvalue1==""){
		alert("X值不能为空!");
		return false;
	}
	
	
	Xvalues=Xvalue1;
	if(Xvalue2!=null){
		Xvalues+=","+Xvalue2;
	}
	//alert("--"+Xvalues);

	if(Yvalue1==""){
		alert("Y值不能为空!");
		return false;
	}
	
	if(floor1==""){
		alert("上限人数不能为空!");
		return false;
	}
	
	if(toplimit1==""){
		alert("下 限人数不能为空!");
		return false;
	}
	
	Yvalues=Yvalue1;
	floors=floor1;
	toplimits=toplimit1;
	

		if(Yvalue2!=""){
			Yvalues+=","+Yvalue2;
			if(floor2==""){
				alert("上限人数不能为空!");
				return false;
			}
			
			if(toplimit2==""){
				alert("下 限人数不能为空!");
				return false;
			}
			floors+=","+floor2;
			toplimits+=","+toplimit2;
			
		}
		
		if(Yvalue3!=""){
			Yvalues+=","+Yvalue3;
			if(floor3==""){
				alert("上限人数不能为空!");
				return false;
			}
			
			if(toplimit3==""){
				alert("下 限人数不能为空!");
				return false;
			}
			floors+=","+floor3;
			toplimits+=","+toplimit3;
			
		}
		
		if(Yvalue4!=""){
			Yvalues+=","+Yvalue4;
			if(floor4==""){
				alert("上限人数不能为空!");
				return false;
			}
			
			if(toplimit4==""){
				alert("下 限人数不能为空!");
				return false;
			}
			floors+=","+floor4;
			toplimits+=","+toplimit4;
			
		}
		
	
	var data={
			expression:'P=L'+expression,
			fname:fname,
			p1:p1,
			p2:p2,
			p3:p3,
			Xvalues:Xvalues,
			Yvalues:Yvalues,
			floors:floors,
			toplimits:toplimits
		};
	 $.ajax({
		url:'${pageContext.request.contextPath}/formula/insert.action',
		type:'post',
		data:data,
		success:function(e){
			alert(e.msg);
			window.location="${pageContext.request.contextPath}/formula/addFormulaView.action";
		}
	}) 
	
	
}


</script>
</html>