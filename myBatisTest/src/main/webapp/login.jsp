<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
</head>
<body>

<form class="form-horizontal" role="form" method="post" id="">
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">用户名</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="username">
		</div>
	</div>
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">密码</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="password">
		</div>
	</div>	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-info" onclick="login()"><span class="glyphicon glyphicon-ok"></span>登录</button>
		</div>
	</div>
</form>
</body>

<script type="text/javascript">
	function login(){
		// 获取用户输入的值
		var username = $("#username").val();
		var password = $("#password").val();
		// 判断用户有没有输入用户名、密码
		 if(username.length < 1){
			alert("请输入用户名！");
		}else if(password.length < 1){
			alert("请输入密码！");
		}else{
			$.post({
				url:"<%=request.getContextPath()%>/actionTravel/login",
				data:{
					"username":username,
					"password":password,

				},
				dataType:"json",
				success:function(result){
					if(result.code == 1){
						alert("登录成功！");
						location.href="<%=request.getContextPath()%>/actionTravel/toList"
					}else if(result.code == 3){
						alert("用户名不存在！");
					}else if(result.code == 4){
						alert("密码错误！");
					}
				},
				error:function(){
					alert("登录失败！");
				}
			})
		}
	}
	
	
	
</script>
</html>