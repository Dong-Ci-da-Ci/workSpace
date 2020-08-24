<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 
	
	
<nav class="navbar navbar-default navbar-static-top" role="navigation"> 



<div class="container-fluid"> 
<div class="navbar-header" >
    <a class="navbar-brand" href="#" align=" right">
    <img src="<%=request.getContextPath()%>/images/qitatupian/1.jpg" height="30	" />
    </a>
</div>

<div class="navbar-header"> 
<a class="navbar-brand" href="<%=request.getContextPath()%>/actionUser/toIndex">飞狐教育</a> 
</div> 
<div> 
<ul class="nav navbar-nav"> 
	<li class="active"><a href="<%=request.getContextPath()%>/actionMovie/toList">电影管理</a></li> 
	<li><a href="#">地区管理</a></li> 
	<li><a href="#">类型管理</a></li> 
	<li class="dropdown"> 
	<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
	系统管理 <b class="caret"></b> 
	</a> 
	<ul class="dropdown-menu"> 
	 <li class="dropdown">
	          <a href="<%=request.getContextPath()%>/actionRole/toRoleList">角色管理</a>
	          <a href="<%=request.getContextPath()%>/actionUser/toList">用户管理</a>
	          <a href="<%=request.getContextPath()%>/actionPermission/toPermissionList">权限管理</a>
	  </li>
	</ul> 
	</li> 
</ul> 
</div>
<div style=" float: right;" >
	<table>
  		<tr>
  			<td><img class="img-circle" src="<%=request.getContextPath()%>/images/${user.avatarPath}" width="70px" height="70px"></td>
  			<td>
  				欢迎<font color="red">${user.username }</font>登录飞狐教育电影管理系统
  				<a href="<%=request.getContextPath()%>/actionUser/logout">注销</a>&nbsp;|&nbsp;<a href="javascript:0" onclick="updatePassword()">修改密码</a>
  				<br/>
	    		今天是第${user.loginCount }次登录，上次登录时间<fmt:formatDate value="${lastLoginTime }" pattern="yyyy-MM-dd HH:mm:ss"/> 
  			</td>
  		</tr>
  	</table>
	
</div>
</div> 
</nav>

<!-- 修改密码页面 -->
	<div id="updatePasswordPage" style="display: none">
<form class="form-horizontal" role="form" method="post" id="updatePasswordForm">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">原密码</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="oldPwd">
				</div>
			</div>
			
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">新密码</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="newPwd">
				</div>
			</div>
			
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="checkPwd">
				</div>
			</div>
			
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="reset" class="btn btn-danger" ><span class="glyphicon glyphicon-remove"></span>重置</button>
				</div>
			</div>
		</form>
	</div>



</body>
<script type="text/javascript">
	initUpdatePasswordPage = $("#updatePasswordPage").html();
	function updatePassword(){
		bootbox.confirm({
			title:"修改密码",
			size:"large",
			message:$("#updatePasswordPage form"),
			
			callback:function(result){
				if(result){
					
					var oldPwd = $("#updatePasswordForm #oldPwd").val();
					var newPwd = $("#updatePasswordForm #newPwd").val();
					var checkPwd = $("#updatePasswordForm #checkPwd").val();
					
					
					if(oldPwd.length < 1){
						alert("请输入原密码！");
						return false;
					}else if(newPwd.length <1){
						alert("请输入新密码！");
						return false;
					}else if(checkPwd.length <1){
						alert("请输入确认密码！");
						return false;
					}else if(newPwd != checkPwd){
						alert("两次密码不一致！");
						return false;
					}else{
						var param ={};
						param.oldPwd = oldPwd
						param.newPwd = newPwd;
						$.post({
							url:"<%=request.getContextPath()%>/actionUser/updatePassword",
							data:param,
							dataType:"json",
							success:function(result){
								if(result.code == 1){
									bootbox.alert("原密码不正确！");
								}else{
									alert("修改成功，请重新登陆！");
									location.href="<%=request.getContextPath()%>/actionUser/logout";
								}
							},
							error:function(){
								bootbox.alert("修改密码失败！");
							}
						})
					}
				}
				
				$("#updatePasswordPage").html(initUpdatePasswordPage);
			},
			buttons:{
				confirm:{
					label:"确认",
					className:"btn-primary",
				},
				cancel:{
					label:"取消",
					className:"btn-danger",
				}
			}
		})
	}

</script>


</html>