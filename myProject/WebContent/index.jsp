<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hovertree_login.css" />
<title>网上选课系统</title>
<base target="_blank" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
$(function(){
	$("#sub-btn").click(function(){
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

</head>
<body>
<div id="header">
  <div class="header_title"> <span class="title_con">西南大学网上选课系统</span> </div>
</div>
<div id="content">
<form>
<center>
<div class="con">
<div class="con_title"> <span class="con_title_sp">欢迎登录选课系统</span> </div>

<div class="con_panel">
  <div class="con_input"> <span>用户名：</span>
    <input type="text" name="sid" id="name" placeholder="学号/工号"/>
  </div>
  <div class="con_input"> <span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
    <input type="password" name="pwd" id="pwd" placeholder="密码"/>
  </div>
  <div class="con_select">
    <input type="radio" name="t1"  value="1" checked/>
    <label for="hovertreestu">学生</label>
    <input type="radio" name="t1"  value="2" />
    <label for="hovertreetea">教师</label>
    <input type="radio" name="t1"  value="3" />
    <label for="hovertreeadm">管理员</label>
  </div>
  <input type="button" id="sub-btn" value="登 1录" class="submit-btn"/>
</div>
</div>
</center>
</form>
</div>
</body>
</html>
