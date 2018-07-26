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
<body>
	<div style="margin:20px 0;"></div>
	<table id="sdg" width="1500"></table>
	
	<div id="sw" class="easyui-window" title="修改学生信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:400px;padding:10px;">
	    <form id="sxg" class="easyui-form" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr><td><input class="easyui-textbox" type="hidden" name="id" id="id"></td></tr>
	    		<tr>
	    			<td>学号:</td>
	    			<td><input class="easyui-textbox" type="text" name="sid" id="sid" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" id="sname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td><input class="easyui-textbox" type="text" name="sex" id="ssex"></input></td>
	    		</tr>
	    		<tr>
	    			<td>专业:</td>
	    			<td><input class="easyui-textbox" type="text" name="department" id="department" ></input></td>
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
			$('#sdg').datagrid({
				url: '${pageContext.request.contextPath}/admin/showstu',
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
					{field:'department',title:'专业',width:180,align:'center'},
					{
						field : 'opt1',
						title : '修改',
						width : 100,
						formatter : function(value, row, index) {
							return "<a href=javascript:edituser('"+row.sid+"')>修改</a>";
						}
					},
					{
						field : 'opt2',
						title : '删除',
						width : 100,
						formatter : function(value, row, index) {
							return "<a href=javascript:deleteuser('"+row.sid+"')>删除</a>";
						}
					}
				]],
			});
		});
		//修改用户
		function edituser(id){
			$.post("${pageContext.request.contextPath}/admin/getStudent.action",{"sid":id},function(data){
				$("#id").textbox("setValue", data.id);
				$("#sid").textbox("setValue", data.sid);
				$("#sname").textbox("setValue", data.name);
				$("#ssex").textbox("setValue", data.sex);
				$("#department").textbox("setValue", data.department);
 				$('#sw').window('open');
			 }); 
		}
		function submitForm(){
			$('#sxg').form('submit',{
				onSubmit:function(){
					$.post("${pageContext.request.contextPath}/admin/updatestudent",$("#sxg").serialize(),function(data){
						if(data =="1"){
							alert("修改成功!");
			 				$('#sw').window('close');
							$("#sdg").datagrid("reload");
						}	
						else{
							alert("修改失败,请稍后重试!");
							$("#sdg").datagrid("reload");
						}
					});
				}
			});
		}
		function clearForm(){
			$('#sxg').form('clear');
		}
		//删除用户方法
		function deleteuser(id){
			var flag=confirm("你真的要删除学号为["+id+"]这个学生的信息吗?");
			if(!flag)
				return;
			$.post("${pageContext.request.contextPath}/admin/deleteStudent",{"sid":id},function(data){
				if(data =="1"){
					alert("删除成功!");
					$("#sdg").datagrid("reload");

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