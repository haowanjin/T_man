<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:if test="${sessionScope.user==null}">
<c:redirect url="/index.jsp"/>
</c:if>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="添加课程" style="width:400px">
		<div style="padding:10px 60px 20px 60px">
	    <form id="acff" class="easyui-form" data-options="novalidate:true">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>课程名称:</td>
	    			<td><input class="easyui-textbox" type="text" name="cname" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>课程学时:</td>
	    			<td><input class="easyui-textbox" type="text" name="hours" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>课程类型:</td>
	    			<td><input class="easyui-textbox" type="text" name="type" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>授课教师:</td>
	    			<td><select style="width:150px" class="easyui-combobox" name="tid" data-options="required:true" >
	    					<option style="width:120px" value="">请选择...</option>
	    					<c:forEach var="teacher" items="${teacherlist}">
	    						<option style="width:150px" value="${teacher.id}">${teacher.name}</option>
	    					</c:forEach>
	    				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>上课教室:</td>
	    			<td><select style="width:150px" class="easyui-combobox" name="rid" data-options="required:true">
	    					<option style="width:150px" value="">请选择...</option>
	    					<c:forEach var="room" items="${roomlist}">
	    						<option style="width:150px" value="${room.id}">${room.address}</option>
	    					</c:forEach>
	    				</select>
	    			</td>
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
		$('#acff').form('submit',{
			onSubmit:function(){
				$.post("${pageContext.request.contextPath}/admin/insertCourse",$("#acff").serialize(),function(data){
					alert("添加成功!");
					location.href="${pageContext.request.contextPath}/admin/index"
				});
			}
		});
	}
		function clearForm(){
			alert("${teacherlist}")
			alert("${roomlist}")

			$('#acff').form('clear');
		}
		
		$(function(){
			$("#sub-btn").click(function(){
				alert("-----------------------");
				var name=$.trim($("[name='sid']").val());
				if(name==""){
					//layer.msg("<b style='color:red;'>用户名未填写!</b>");
					alert('用户名未填写!', '#name');
					$("[name='sid']").focus();
					return false;
				}
				var pwd=$.trim($("[name='pwd']").val());
				if(pwd==""){
					alert('密码不能为空!', '#pwd');
					$("[name='pwd']").focus();
					return false;
				}
				var flag=$('input:radio[name="t1"]:checked').val();
				if(flag == null){
					alert("请选择用户类型!");
					return false;			
				}
				var src = "${pageContext.request.contextPath}/student/login.action";
				if(flag == "2") {
					src = "${pageContext.request.contextPath}/teacher/login.action";
				}
				if(flag == "3") {
					src = "${pageContext.request.contextPath}/admin/login.action";
				}
				
				$.post(src,{id:name,pwd:pwd},function(data) {
					if(data == "0") {
						alert("用户名或密码错误!");
						$("[name='sid']").focus();
					} 
					else if(data=="1"){
						location.href="${pageContext.request.contextPath}/student/index.action";
					}else if(data=="2"){
						location.href="${pageContext.request.contextPath}/teacher/index.action";
					}
					else if(data =="3") {
						location.href="${pageContext.request.contextPath}/admin/index.action";
					}
					else {location.href="${pageContext.request.contextPath}/erro.jsp"}
				});
				
			});
			
		});
	</script>
</body>
</html>