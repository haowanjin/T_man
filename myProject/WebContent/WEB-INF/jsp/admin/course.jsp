<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
	<div style="margin:20px 0;"></div>
	<table id="cdg"></table>
	
	<div id="cw" class="easyui-window" title="修改课程信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:400px;padding:10px;">
	    <form id="cxg" class="easyui-form" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr>
	    		   <td><input class="easyui-textbox" type="hidden" name="id" id="id"></td></tr>
	    		<tr>
	    			<td>课程名称:</td>
	    			<td><input class="easyui-textbox" type="text" name="cname" id="cname" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>课程学时:</td>
	    			<td><input class="easyui-textbox" type="text" name="hours" id="hours"></input></td>
	    		</tr>
	    		<tr>
	    			<td>课程类型:</td>
	    			<td><input class="easyui-textbox" type="text" name="type" id="type"></input></td>
	    		</tr>
	    		<tr>
	    			<td>授课老师:</td>
	    			<td><select style="width:150px" class="easyui-combobox" name="tid" id="tname" data-options="required:true" >
	    					<option style="width:150px" >请选择...</option>
	    					<c:forEach var="teacher" items="${TEACHER}">
	    						<option style="width:150px" value="${teacher.id}">${teacher.name}</option>
	    					</c:forEach>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>上课教室:</td>
	    			<td>
	    				<select style="width:150px" class="easyui-combobox" id="room" name="rid" data-options="required:true">
	    					<option style="width:150px" >请选择...</option>
	    					<c:forEach var="room" items="${ROOM}">
	    						<option style="width:150px" value="${room.id}">${room.address}</option>
	    					</c:forEach>
	    				</select>
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:left;padding:5px">
		    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	</div>
	
	
	<script type="text/javascript">
		$(function(){
			$('#cdg').datagrid({
				url: '${pageContext.request.contextPath}/admin/listCourse',
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
						title : '修改',
						width : 100,
						formatter : function(value, row, index) {
							return "<a href=javascript:editcourse('"+row.id+"')>修改</a>";
						}
					},
					{
						field : 'opt2',
						title : '删除',
						width : 100,
						formatter : function(value, row, index) {
							return "<a href=javascript:deletecourse('"+row.id+"')>删除</a>";
						}
					}
				]],
			});
		});
		//修改用户
		function editcourse(id){
			$.post("${pageContext.request.contextPath}/admin/getCourse.action",{"id":id},function(data){
				$("#id").textbox("setValue", data.id);
				$("#cname").textbox("setValue", data.cname);
				$("#hours").textbox("setValue", data.hours);
				$("#type").textbox("setValue", data.type);
				$("#tname").combobox("setValue",data.tname);
				$("#room").combobox("setValue",data.room);
				
 				$('#cw').window('open');
			 }); 
		}
		function submitForm(){
			$('#cxg').form('submit',{
				onSubmit:function(){
					$.post("${pageContext.request.contextPath}/admin/updateCourse",$("#cxg").serialize(),function(data){
						if(data =="1"){
							alert("修改成功!");
			 				$('#cw').window('close');
							$("#cdg").datagrid("reload");
						}	
						else{
							alert("修改失败,请稍后重试!");
							$("#cdg").datagrid("reload");
						}
					});
				}
			});
		}
		function clearForm()
		{
			alert("${ROOM}")
			$('#cxg').form('clear');
		}
		//删除用户方法
		function deletecourse(id){
			var flag=confirm("你真的要删除该课程的信息吗?");
			if(!flag)
				return;
			$.post("${pageContext.request.contextPath}/admin/deleteCourse",{"id":id},function(data){
				if(data =="1"){
					alert("删除成功!");
					$("#cdg").datagrid("reload");

				}
				else{
					alert("删除失败,请稍后重试!");
					location.href="${pageContext.request.contextPath}/erro.jsp";
				}
			});
		}
		
	</script>
</body>
</html>