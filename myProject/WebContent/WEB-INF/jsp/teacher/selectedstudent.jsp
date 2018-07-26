<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin:20px 0;"></div>
	<table id="tscdg" width="1500"></table>
	
<script type="text/javascript">
		$(function(){
			$('#tscdg').datagrid({
				url: '${pageContext.request.contextPath}/teacher/getStudents',
				queryParams:{"tid":"${user.id}"},
				method: 'get',
				title: '学生信息',
				iconCls: 'icon-save',
				width: 800,
				height: 400,
				fitColumns: true,
				singleSelect: true,
				pagination : true,//是否显示分页
				rownumbers : true,
				idField:'sid',
				columns:[[
					{field:'sid',title:'学号',width:150},
					{field:'name',title:'姓名',width:120},
					{field:'sex',title:'性别',width:80,align:'center'},
					{field:'department',title:'专业',width:180,align:'center'}
				]],
			});
		});
	</script>
</body>
</html>