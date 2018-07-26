<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上选课后台管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/themes/icon.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>

</head>
<body class="easyui-layout">

 	<div region="north" style="padding: 25px;background:#D2E4EC;text-align:right">
        <a style="font-size: 14px;" href="${pageContext.request.contextPath}/logout">退出系统</a>
    </div>
	<div region="south" style="padding: 10px;background:#CDE4E3">
        <span style="font-size: 14px;">当前用户是:${user.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	用户类型是:管理员
        </span>
    </div>

    <div data-options="region:'west',title:'菜单',split:true" style="width:180px;">
    	<ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
         	<li>
         		<span>课程信息管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'addCourse'}">添加课程</li>
	         		<li data-options="attributes:{'url':'showCourse'}">查看课程</li>
	         	</ul>
         	</li>
         	<li>
         		<span>学生信息管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'addStudent'}">添加学生</li>
	         		<li data-options="attributes:{'url':'student'}">查看学生</li>
	         	</ul>
         	</li>
         	<li>
         		<span>教师信息管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'addTeacher'}">添加教师</li>
	         		<li data-options="attributes:{'url':'teacher'}">查看教师</li>
	         	</ul>
         	</li>
         	<li>
         		<span>教室信息管理</span>
         		<ul>
	         		<li data-options="attributes:{'url':'addRoom'}">添加教室</li>
	         		<li data-options="attributes:{'url':'room'}">查看教室</li>
	         	</ul>
         	</li>
         </ul>
    </div>
    <div data-options="region:'center',title:''">
    	<div id="tabs" class="easyui-tabs">
		    <div title="首页" style="padding:0px;">
		    </div>		    
		</div>
    </div>
    
<script type="text/javascript">
$(function(){
		$('#menu').tree({
		onClick: function(node){
			if($('#menu').tree("isLeaf",node.target)){
				var tabs = $("#tabs");
				var tab = tabs.tabs("getTab",node.text);
				if(tab){
					tabs.tabs("select",node.text);
				}else{
					tabs.tabs('add',{
					    title:node.text,
					    href: node.attributes.url,
					    closable:true,
					    bodyCls:"content"
					});
				}
			}
		}
	});
		
		
		
		
		$("#sub-btn").click(function(){
			alert("-----------------------");
			var name=$.trim($("[name='sid']").val());
			if(name==""){
				//layer.msg("<b style='color:red;'>用户名未填写!</b>");
				alert('用户名未填写!', '#name');
				$("[name='sid']").focus();
				return false;
			}
			var pwd=$.trim($("[name='pwd']").val());
			if(pwd==""){
				alert('密码不能为空!', '#pwd');
				$("[name='pwd']").focus();
				return false;
			}
			var flag=$('input:radio[name="t1"]:checked').val();
			if(flag == null){
				alert("请选择用户类型!");
				return false;			
			}
			var src = "${pageContext.request.contextPath}/student/login.action";
			if(flag == "2") {
				src = "${pageContext.request.contextPath}/teacher/login.action";
			}
			if(flag == "3") {
				src = "${pageContext.request.contextPath}/admin/login.action";
			}
			
			$.post(src,{id:name,pwd:pwd},function(data) {
				if(data == "0") {
					alert("用户名或密码错误!");
					$("[name='sid']").focus();
				} 
				else if(data=="1"){
					location.href="${pageContext.request.contextPath}/student/index.action";
				}else if(data=="2"){
					location.href="${pageContext.request.contextPath}/teacher/index.action";
				}
				else if(data =="3") {
					location.href="${pageContext.request.contextPath}/admin/index.action";
				}
				else {location.href="${pageContext.request.contextPath}/erro.jsp"}
			});
			
		});
});
</script>
</body>
</html>