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
	<table id="tcdg"></table>
	
	<script type="text/javascript">
		$(function(){
			$('#tcdg').datagrid({
				url: '${pageContext.request.contextPath}/teacher/showCourse',
				queryParams:{"tid":"${user.id}"},
				method: 'get',
				title: '课程信息',
				iconCls: 'icon-save',
				width: 800,
				height: 400,
				fitColumns: true,
				singleSelect: true,
				pagination : true,//是否显示分页
				rownumbers : true,
				idField:'id',
				columns:[[
					{field:'cname',title:'课程名称',width:120},
					{field:'hours',title:'课程学时',width:80,align:'center'},
					{field:'type',title:'课程类型',width:180,align:'center'},
					{field:'room',title:'上课教室',width:180,align:'center'}
				]],
			});
		});
</script>		
</body>
</html>