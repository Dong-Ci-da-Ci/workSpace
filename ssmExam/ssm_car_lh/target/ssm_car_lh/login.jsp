<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 引入背景动态特效js -->

<jsp:include page="WEB-INF/common/js-url.jsp"></jsp:include>

</head>
<style type="text/css">
html{width: 100%; height: 100%;}

body{

	background-repeat: no-repeat;



	background-color: #00BDDC;



	background-size: 100% 100%;

}

.snow-container { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 100001; }

</style>
<body>
<!-- 雪花背景 -->
	<div class="snow-container"></div>
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
				<label for="firstname" class="col-sm-2 control-label">验证码</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="code">
				</div>
				<div class="col-sm-1">
					<img src="<%=request.getContextPath()%>/UserController/yan" onclick="changeCode(this)">
				</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-info" onclick="aa()"><span class="glyphicon glyphicon-ok"></span>登录</button>
			<button type="reset" class="btn btn-danger" onclick="aaa()"><span class="glyphicon glyphicon-remove"></span>重置</button>
			<a href="javascript:0" onclick="fwod()">忘记密码</a>
		</div>
	</div>
	</form>
</body>
<script type="text/javascript">
			function changeCode(obj){
				obj.src="<%=request.getContextPath()%>/UserController/yan?q="+new Date().getTime();
			}
           function aa(){

        	   var name=$("#username").val();
        	   var password=$("#password").val();
        	   var code=$("#code").val();
        	   if(code.length<1){
        		   alert("请输入验证码");
        	   }else if(name.length<1){
        		   alert("请输入账号");
        	   }else if(password.length<1){
        		   alert("请输入密码");
        	   }else{

        	       //李浩

        		   $.post({
         			  url:"<%=request.getContextPath() %>/UserController/dengLu",
         			  data:{
         				  "username":name,
         				  "Ppassword":password,
         				  "code":code
         			  },
         			  dataType:"json",
         			  success:function(re){
         				  if(re.cord==1){
         					  alert("登录成功");
         					  location.href="<%=request.getContextPath() %>/carController/toList";
         				  }
         				  if(re.cord==2){
         					  alert("验证码错误");
         				  }
         				  if(re.cord==3){
         					  alert("用户名不存在");
         				  }
         				  if(re.cord==4){
         					  alert("密码错误");
         				  }else if(re.cord==5){
         					 alert("密码错误三次，您的账号已被锁定！");
         				  }
         			  },
         			  error:function(){
         				  alert("登录失败");
         			  }
         		  })
        	   }
           }

 
           
  
</script>
</html>