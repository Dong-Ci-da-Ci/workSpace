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
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-6" >
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">汽车名称</label>
								<div class="col-sm-10">
									<input type="text" name = "bookName" class="form-control" id="bookName" placeholder="请输⼊名字">
								</div>

							</div>
						</div>

						<div class="col-xs-6" >
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">汽车价格</label>
								<div class="col-sm-10">
									<div class="input-group">
										<input type="text" id = "minPrice" class="form-control">
										<span class="input-group-addon">--</span>
										<input type="text" id = "maxPrice" class="form-control">
									</div>
								</div>

							</div>
						</div>

					</div>



					<div class="row">
						<div class="col-xs-6" >
							<div class="form-group">
								<label  class="col-sm-2 control-label">汽车品牌</label>
								<div class="col-sm-10">
									<select class="form-control selectpicker" id="area">
										<option value="">===请选择===</option>
									</select>
								</div>

							</div>
						</div>
						<div class="col-sm-6">
							<label for="firstname" class="col-sm-2 control-label">出厂时间</label>
							<div class="col-sm-8">
								<div class="input-group">
									<input type="text" class="form-control" id="minDate">
									<span class="input-group-addon">至</span>
									<input type="text" class="form-control" id="maxDate">
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-6" >
							<div class="form-group">
								<label  class="col-sm-2 control-label">适合人群</label>
								<div class="col-sm-7">
									<label class="checkbox-inline">
										<input type="checkbox" name = "configure" id="configure" value="0">小孩
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name = "configure" id="configure" value="1"> 少年
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name = "configure" id="configure" value="2"> 青年
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name = "configure" id="configure" value="3"> 老年

									</label>
								</div>

							</div>
						</div>
						<div class="col-xs-6" >
							<div class="form-group">
								<label  class="col-sm-3 control-label">是否上市</label>
								<div class="col-sm-4">
									<div class="input-group">
										<label class="radio-inline">
											<input type="radio" name="isup" value="1"> 是
										</label>
										<label class="radio-inline">
											<input type="radio" name="isup" value="2"> 否
										</label>
									</div>
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
			<h3 class="panel-title">汽车列表</h3>
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
				<label for="firstname" class="col-sm-3 control-label">汽车名称</label>
				<div class="col-sm-4">
					<input type="text" id = "carName" class="form-control" name="bookName" placeholder="请输⼊名字">
				</div>
			</div>



			<div class="form-group">
				<label for="firstname" class="col-sm-3 control-label">汽车价格</label>
				<div class="col-sm-4">
					<input type="text" id = "carPrice" class="form-control" name="bookPrice" >
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-3 control-label">汽车简介</label>
				<div class="col-sm-4">
					<input type="text" id = "introduction" class="form-control" name="bookPrice" >
				</div>
			</div>




			<div class="form-group">
				<label  class="col-sm-3 control-label">是否上市</label>
				<div class="col-sm-4">
					<label class="radio-inline">
						<input type="radio" name = "isup" id="isup" value="1" checked>是
					</label>
					<label class="radio-inline">
						<input type="radio" name = "isup" id="isup" value="2" >否
					</label>
				</div>
			</div>


			<div class="form-group">
				<label  class="col-sm-3 control-label">适合人群</label>
				<div class="col-sm-5">
					<label class="checkbox-inline">
						<input type="checkbox" name = "configure" id="inlineCheckbox1" value="1">一键启动
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" name = "configure" id="inlineCheckbox2" value="2"> 座椅加热
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" name = "configure" id="inlineCheckbox3" value="3"> 车感平衡
					</label>
					<label class="checkbox-inline">
						<input type="checkbox" name = "configure" id="inlineCheckbox4" value="4"> 全景天窗

					</label>
				</div>

			</div>


			<div class="form-group">
				<label  class="col-sm-3 control-label">类型</label>
				<div class="col-sm-4">
					<select id="area" name = "brand.brandId" class="form-control selectpicker">
						<option value="-1">请选择</option>
					</select>
				</div>
			</div>


			<div class="form-group">
				<label for="firstname" class="col-sm-3 control-label">出厂日期</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="producedDate" name = "producedDate" autocomplete="off">
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
                <label for="firstname" class="col-sm-3 control-label">汽车名称</label>
                <div class="col-sm-4">
                    <input type="text" id = "carName" class="form-control" name="bookName" placeholder="请输⼊名字">
                </div>
            </div>



            <div class="form-group">
                <label for="firstname" class="col-sm-3 control-label">汽车价格</label>
                <div class="col-sm-4">
                    <input type="text" id = "carPrice" class="form-control" name="bookPrice" >
                    <input type="hidden" id = "carId" class="form-control" name="bookPrice" >
                </div>
            </div>

            <div class="form-group">
                <label for="firstname" class="col-sm-3 control-label">汽车简介</label>
                <div class="col-sm-4">
                    <input type="text" id = "introduction" class="form-control" name="bookPrice" >
                </div>
            </div>




            <div class="form-group">
                <label  class="col-sm-3 control-label">是否上市</label>
                <div class="col-sm-4">
                    <label class="radio-inline">
                        <input type="radio" name = "isup" id="isup" value="1" checked>是
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name = "isup" id="isup" value="2" >否
                    </label>
                </div>
            </div>


            <div class="form-group">
                <label  class="col-sm-3 control-label">适合人群</label>
                <div class="col-sm-5">
                    <label class="checkbox-inline">
                        <input type="checkbox" name = "configure" id="inlineCheckbox1" value="1">一键启动
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name = "configure" id="inlineCheckbox2" value="2"> 座椅加热
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name = "configure" id="inlineCheckbox3" value="3"> 车感平衡
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name = "configure" id="inlineCheckbox4" value="4"> 全景天窗

                    </label>
                </div>

            </div>


            <div class="form-group">
                <label  class="col-sm-3 control-label">类型</label>
                <div class="col-sm-4">
                    <select id="area" name = "brand.brandId" class="form-control selectpicker">
                        <option value="-1">请选择</option>
                    </select>
                </div>
            </div>


			<div class="form-group">
				<label for="firstname" class="col-sm-3 control-label">出厂日期</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="producedDate" name = "producedDate" autocomplete="off">
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
		initDate("#addDiv #producedDate");
		initDate("#updateDiv #producedDate");
		
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
			url:"<%=request.getContextPath()%>/actionCar/queryById",
			data:{"carId":id},
			dataType:"json",
			success:function(result){
				$("#updateForm #carId").val(result.carId);
				$("#updateForm #carName").val(result.carName);

                $("#updateForm #introduction").val(result.introduction);
                $("#updateForm #carPrice").val(result.carPrice);
                $("#updateForm #producedDate").val(result.producedDate);
                // 回显下拉列表框
                for (var i = 0; i < areaList.length; i++) {
                    $("#updateForm #area").append("<option value='"+areaList[i].brandId+"' "+(areaList[i].brandId==result.brand.brandId?"selected":"")+">"+areaList[i].brandName+"</option>");
                }
                $("#updateForm #area").selectpicker("refresh");
                // 回显单选按钮
                $("#updateForm [name='isup'][value='"+result.isup+"']").prop("checked",true);
                // 回显复选框
                var arr = $("#updateForm [name='configure']"); // 获取复选框
                var confif = result.configure; // 获取数据库中的值 1,2
                arr.each(function(a,b){
                    if(confif.indexOf(b.value) != -1){
                        b.checked = true;
                    }
                })



				// 弹出修改页面
				bootbox.confirm({
					size:"large",
					title:"<h4><b>修改手机</b></h4>",
					message:$("#updateDiv form"),
					
					callback:function(result){
						if(result){
							
					// 获取值
                            var arr = $("#updateForm [name='configure']:checked");
                            var configure = [];
                            for (var i = 0; i < arr.length; i++) {
                                configure.push(arr[i].value);
                            }

                            // 获取参数
                            var param = {};
                            param.carId = $("#updateForm #carId").val();
                            param.carName = $("#updateForm #carName").val();
                            param.carPrice = $("#updateForm #carPrice").val();
                            param.introduction = $("#updateForm #introduction").val();

                            param["brand.brandId"] = $("#updateForm #area").val();
                            var arr = $("#updateForm [name='configure']:checked");
                            var configure = [];
                            for (var i = 0; i < arr.length; i++) {
                                configure.push(arr[i].value);
                            }
                            param.configure = configure.toString();
                            param.isup = $("#updateForm [name='isup']:checked").val();

                            param.producedDate = $("#updateForm #producedDate").val();


                            // 发送ajax进行修改
							$.post({
								data:param,
                                url:"<%=request.getContextPath()%>/actionCar/addCar",
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
						initDate("#updateDiv #producedDate");
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

                    // 获取参数
                    var param = {};
                    param.carName = $("#addForm #carName").val();
                    param.carPrice = $("#addForm #carPrice").val();
                    param.introduction = $("#addForm #introduction").val();

                    param["brand.brandId"] = $("#addForm #area").val();
                    var arr = $("#addForm [name='configure']:checked");
                    var configure = [];
                    for (var i = 0; i < arr.length; i++) {
                        configure.push(arr[i].value);
                    }
                    param.configure = configure.toString();
                    param.isup = $("#addForm [name='isup']:checked").val();

                    param.producedDate = $("#addForm #producedDate").val();

                    $.post({
                        url:"<%=request.getContextPath()%>/actionCar/addCar",
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
                initDate("#addDiv #producedDate");
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
		    	"url":"<%=request.getContextPath()%>/actionCar/queryList",
		    	"data":function(data){
                    //条件查询
                    data.name = $("#bookName").val();
                    data.minPrice = $("#minPrice").val();
                    data.maxPrice = $("#maxPrice").val();
                    data.minDate = $("#minDate").val();
                    data.maxDate = $("#maxDate").val();
                    data.person = $("[name='configure']:checked").val();
                    data.isup = $("[name='isup']:checked").val();
                    data.type=$("#searchForm #area").val();


		    	},
		    },

            // 渲染列表数据
            "columns":[
                {"data":"carId","title":'<input type="checkbox" class="btn btn-info btn-sm" onclick="qx(this)">',
                    "render":function(data){
                        return "<input value='"+data+"' type='checkbox' value = 'data'  name='check'/>";
                    }
                },
                {"data":"carName","title":"汽车名称"},
                {"data":"carPrice","title":"汽车价格"},
                {"data":"introduction","title":"汽车简介"},
                {"data":"brand.brandName","title":"汽车品牌"},
                {"data":"isup","title":"是否上架",
                    "render":function(data){
                        if(data == 1){
                            return data = "是";
                        }else {
                            return data = "否";
                        }
                    }
                },
                {"data":"configure","title":"适合人群",
                    "render":function(data){
                        if(data != null){
                            return data.replace("1","少").replace("2","青").replace("3","中").replace("4","老");
                        }
                        return null;
                    }
                },
                {"data":"producedDate","title":"出版日期"},
                {"data":"updateDate","title":"修改日期"},
                {"data":"carId","title":"操作",
                    "render":function(data){
                        return '<button type="button" class="btn btn-info btn-sm" onclick="update('+data+')"><span class="glyphicon glyphicon-pencil"></span>修改</button>'+
                            '<button type="button" class="btn btn-danger btn-sm" onclick="deleteCar('+data+')"><span class="glyphicon glyphicon-pencil"></span>删除</button>';
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
	function deleteCar(data){
		bootbox.confirm({
			title:"删除提示",
			message:"您确定要删除吗？",
			callback:function(result){
	
				if(result){
					$.post({
						data:{"ids":data.toString()},
                        url:"<%=request.getContextPath()%>/actionCar/allDelete",
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
            url:"<%=request.getContextPath()%>/actionCar/allDelete",
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
			url:"<%=request.getContextPath()%>/actionCar/queryPullDownList",
			dataType:"json",
			success:function(result){
				areaList = result; // 将查询到的地区列表放到areaList中
				for (var i = 0; i < result.length; i++) {
					$("#addDiv #area").append("<option value='"+result[i].brandId+"'>"+result[i].brandName+"</option>");
				}
				for (var i = 0; i < result.length; i++) {
					$("#searchForm #area").append("<option value='"+result[i].brandId+"'>"+result[i].brandName+"</option>");
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
	  			uploadUrl:"<%=request.getContextPath()%>/actionBook/upload",
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




	