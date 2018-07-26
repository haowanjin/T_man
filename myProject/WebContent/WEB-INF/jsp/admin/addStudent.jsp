<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/themes/icon.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/demo/demo.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
</head>
<body>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="添加学生" style="width:400px">
		<div style="padding:10px 60px 20px 60px">
	    <form id="asff" class="easyui-form" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>学号:</td>
	    			<td><input class="easyui-textbox" type="text" name="sid" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td><input class="easyui-textbox" type="text" name="pwd" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td><input class="easyui-textbox" type="text" name="sex" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>专业:</td>
	    			<td><input class="easyui-textbox" type="text" name="department" data-options="required:true"></input></td>
	    		</tr>
	    	</table>
	    </form>
	    	<div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	    </div>
	</div>
	<script>
	function submitForm(){
		$('#asff').form('submit',{
			onSubmit:function(){
				$.post("${pageContext.request.contextPath}/admin/insertStudent",$("#asff").serialize(),function(data){
					alert("添加成功!");
					location.href="${pageContext.request.contextPath}/admin/index"
				});
			}
		});
	}
		function clearForm(){
			$('#asff').form('clear');
		}
	</script>
</body>
</html>