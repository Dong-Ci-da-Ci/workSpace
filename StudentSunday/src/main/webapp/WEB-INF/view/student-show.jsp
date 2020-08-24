<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="common/js-url.jsp"></jsp:include>
</head>
<body>

<jsp:include page="common/nav.jsp"></jsp:include>
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
							<label  class="col-sm-2 control-label">学生名称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="name">
							</div>
						</div>
						<div class="col-sm-6">
						<label  class="col-sm-2 control-label">学生年龄</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="age">
						</div>
					</div>
						
					</div>
				</div>
				
				
				
				<div class="form-group">
					<div class="row">
					<div class="col-sm-6">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-8">
								<div class="input-group"> 
									<label class="radio-inline">
										<input type="radio" name="sex" value="1"> 是
									</label>
									<label class="radio-inline">
										<input type="radio" name="sex" value="2"> 否
									</label>
								</div>
							</div>
							
						</div>
						
						<div class="col-sm-6">
							<div class="col-sm-6">
								<label  class="col-sm-2 control-label">地区</label>
								<div class="col-sm-8">
									<div class="input-group">
										<select class="form-control selectpicker" id="area">
											<option value="">===请选择===</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-sm-6">
							<label  class="col-sm-2 control-label">年龄</label>
							<div class="col-sm-8">
								<div class="input-group"> 
									<input type="text" class="form-control" id="minPrice"> 
									<span class="input-group-addon">到</span> 
									<input type="text" class="form-control" id="maxPrice">
								</div>
							</div>
						</div>

					</div>
				</div>

				
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-primary" onclick="search()"><span class="glyphicon glyphicon-search"></span>查询</button>
						<button type="reset" class="btn btn-danger"><span class="glyphicon glyphicon-refresh"></span>重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 列表展示 -->
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<h3 class="panel-title">手机列表</h3>
		</div>
		<div class="panel-body">
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
						<label  class="col-sm-2 control-label">学生名称</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  name = "name">
						</div>
					</div>
					
					<div class="form-group">
						<label  class="col-sm-2 control-label">学生年龄</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  name = "age">
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  name = "phoneNumber">
						</div>
					</div>


					
					
					<div class="form-group">
						<label  class="col-sm-2 control-label">性别</label>
						<div class="col-sm-6">
							<div class="radio">
								<label class="radio-inline">
									<input type="radio" name="sex" value="1"> 是
								</label>
								<label class="radio-inline">
									<input type="radio" name="sex" value="2"> 否
								</label>
								
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">地区</label>
						<div class="col-sm-6">
							<select class="form-control selectpicker" id="area" name = "stuArea.areaId">
								<option value="">===请选择===</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label  class="col-sm-2 control-label">电子邮件</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  name = "email"  autocomplete="off">
						</div>
					</div>
					
					<div class="form-group">
						<label  class="col-sm-2 control-label">图片</label>
						<div class="col-sm-6">
							<input id="img" name="stuImg" class="form-control" type="hidden"/>
							<input type="file" id = "images" name="images" multiple class="form-control"/>
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
			<label  class="col-sm-2 control-label">学生名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="name">
			</div>
			</div>

			<div class="form-group">
				<label  class="col-sm-2 control-label">学生年龄</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="age">
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label">手机号</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="phoneNumber">
					<input type="hidden" class="form-control" id="id">
				</div>
			</div>

			<div class="form-group">
				<label  class="col-sm-2 control-label">性别</label>
				<div class="col-sm-6">
					<div class="radio">
						<label class="radio-inline">
							<input type="radio" name="sex" value="1"> 是
						</label>
						<label class="radio-inline">
							<input type="radio" name="sex" value="2"> 否
						</label>

					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">地区</label>
				<div class="col-sm-6">
					<select class="form-control selectpicker" id="area">
						<option value="">===请选择===</option>
					</select>
				</div>
			</div>


			<div class="form-group">
				<label  class="col-sm-2 control-label">图片展示</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="oldFileName" autocomplete="off">
					<div id="myDiv"></div>
				</div>
			</div>

			<div class="form-group">
				<label  class="col-sm-2 control-label">头像</label>
				<div class="col-sm-6">
					<input id="img" name="fileName" class="form-control" type="hidden"/>
					<input type="file" id="images" name="images" multiple class="form-control"/>
				</div>
			</div>




		</form>
	</div>
	
	
	
	
