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
	<table id="rdg"></table>
	
	<div id="rw" class="easyui-window" title="修改教室信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:700px;height:400px;padding:10px;">
	    <form id="rxg" class="easyui-form" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr><td><input class="easyui-textbox" type="hidden" name="id" id="id"></td></tr>
	    		<tr>
	    			<td>教学楼名称:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" id="rname"></input></td>
	    		</tr>
	    		<tr>
	    			<td>教室地址:</td>
	    			<td><input class="easyui-textbox" type="text" name="address" id="address" ></input></td>
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
			$('#rdg').datagrid({
				url: '${pageContext.request.contextPath}/admin/showRoom',
				method: 'get',
				title: '教室信息',
				iconCls: 'icon-save',
				width: 800,
				height: 400,
				fitColumns: true,
				singleSelect: true,
				pagination : true,//是否显示分页
				rownumbers : true,
				idField:'id',
				columns:[[
					{field:'name',title:'教学楼名称',width:80,align:'center'},
					{field:'address',title:'教室地址',width:80,align:'center'},
					{
						field : 'opt1',
						title : '修改',
						width : 100,
						align:'center',
						formatter : function(value, row, index) {
							return "<a href=javascript:editroom('"+row.id+"')>修改</a>";
						}
					},
					{
						field : 'opt2',
						title : '删除',
						width : 100,
						align:'center',
						formatter : function(value, row, index) {
							return "<a href=javascript:deleteroom('"+row.id+"')>删除</a>";
						}
					}
				]],
			});
		});
		//修改用户
		function editroom(id){
			$.post("${pageContext.request.contextPath}/admin/getRoom.action",{"id":id},function(data){
				$("#id").textbox("setValue", data.id);
				$("#rname").textbox("setValue", data.name);
				$("#address").textbox("setValue", data.address);
 				$('#rw').window('open');
			 }); 
		}
		function submitForm(){
			$('#rxg').form('submit',{
				onSubmit:function(){
					$.post("${pageContext.request.contextPath}/admin/updateRoom",$("#rxg").serialize(),function(data){
						if(data =="1"){
							alert("修改成功!");
			 				$('#rw').window('close');
							$("#rdg").datagrid("reload");
						}	
						else{
							alert("修改失败,请稍后重试!");
							$("#rdg").datagrid("reload");
						}
					});
				}
			});
		}
		function clearForm(){
			$('#rxg').form('clear');
		}
		//删除用户方法
		function deleteroom(id){
			var flag=confirm("你真的要删除这个教室的信息吗?");
			if(!flag)
				return;
			$.post("${pageContext.request.contextPath}/admin/deleteRoom",{"id":id},function(data){
				if(data =="1"){
					alert("删除成功!");
					$("#rdg").datagrid("reload");

				}
				else{
					alert("删除失败,请稍后重试!");
					location.href="erro.jsp";
				}
			});
		}
		
	</script>
</body>
</html>