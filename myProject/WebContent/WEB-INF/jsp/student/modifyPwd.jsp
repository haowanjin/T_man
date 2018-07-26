<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="easyui-panel" title="修改密码" style="width:400px">
		<form id="updatePwd">
		<table >
			<tr><td>旧密码</td><td><input id="oldPwd" type="password"></td></tr>
			<tr><td>新密码:</td><td><input type="password" name="pwd"></td></tr>
			<tr><td>确认密码:</td><td><input type="password" id="rePwd"></td></tr>
		</table>
		</form>
	</div>
</body>
</html>