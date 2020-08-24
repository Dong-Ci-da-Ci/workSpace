<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<jsp:include page="../../common/js-url.jsp"></jsp:include>
</head>
<body>
	<div class="container" >


	
	<!-- 条件查询form页面	 -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">条件查询</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" role="form" id="searchForm">
				<div class="form-group">
					<div class="row">
						<div class="col-sm-6">
							<label for="firstname" class="col-sm-2 control-label">角色名称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="roleName">
							</div>
						</div>
						<div class="col-sm-6">
							<label for="firstname" class="col-sm-2 control-label">状态</label>
							<div class="col-sm-8">
								<div class="input-group"> 
									<label class="radio-inline">
										<input type="radio" name="status" value="1"> 启用
									</label>
									<label class="radio-inline">
										<input type="radio" name="status" value="2"> 禁止
									</label>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				
					
				<div class="form-group">
					<div class="row">
						<div class="col-sm-6">
							<label for="firstname" class="col-sm-2 control-label">创建日期</label>
							<div class="col-sm-8">
								<div class="input-group"> 
									<input type="text" class="form-control" id="c1"> 
									<span class="input-group-addon">至</span> 
									<input type="text" class="form-control" id="c2">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<label for="firstname" class="col-sm-2 control-label">修改日期</label>
							<div class="col-sm-8">
								<div class="input-group"> 
									<input type="text" class="form-control" id="u1"> 
									<span class="input-group-addon">至</span> 
									<input type="text" class="form-control" id="u2">
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
				
				
				
				
				<div class="form-group" align="right">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-primary" onclick="search()"><span class="glyphicon glyphicon-search"></span>查询</button>
						<button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-refresh"></span>重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 列表展示 -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">手机列表</h3>
		</div>
		<div class="panel-body" align="right">
			<button type="button" class="btn btn-primary" onclick="add()"><span class="glyphicon glyphicon-plus"></span>新增</button>
			<button type="button" class="btn btn-danger"  onclick="deleteBath()"><span class="glyphicon glyphicon-minus"></span>批量删除</button>
			
			<table class="table table-condensed table-hover table-bordered table-striped" id="myTable">
			</table>
		</div>
	</div>
	
	<!-- 添加页面-->
	<div id="addDiv" style="display: none">
		<form class="form-horizontal" role="form" method="post" id="addForm">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">角色名称</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="roleName">
						</div>
					</div>
					
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">是否禁用</label>
						<div class="col-sm-6">
							<div class="radio">
								<label class="radio-inline">
									<input type="radio" name="status" value="1"> 是
								</label>
								<label class="radio-inline">
									<input type="radio" name="status" value="2"> 否
								</label>
								
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">角色描述</label>
						<div class="col-sm-6">
							<textarea rows="3" cols="55" id="remark"></textarea>
						</div>
					</div>

					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>重置</button>
						</div>
					</div>
				</form>
	</div>
	
	<!--修改页面-->
	<div id="updateDiv" style="display: none">
		<form class="form-horizontal" role="form" method="post" id="updateForm">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">角色名称</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="roleName">
							<input type="text" class="form-control" id="roleId">
							<input type="text" class="form-control" id="createDate">
						</div>
					</div>
					
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">是否禁用</label>
						<div class="col-sm-6">
							<div class="radio">
								<label class="radio-inline">
									<input type="radio" name="status" value="1"> 是
								</label>
								<label class="radio-inline">
									<input type="radio" name="status" value="2"> 否
								</label>
								
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">角色描述</label>
						<div class="col-sm-6">
							<textarea rows="3" cols="55" id="remark"></textarea>
						</div>
					</div>
					


					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>重置</button>
						</div>
					</div>
				</form>
	</div>
	
</body>


