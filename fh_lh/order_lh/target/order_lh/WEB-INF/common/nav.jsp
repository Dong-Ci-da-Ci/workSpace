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
<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
	    <div class="navbar-header">
	        <a class="navbar-brand" href="#">电影管理系统</a>
	    </div>
	    <div>
	        <ul class="nav navbar-nav" id="aaa">
	           
	        </ul>
	    </div>
	    <div style="color: #fff; float: right;" >
	    	<table>
	    		<tr>
	    			<td><img class="img-circle" src="<%=request.getContextPath()%>/images/${user.avatarPath}" width="70px" height="70px"></td>
	    			<td>
	    				欢迎<font color="red">${user.username }</font>登录飞狐教育电影管理系统
	    				<a href="<%=request.getContextPath()%>/UserController/logout">注销</a>&nbsp;|&nbsp;<a href="javascript:0" onclick="updatePassword()">修改密码</a>
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
	//ajax全局设置
	// ajax成功或失败之后会执行
	$.ajaxSetup({
	    complete: function(xhr) {
	        if(xhr.responseJSON.data == 1){
	            bootbox.alert("您没有操作权限！");
	        }
	    }
	});

	$(function(){
		initUpdatePasswordPage = $("#updatePasswordPage").html();
	})
	

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
							url:"<%=request.getContextPath()%>/UserController/updatePassword",
							data:param,
							dataType:"json",
							success:function(result){
								if(result.code == 1){
									bootbox.alert("原密码不正确！");
								}else{
									alert("修改成功，请重新登陆！");
									location.href="<%=request.getContextPath()%>/UserController/logout";
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
	
	$(function(){
		//发起一个获取当前用户所有菜单权限的ajax请求
		$.ajax({
			url:"<%=request.getContextPath()%>/PermissionController/queryMenuListByUserId",
			success:function(result){
				if(result.success){
					//把当前用户所有菜单权限变成树形结构(有层次结构的)数据
					var menuList = getChildren(result.menuList,1);
					
					// 动态拼接列表
					var menuHtml = buildMenu(menuList);
					$("#aaa").html(menuHtml);
					
					
				}else{
					alert("查询菜单权限失败!");
				}
			},
			error:function(){
				alert("查询菜单权限失败!");
			}
		});
	});
	
	function buildMenu(menuList){
		var menuHtml = "";
		for (var i = 0; i < menuList.length; i++) {
			// 判断当前节点下面有没有自己子节点
			if(menuList[i].children.length > 0){
				menuHtml+='<li class="dropdown">';
				menuHtml+=' <a href="'+menuList[i].url+'" class="dropdown-toggle" data-toggle="dropdown">'+menuList[i].name+' <b class="caret"></b></a>';
				menuHtml+='<ul class="dropdown-menu">';
				menuHtml+=buildMenu(menuList[i].children);
				menuHtml+='</ul>';
				menuHtml+='</li>';
			}else{
				menuHtml += '<li class="dropdown"><a href="'+menuList[i].url+'">'+menuList[i].name+'</a></li>';
			}
		}
		return menuHtml;
	}
	
	function getChildren(menuList,pid){
		var arr = [];
		//遍历当前用户所有的菜单权限数组
		for(var i = 0 ; i < menuList.length ; i ++){
			//如果当前遍历的菜单权限的id等于传进来的pid
			if(menuList[i].pId == pid){
				//查找当前遍历菜单权限的孩子
				var children = getChildren(menuList, menuList[i].id);
				//将孩子挂到当前遍历菜单权限身上
				menuList[i].children = children;
				//将当前遍历菜单权限放入数组中
				arr.push(menuList[i]);
			}
		}		
		return arr;
	}
</script>

</html>