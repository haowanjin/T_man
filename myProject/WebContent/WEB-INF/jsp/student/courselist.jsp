<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网上选课后台管理系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/themes/icon.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/demo/demo.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
</head>
<body >
	<div style="margin:20px 0;"></div>
	<table id="scdg"></table>
	
	<script type="text/javascript">
		$(function(){
			$('#scdg').datagrid({
				url: '${pageContext.request.contextPath}/student/showCourse',
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
					{field:'tname',title:'授课老师',width:180,align:'center'},
					{field:'room',title:'上课教室',width:180,align:'center'},
					{
						field : 'opt1',
						title : '选择课程',
						width : 100,
						formatter : function(value, row, index) {
							return "<a href=javascript:selectcourse('"+row.id+"')>选课</a>";
						}
					}
				]],
			});
		});
		
		function selectcourse(id){
			$.ajax({

				type: "GET",
				async:false,
				url: "${pageContext.request.contextPath}/student/checkIt",
				data: {"sid":"${user.id}", "cid":id},
				success: function(data){
					if(data =="1"){
						alert("你已经选过该课程了!");
						return;
					}else
					$.post("${pageContext.request.contextPath}/student/chooseCourse.action",{"cid":id,"sid":"${user.id}"},function(data){
						if(data == "1"){
							alert("选课成功!");
						}
						else{
							alert("选课失败,请稍后重试!")
						}
					}
					);
				}

			});
			
		}
	</script>
</body>
</html>