<!-- 全局js -->
	<script type="text/javascript">
	$(function(){
		queryList();
		
		// 初始化添加页面
		initAddDiv = $("#addDiv").html();
		// 初始化修改页面
		initUpdateDiv = $("#updateDiv").html();
		
		// 初始化日期
		initDate("#addDiv #birthday");
		initDate("#updateDiv #birthday");
		
		initDate("#searchForm #d1");
		initDate("#searchForm #d2");
		
		initDate("#searchForm #c1");
		initDate("#searchForm #c2");
	
		initDate("#searchForm #u1");
		initDate("#searchForm #u2");
		
		// 初始化文件上传插件
		initFileInput("#addForm #images");
		initFileInput("#updateForm #images");
		
	})
	/* 页面刷新 */
	function search(){
		userTable.ajax.reload();
	}
	
	</script>

<!-- 新增JS -->
	<script type="text/javascript">
    //---------------------------------------------------新增
		function add(){

			bootbox.confirm({
				title:"新增学生信息",
				size:"large",
				message:$("#addDiv form"),

				callback:function(result){

					if(result){
						// 获取参数
						var param = {};
						param.roleName = $("#addForm #roleName").val();
						param.remark = $("#addForm #remark").val();
						param.status = $("#addForm [name='status']:checked").val();

						$.post({
							url:"<%=request.getContextPath()%>/RoleController/addRole",
							data:param,
							dataType:"json",
							success:function(result){
								if(result.success){
									bootbox.alert("添加成功");
									search();
								}
							},
							error:function(){
								bootbox.alert("添加失败！");
							}
						})
					}
					$("#addDiv").html(initAddDiv);

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

	<!-- 回显and修改 -->
	<script type="text/javascript">
	function update(roleId){
		// 回显
		$.post({
			url:"<%=request.getContextPath()%>/RoleController/queryById",
			data:{"roleId":roleId},
			dataType:"json",
			success:function(result){
                var result = result.role;
				$("#updateForm #roleId").val(result.roleId);
				$("#updateForm #roleName").val(result.roleName);
				$("#updateForm #remark").val(result.remark);
				$("#updateForm #createDate").val(datetimeFormat_2(result.createDate));
				$("#updateForm [name='status'][value='"+result.status+"']").prop("checked",true);



					// 弹出修改页面
		bootbox.confirm({
			size:"large",
			title:"<h4><b>修改</b></h4>",
			message:$("#updateDiv form"),
			
			callback:function(result){
				if(result){
					
					// 获取值
			var param = {};
			param.roleId = $("#updateForm #roleId").val();
			param.createDate = $("#updateForm #createDate").val();
			param.roleName = $("#updateForm #roleName").val();
			param.remark = $("#updateForm #remark").val();
			param.status = $("#updateForm [name='status']:checked").val();
			

			
			
					// 发送ajax进行修改
					$.post({
						data:param,
						url:"<%=request.getContextPath()%>/actionRole/addRole",
						dataType:"json",
						success:function(result){
							if(result.success){
								bootbox.alert("修改成功！");
								search();
							}
						},
						error:function(){
							bootbox.alert("修改失败！");
						}
						
					})
				}
				$("#updateDiv").html(initUpdateDiv);
				// 初始化日期
			},
			buttons:{
				confirm:{
					label:"提交",
					className:"btn-primary"
				},
				cancel:{
					label:"取消",
					className:"btn-danger"
				}
			}
			
		})

			},
			error:function(){
				bootbox.alert("回显失败！");
			}
		})
	}
	</script>

	<!-- 查询JS -->
	<script type="text/javascript">
	//查询
	var userTable;
	function queryList(){
		userTable = $("#myTable").DataTable({
			// 设置table表格中分页的样式
		    language: {
		        "sProcessing": "处理中...",
		        "sLengthMenu": "显示 _MENU_ 项结果",
		        "sZeroRecords": "没有匹配结果",
		        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
		        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
		        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
		        "sInfoPostFix": "",
		        "sSearch": "搜索:",
		        "sUrl": "",
		        "sEmptyTable": "表中数据为空",
		        "sLoadingRecords": "载入中...",
		        "sInfoThousands": ",",
		        "oPaginate": {
		            "sFirst": "首页",
		            "sPrevious": "上页",
		            "sNext": "下页",
		            "sLast": "末页"
		        },
		        "oAria": {
		            "sSortAscending": ": 以升序排列此列",
		            "sSortDescending": ": 以降序排列此列"
		        }
		    },
		    
		    // 设置其他配置功能
		    "serverSide":true, // 开启后台
		    "searching":false, // 关闭搜索框
		    "processing":true, // 是否显示正在处理的状态
		    "lengthMenu":[3,5,10], // 设置每页显示的条数
		 	// 禁用第一列排序
				columnDefs : [ {
	            targets : 0,
	            "orderable" : false
	        } ],
	        "order":[ [ 1, 'asc' ] ], 
	        
	        // 发送ajax
		    "ajax":{
		    	"type":"post",
		    	"url":"<%=request.getContextPath()%>/RoleController/queryRoleList",
		    	"data":function(data){
		    		//条件查询
		    		/*data.roleName = $("#searchForm #roleName").val();
		    		data.status = $("#searchForm [name='status']:checked").val();
		    		data.minCreateDate = $("#searchForm #c1").val();
		    		data.maxCreateDate = $("#searchForm #c2").val();
		    		data.minUpdateDate = $("#searchForm #u1").val();
		    		data.maxUpdateDate = $("#searchForm #u2").val(); */
		    		
		    		
		    	},
		    },
		    
		    // 渲染列表数据
		    "columns":[
				    	{"data":"roleId","title":'<input type="checkbox" class="btn btn-info btn-sm" onclick="qx(this)">',
		               		"render":function(data){
		               			return "<input value='"+data+"' type='checkbox' value = 'data'  name='check'/>";
		               		}
		               	},
		               	{"data":"roleName","title":"角色名称"},
		               	
		               	{"data":"status","title":"是否禁用",
		               		"render":function(data){
		               			if(data == 1){
		               				return data = "是";
		               			}else{
		               				return data = "否";
		               			}
		               		}
		               	},
		               	
		               	{"data":"remark","title":"角色描述"},
		               	{"data":"createDate","title":"创建日期",
		               		"render":function(data){
		               			return datetimeFormat_2(data);
		               		}	
		               	},
		               	{"data":"updateDate","title":"修改日期",
		               		"render":function(data){
		               			return datetimeFormat_2(data);
		               		}
		               	},
		               	{"data":"roleId","title":"操作",
		               		"render":function(data,b,c){
		               			var str = "";
		               			if(c.status == 1){
		               				str += '<button type="button" class="btn btn-success btn-sm" onclick="updateRoleStatus('+data+','+c.status+')"><span class="glyphicon glyphicon-ok-circle"></span>启用</button>';
								}else{
		               				str += '<button type="button" class="btn btn-warning btn-sm" onclick="updateRoleStatus('+data+','+c.status+')"><span class="glyphicon glyphicon-ban-circle"></span>禁用</button>';
								}
		               			return '<button type="button" class="btn btn-info btn-sm" onclick="update('+data+')"><span class="glyphicon glyphicon-pencil"></span>修改</button>'+
		               			'<button type="button" class="btn btn-danger btn-sm" onclick="deleteRole('+data+')"><span class="glyphicon glyphicon-pencil"></span>删除</button>' + str ;
		               		}	
		               	},
		               	
		               	
		               ]
		})

	}
	
	
	
	</script>
	
	<!-- 禁用and启用 -->
	<script type="text/javascript">
		function updateRoleStatus(roleId,status){
			$.post({
				url:"<%=request.getContextPath()%>/actionRole/updateRoleStatus",
				data:{"roleId":roleId},
				success:function(result){
						bootbox.alert(status==1?"启用成功！":"禁用成功！");
						search();
				},
				error:function(){
						bootbox.alert(status==1?"启用失败！":"禁用失败！");
				}
			})
		}
	</script>
	<!-- 删除 -->
	<script type="text/javascript">
	//全选
	function qx(obj){
		var arr = $("[name='check']");
		for (var i = 0; i < arr.length; i++) {
			arr[i].checked=obj.checked;
		}
	}


	
	//删除
	function deleteRole(roleId){
		// 判断该角色有没有被关联用户
		$.post({
				url:"<%=request.getContextPath()%>/actionRole/isRelevanceUser",
				data:{"roleId":roleId},
				success:function(result){
					if(result.exist){
						bootbox.alert("<h4>该角色已经被关联，无法删除！</h4>");
					}else{
						bootbox.confirm({
							title:"删除角色",
							size:"large",
							message:"您确定要删除吗？",
							callback:function(result){
								if(result){
									
									$.post({
										url:"<%=request.getContextPath()%>/actionRole/deleteRole",
										data:{"roleId":roleId},
										success:function(result){
												bootbox.alert("删除成功！");
												search();
										},
										error:function(){
											bootbox.alert("删除失败！");
										}
									})
								}
								
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
				},
				error:function(){
					bootbox.alert("删除失败！");
				}
			})
	}
		
	
	//批量删除
	function deleteBath(){
		var arr = $("[name='check']");
		var ids = [];
		for (var i = 0; i < arr.length; i++) {
			if (arr[i].checked) {
				ids.push(arr[i].value)
			}
		}
		
		if(ids.length <= 0){
			bootbox.alert("请选择要删除的数据！");
		}else{
			
			// 判断该角色有没有被关联用户
			$.post({
				url:"<%=request.getContextPath()%>/actionRole/isRelevanceUser",
					data:{"roleIds":ids.toString()},
					success:function(result){
						if(result.exist){
							bootbox.alert("<h4>该角色已经被关联，无法删除！</h4>");
						}else{
							bootbox.confirm({
								title:"删除用户",
								size:"large",
								message:"您确定要删除吗？",
								callback:function(result){
									if(result){
										
										$.post({
											url:"<%=request.getContextPath()%>/actionRole/deleteRole",
											data:{"roleId":ids.toString()},
											success:function(result){
													bootbox.alert("删除成功！");
													search();
											},
											error:function(){
												bootbox.alert("删除失败！");
											}
										})
									}
									
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
					}
			})
		}
		

		
	}

	
	
	</script>
	
	
	<!-- 其他 -->	
	<script type="text/javascript">
	/* 时间 */
	function initDate(id){
		
		$(id).datetimepicker({
			// 设置日期格式
			format: 'YYYY-MM-DD',
			
			// 语言设置为中文
			locale:"zh-CN",
			
			// 是否显示日期清除按钮
			showClear:true,
			
		});
	}

	//文件上传
	function initFileInput(id){
		$(id).fileinput({
			language:"zh",
	  			previewFileType:"image",//设置需要预览的文件类型
	  			uploadClass:"btn btn-danger", // 设置上传按钮的样式
	  			allowedFileTypes:["image","text","html"], // 设置支持上传的类型
	  			allowedFileExtensions:["jpg","gif","txt","pdf"], // 设置上传的后缀
	  			maxFileSize:1024*20, // 设置预览文件大小
	  			maxFileCount:5, // 设置上传的最大个数
	  			//设置上传文件的地址
	  			uploadUrl:"<%=request.getContextPath()%>/actionUser/uploadClo",
	  			// 上传图片需要传的值
	  			uploadExtraData:function(){
	  			}
		})
		
		// 上传图片的回调函数
		$(id).on("fileuploaded",function(event,data){ // data代表后台返回的值
			// 获取上传完图片后返回的值
			var map = data.response;
			// 判断图片上成功
			if(map.success){
				// 将上传收的图片名放到Input框中，这个Input框的name要跟实体类保持一致，这样后台就能接到新的文件名了
				$("#addForm #img").val($("#addForm #img").val()+map.newFileName+",");
				$("#updateForm #img").val($("#updateForm #img").val()+map.newFileName+",");
			}
		})
	}

	
	
	</script>
</html>




	