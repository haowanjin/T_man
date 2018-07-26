<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="easyui-panel" title="个人信息" style="width:400px">
	<table>
		<tr><td>职工号:</td><td>eeee</td></tr>
		<tr><td>姓名:</td><td>${teacher.name}</td></tr>
		<tr><td>性别:</td><td>${teacher.sex}</td></tr>
		<tr><td>职称:</td><td>${teacher.title}</td></tr>
		<tr><td>密码:</td><td>${teacher.pwd}</td></tr>
	</table>
</div>
</body>
</html>