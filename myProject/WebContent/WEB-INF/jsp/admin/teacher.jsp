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
	<table id="tdg"></table>
	
	<div id="tw" class="easyui-window" title="修改老师信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:400px;padding:10px;">
	    <form id="txg" class="easyui-form" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr><td><input class="easyui-textbox" type="hidden" name="id" id="id"></td></tr>
	    		<tr>
	    			<td>职工号:</td>
	    			<td><input class="easyui-textbox" type="text" name="tid" id="tid" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" id="tname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td><input class="easyui-textbox" type="text" name="sex" id="tsex"></input></td>
	    		</tr>
	    		<tr>
	    			<td>职称:</td>
	    			<td><input class="easyui-textbox" type="text" name="title" id="title" ></input></td>
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
			$('#tdg').datagrid({
				url: '${pageContext.request.contextPath}/admin/showTeacher',
				method: 'get',
				title: '老师信息',
				iconCls: 'icon-save',
				width: 800,
				height: 400,
				fitColumns: true,
				singleSelect: true,
				pagination : true,//是否显示分页
				rownumbers : true,
				idField:'tid',
				columns:[[
					{field:'tid',title:'职工号',width:180},
					{field:'name',title:'姓名',width:120},
					{field:'sex',title:'性别',width:80,align:'center'},
					{field:'title',title:'职称',width:180,align:'center'},
					{
						field : 'opt1',
						title : '修改',
						width : 100,
						formatter : function(value, row, index) {
							return "<a href=javascript:edituser('"+row.tid+"')>修改</a>";
						}
					},
					{
						field : 'opt2',
						title : '删除',
						width : 100,
						formatter : function(value, row, index) {
							return "<a href=javascript:deleteuser('"+row.tid+"')>删除</a>";
						}
					}
				]],
			});
		});
		//修改用户
		function edituser(id){
			$.post("${pageContext.request.contextPath}/admin/getTeacher.action",{"tid":id},function(data){
				$("#id").textbox("setValue", data.id);
				$("#tid").textbox("setValue", data.tid);
				$("#tname").textbox("setValue", data.name);
				$("#tsex").textbox("setValue", data.sex);
				$("#title").textbox("setValue", data.title);
 				$('#tw').window('open');
			 }); 
		}
		function submitForm(){
			$('#txg').form('submit',{
				onSubmit:function(){
					$.post("${pageContext.request.contextPath}/admin/updateTeacher",$("#txg").serialize(),function(data){
						if(data =="1"){
							alert("修改成功!");
			 				$('#tw').window('close');
							$("#tdg").datagrid("reload");
						}	
						else{
							alert("修改失败,请稍后重试!");
							$("#tdg").datagrid("reload");
						}
					});
				}
			});
		}
		function clearForm(){
			$('#txg').form('clear');
		}
		//删除用户方法
		function deleteuser(id){
			var flag=confirm("你真的要删除职工号为["+id+"]这个老师的信息吗?");
			if(!flag)
				return;
			$.post("${pageContext.request.contextPath}/admin/deleteTeacher",{"tid":id},function(data){
				if(data =="1"){
					alert("删除成功!");
					$("#tdg").datagrid("reload");

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