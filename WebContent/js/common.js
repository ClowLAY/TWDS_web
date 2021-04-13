function getByteLen(val) {
    var len = 0;
    for (var i = 0; i < val.length; i++) {
       var length = val.charCodeAt(i);
       if(length>=0&&length<=128)
        {
            len += 1;
        }
        else
        {
            len += 2;
        }
    }
    return len;
}

function valPhone(val){
	var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
	return myreg.test(val);
}


function identityCodeValid(code) { 
    var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
    var tip = "";
    var pass= true;

    if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
        tip = "身份证号格式错误";
        pass = false;
    }

   else if(!city[code.substr(0,2)]){
        tip = "地址编码错误";
        pass = false;
    }
    else{
        //18位身份证需要验证最后一位校验位
        if(code.length == 18){
            code = code.split('');
            //∑(ai×Wi)(mod 11)
            //加权因子
            var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
            //校验位
            var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
            var sum = 0;
            var ai = 0;
            var wi = 0;
            for (var i = 0; i < 17; i++)
            {
                ai = code[i];
                wi = factor[i];
                sum += ai * wi;
            }
            var last = parity[sum % 11];
            if(parity[sum % 11] != code[17]){
                tip = "校验位错误";
                pass =false;
            }
        }
    }
    if(!pass) alert(tip);
    return pass;
}

function jsTrim(x) {
	if(isNull(x)) return "";
    return x.replace(/^\s+|\s+$/gm,'');
}

function addTabs1(title,href){
	var tt0 = window.parent.$("#tabs");
	addTabs(title,href,tt0);
}

//点击左侧菜单，在右边添加选项卡式页面
function addTabs(title,href,tt0){
	var tt ;
	var param ="";
	if(tt0){
		tt = tt0;
	}else{	
		tt = $("#tabs");
	}
	
	if (tt.tabs('exists', title)){
    	tt.tabs('select', title);
    	//modify by cui 2018-9-22 重新刷新一下
    	var selTab = tt.tabs('getSelected');
    	var url = $(selTab.panel('options').content).attr('src');     
    	//console.info(url);
        tt.tabs('update', {
            tab: selTab,
            options: {
                content:createFrame(href,url)
            }
        })
    	
	} else {
	  	if (href){
	  		var index = href.indexOf('?');
	  		if(index>=0){
	  			param = href.substring(index+1);
	  			
	  			if(param!=""){
	  				var index1 = param.indexOf("&");
	  				if(index1>=0){
	  					var arr = param.split("&");
	  					for(var k=0;k<arr.length;k++){
	  						writeCookie(arr[k]);
	  					}
	  				}else{
	  					//直接以"="分拆,写入cookie
	  					writeCookie(param);
	  				}
				}		
	  			href = href.substring(0,index);
	  		}
	  		
	    	var content = '<iframe  frameborder="0"  src="'+
	    		href+'" style="width:100%;height:99.4%;"></iframe>';
	  	} else {
	    	//var content = '未实现';
	  		return;
	  	}
	  	index_tabs = tt.tabs('add',{
	    	title:title,
	    	closable:true,
	    	bodyCls:'noOverflow',
	    	content:content,
	    	tools:[{
		    	iconCls:'icon-mini-refresh',
		    	handler:function(){
					var href = index_tabs.tabs('getSelected').panel('options').href;
					if (href) {/*说明tab是以href方式引入的目标页面*/
						var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
						index_tabs.tabs('getTab', index).panel('refresh');
					} else {/*说明tab是以content方式引入的目标页面*/
						var title = index_tabs.tabs('getSelected').panel('options').title;
						//console.info(title);
						/*if(title == '查看研讨记录'){
							return;
						}*/
						refreshTab(index_tabs);
					}
				}
		    }]
	  	});
	}
}

function loadNewPageToTab(href,url){
	var tt = $("#tabs");
	var selTab = tt.tabs('getSelected');
	//var url = $(selTab.panel('options').content).attr('src');     
	//console.info(url);
    tt.tabs('update', {
        tab: selTab,
        options: {
            content:createFrame(href,url)
        }
    })
}

function createFrame(href,url){
	var index = href.indexOf('?');
	if(index>=0){
		param = href.substring(index+1);
		
		if(param!=""){
			var index1 = param.indexOf("&");
			if(index1>=0){
				var arr = param.split("&");
				for(var k=0;k<arr.length;k++){
					writeCookie(arr[k]);
				}
			}else{
				//直接以"="分拆,写入cookie
				writeCookie(param);
			}
	}		
		href = href.substring(0,index);
	}
	
	return '<iframe  frameborder="0"  src="'+
		url+'" style="width:100%;height:99.4%;"></iframe>';
}

function refreshTab(index_tabs){
	var panel = index_tabs.tabs('getSelected').panel('panel');
	var frame = panel.find('iframe');
	try {
		if (frame.length > 0) {
			for ( var i = 0; i < frame.length; i++) {
				frame[i].contentWindow.document.write('');
				frame[i].contentWindow.close();
				frame[i].src = frame[i].src;
			}
			if (navigator.userAgent.indexOf("MSIE") > 0) {/* IE特有回收内存方法*/
				try {
					CollectGarbage();
				} catch (e) {
				}
			}
		}
	} catch (e) {
	}
}