</body>


<!-- 全局js -->
	<script type="text/javascript">
	$(function(){
		queryCloList();
		
		// 初始化添加页面
		initAddDiv = $("#addDiv").html();

		// 初始化修改页面
		initUpdateDiv = $("#updateDiv").html();
		attachmentDiv = $("#attachmentDiv").html();
		
		//初始化地区
		queryareaList();



		// 初始化日期
		initDate("#addDiv #showTime");
		initDate("#updateDiv #showTime");
		
		initDate("#searchForm #maxDate");
		initDate("#searchForm #minDate");
		
		
		
		// 初始化文件上传插件
		initFileInput("#addForm #images");
		initFileInput("#updateForm #images");
		
	}) 
	/* 页面刷新 */
	function search(){
		userTable.ajax.reload();
	}
	
	</script>
	
	
	
	
	<!-- 回显and修改 -->
	<script type="text/javascript">
	function update(id){
		// 回显
		$.post({
			url:"<%=request.getContextPath()%>/actionSudent/queryById",
			data:{"id":id},
			dataType:"json",
			success:function(result){
				$("#updateForm #id").val(result.id);
				$("#updateForm #name").val(result.name);
				$("#updateForm #age").val(result.age);
				$("#updateForm #phoneNumber").val(result.phoneNumber);
				$("#updateForm #email").val(result.email);
				$("#updateForm [name='sex'][value='"+result.sex+"']").prop("checked",true);
				
			
				// 回显下拉列表框
				for (var i = 0; i < areaList.length; i++) {
					$("#updateForm #area").append("<option value='"+areaList[i].areaId+"' "+(areaList[i].areaId==result.stuArea.areaId?"selected":"")+">"+areaList[i].areaName+"</option>");
				}
				$("#updateForm #area").selectpicker("refresh");
				// 回显图片
				// 分隔后台查询出的图片名
				var fileNameArr = result.stuImg.split(",");
				var str = "";
				for(var i=0; i<fileNameArr.length-1; i++){
					str += "<img src='<%=request.getContextPath()%>/images/"+fileNameArr[i]+"' width='100px'/>";
				}
				$("#updateForm #myDiv").append(str);
				// 回显图片名
				$("#updateForm #oldFileName").val(result.fileName);
				
				
			
				
				
				// 弹出修改页面
				bootbox.confirm({
					size:"large",
					title:"<h4><b>修改手机</b></h4>",
					message:$("#updateDiv form"),
					
					callback:function(result){
						if(result){
							
					// 获取值
					var param = {};
                            var param = {};
                            param.id = $("#updateForm #id").val();
                            param.name = $("#updateForm #name").val();
                            param.age = $("#updateForm #age").val();
                            param.phoneNumber = $("#updateForm #phoneNumber").val();
                            param.email = $("#updateForm #email").val();
                            param["stuArea.areaId"] = $("#updateForm #area").val();
                            param.sex = $("#updateForm [name='sex']:checked").val();
                            param.stuImg = $("#updateForm #img").val();
					
							
							
							
							// 发送ajax进行修改
							$.post({
								data:param,
                                url:"<%=request.getContextPath()%>/actionSudent/addStudent",
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
						initDate("#updateDiv #showTime");
						initFileInput("#updateForm #images");
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

					$.post({
						url:"<%=request.getContextPath()%>/actionSudent/addStudent",
						data:$("addForm").serialize(),
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
				 initFileInput("#addForm #images");
				 initDate("#addDiv #showTime");
				 queryareaList();
				
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
	
	
	<!-- 查询JS -->
	<script type="text/javascript">
	//查询
	function queryCloList(){
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
		    	"url":"<%=request.getContextPath()%>/actionSudent/queryList",
		    	"data":function(data){
		    		//条件查询
		    		data.name = $("#searchForm #name").val();
		    		 data.num = $("#searchForm #phoneNumber").val();
		    		data.status = $("#searchForm [name='sex']:checked").val();

		    		data.minPrice = $("#minPrice").val();
		    		data.maxPrice = $("#maxPrice").val();
		    		data.area = $("#area").val();

		    		
		    		
		    		
		    	},
		    },
		    
		    // 渲染列表数据
		    "columns":[
				    	{"data":"id","title":'<input type="checkbox" class="btn btn-info btn-sm" onclick="qx(this)">',
		               		"render":function(data){
		               			return "<input value='"+data+"' type='checkbox' value = 'data'  name='check'/>";
		               		}
		               	},
		            	{"data":"name","title":"名称"},
		            	{"data":"age","title":"年龄"},
		               	{"data":"phoneNumber","title":"手机号"},
		               	{"data":"email","title":"电子邮箱"},
		               	{"data":"stuArea.areaName","title":"地区"},
		               	{"data":"sex","title":"性别",
		               		"render":function(data){
		               			if(data == 1){
		               				return data = "是";
		               			}else{
		               				return data = "否";
		               			}
		               		}
		               	},

						{"data":"stuImg","title":"图片",
							"render":function(data){
								if(data != null){
									var arr = data.split(",");
									var str = "";

									for (var i = 0; i < arr.length-1; i++) {
										str+="<img src='<%=request.getContextPath()%>/images/"+arr[i]+"' width='100px'/> ";

									}
									return str;
								}
								return null;
							}
						},
		               {"data":"id","title":"操作",
		               		"render":function(data){
		               			return '<button type="button" class="btn btn-info btn-sm" onclick="update('+data+')"><span class="glyphicon glyphicon-pencil"></span>修改</button>'+
		               			'<button type="button" class="btn btn-danger btn-sm" onclick="deleteUser('+data+')"><span class="glyphicon glyphicon-pencil"></span>删除</button>';

		               		}	
		               	},
		               ]
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
	function deleteUser(data){
		bootbox.confirm({
			title:"删除提示",
			message:"您确定要删除吗？",
			callback:function(result){
	
				if(result){
					$.post({
						data:{"ids":data.toString()},
                        url:"<%=request.getContextPath()%>/actionSudent/allDelete",
						success:function(result){
							search();
							bootbox.alert("删除成功！");
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
					className:"btn-primary"
				},
				cancel:{
					label:"取消",
					className:"btn-danger"
				}
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

		var a = confirm("你确定要删除 "+ids.length+" 条数据吗")

		if(!a){
			return;
		}
		$.post({
			data:{
				"ids":ids.toString()
			},
			url:"<%=request.getContextPath()%>/actionSudent/allDelete",
			success:function(){
				search();
				bootbox.alert("删除成功！！！");
			},
			error:function(){
				alert("删除失败");
			}
			
		}) 
	}
	
	
	
	</script>
	
	<!-- 查询地区 -->
	<script type="text/javascript">
	var areaList;
	function queryareaList(){
		$.post({
			url:"<%=request.getContextPath()%>/actionSudent/queryPullDownList",
			dataType:"json",
			success:function(result){
				areaList = result; // 将查询到的地区列表放到areaList中
				for (var i = 0; i < result.length; i++) {
					$("#addDiv #area").append("<option value='"+result[i].areaId+"'>"+result[i].areaName+"</option>");
				}
				for (var i = 0; i < result.length; i++) {
					$("#searchForm #area").append("<option value='"+result[i].areaId+"'>"+result[i].areaName+"</option>");
				}
				$("#addDiv #area").selectpicker("refresh");
				$("#searchForm #area").selectpicker("refresh");
			},
			error:function(){
				bootbox.alert("加载班级列表失败！");
			}
		})
	}
	</script>




	
	<!-- 其他 -->	
	<script type="text/javascript">
	/* 时间 */
	function initDate(id){
		$(id).datetimepicker({
			// 设置日期格式
			format: 'YYYY-MM-DD ',
			
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
	  			uploadUrl:"<%=request.getContextPath()%>/actionSudent/upload",
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




	