function tabsClose(){
	var tab=$('#tabs').tabs('getSelected');//获取当前选中tabs
	var index = $('#tabs').tabs('getTabIndex',tab);//获取当前选中tabs的index
	$('#tabs').tabs('close',index);//关闭对应index的tabs
}

//获取选中的tab的title
function getTabTitle(){
	var title = $("#tabs").tabs('getSelected').panel('options').title;
	return title;
}

//封装滑动显示的消息框
function msgSlide(title,msg){
	$.messager.show({
		title:title,
		msg:'<div style="text-align:center;margin-top:20px;">'
			+msg+'</div>',
		timeout:2000,
		showType:'slide'
	});
}

function writeCookie(param){
	var paramArr = param.split("=");
	var paramName ="";
	var paramValue ="";
	if(paramArr.length==2){
		paramName = paramArr[0];
		paramValue = paramArr[1];
	}
	document.cookie= paramName + "="+paramValue+";path=/";	
}

function deleteCookie(name){
	var exp = new Date(); 
    exp.setTime(exp.getTime() - 1); 
    var cval=getDataFromCookie(name);
    if(cval!=null) {
    	document.cookie= name + "="+cval+";path=/;expires="+exp.toGMTString(); 
    }
        
}

function getDataFromCookie(paramName){
	var objName =paramName;
	//alert(document.cookie);
	var arrStr = document.cookie.split("; ");
    for(var i = 0;i < arrStr.length;i ++){
        var temp = arrStr[i].split("=");
        if(temp[0] == objName) return unescape(temp[1]);
   }
}


//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
	$.messager.alert(title, '<div style="text-align:center;margin-top:10px;">'
		+msgString+'</div>', msgType);
}

function msgSlide(title,msg){
	$.messager.show({
		title:title,
		msg:'<div style="text-align:center;margin-top:10px;">'
			+msg+'</div>',
		timeout:3000,
		showType:'slide'
	});
}

function now(){
	var date = new Date();
	var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
	var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
	+ (date.getMonth() + 1);
	var hor = date.getHours();
	var min = date.getMinutes();
	var sec = date.getSeconds();
	return date.getFullYear() + '-' + month + '-' + day+" "+hor+":"+min+":"+sec;
}

function getDate(){
	var date = new Date();
	return getYear()+'年'+getMonth()+'月'+ date.getDate()+'日';
}

function getDate1(){
	var date = new Date();
	return getYear()+'-'+getMonth()+'-'+ getDay();
}

function getYear(){
	var date = new Date();
	return date.getFullYear();
}

function getMonth(){
	var date = new Date();
	var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"+ (date.getMonth() + 1);
	return month;
}

function getDay(){
	var date = new Date();
	var day = date.getDate() >9 ?date.getDate():"0"+date.getDate();
	return day;
}

function isNull(exp){
	//if(val == null || val =='null' || val =='' || (typeof val) == un
	if (!exp && typeof(exp)!="undefined" && exp!=0) {
		return true;
	}else{
		return false;
	}
}


function trim(x) {
    return x.replace(/^\s+|\s+$/gm,'');
}

function isEmptyStr(s){
	if(isNull(s)) return true;
	return trim(s) == ""?true:false;
}

function isNumber(val){
	if(val == null || val ==""){
		return true;
	}
	var reg = /^\d+$/;
	if(reg.test(val)){
		return true;
	}else{
		return false;
	}
}

function isNumber2(val){
	if(val === "" || val == null){
		return false;
	}
	
	if(!isNaN(val)){
		return true;
	}else{
		return false;
	}
}

var mouseX;  //用于移动所选用户的位置判断
var divLeft, divWidth;//用于移动所选用户的位置判断
function exchangeDiv(obj){
	var b = $(obj).css("background");
	if(b.indexOf("arrow-left")>-1){
		exchange_element($(obj).prev(),$(obj));
	}
	
	if(b.indexOf("arrow-right")>-1){
		exchange_element($(obj),$(obj).next());
	}
}

function addArrow(e,obj){
	//console.info($(obj).index());
	var indexOfParent = $(obj).index();
	if(indexOfParent == 0){
		return ; //如果是第1个，表示主持人，不允许移动位置
	}
	
	mouseX = e.pageX;
	divLeft = $(obj).offset().left;
	//console.info("divLeft:" + divLeft + "--- mouseX:" + mouseX + "---indexOfParent:" + indexOfParent);
	
	if(indexOfParent !=1 && (mouseX < divLeft + 32)){
		
		$(obj).addClass("arrow_left");
	}else{
		$(obj).removeClass("arrow_left");
	}
	if(mouseX > divLeft + 60){
		$(obj).addClass("arrow_right");
	}else{
		$(obj).removeClass("arrow_right");
	}
}

function removeArrow(obj){
	$(obj).removeClass("arrow_left");
	$(obj).removeClass("arrow_right");
}

function exchange_element(a,b) {

    if(undefined == $(a).html()){
        return;
    }
    if(undefined == $(b).html()){
        return;
    }
    var $div1 = $(a);
    var $div3 = $(b);
    var $temobj1 = $("<span></span>");
    var $temobj2 = $("<span></span>");

    $temobj1.insertBefore($div1);
    $temobj2.insertBefore($div3);

    $div1.insertAfter($temobj2);
    $div3.insertAfter($temobj1);

    $temobj1.remove();
    $temobj2.remove();
}
