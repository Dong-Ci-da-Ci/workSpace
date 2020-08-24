<%--
  Created by IntelliJ IDEA.
  User: 87112
  Date: 2020/2/23
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>属性管理</title>
    <jsp:include page="../../common/js-url.jsp"></jsp:include>

</head>
<body>


<!-- 展示页面 -->
<div class="col-lg-2">
    <div class="panel panel-primary" style="height: 95%">
        <div class="panel-heading">
            <h3 class="panel-title">分类列表</h3>
        </div>
        <div class="panel-body">
            <div>
                <ul id="classify" class="ztree"></ul>
            </div>
        </div>
    </div>
</div>
<!-- 展示页面 -->
<div class="col-lg-10">
<div class="panel panel-primary" id="attributePanel" style="display: none;height: 95%">
    <div class="panel-heading">
        <h3 class="panel-title">属性列表</h3>
    </div>

    <div class="panel-body">
        <button type="button" class="btn btn-primary" onclick="attributeAddPage()"><span
                class="glyphicon glyphicon-plus"></span>新增
        </button>
        <button type="button" class="btn btn-danger" onclick="deleteBathBook()"><span
                class="glyphicon glyphicon-minus"></span>批量删除
        </button>
        <table class="table table-condensed table-hover table-bordered table-striped" id="myTable"></table>
    </div>
</div>
</div>
<!-- 添加页面 -->
<div id="addDiv" style="display: none">
    <form class="form-horizontal" role="form" method="post" id="addForm">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">属性名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="name">
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">类型</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="type" value="1"> spu属性(关键属性)
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="type" value="2"> sku属性(销售属性)
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">属性录入方式</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="inputType" value="1"> 手动输入
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="inputType" value="2"> 从可选项中选择
                    </label>
                </div>
            </div>
        </div>


        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">选择方式</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="selectType" value="1"> 输入框
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="selectType" value="2"> 单选按钮
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="selectType" value="3"> 复选框
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="selectType" value="4"> 下拉列表
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">是否允许扩展属性值</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="addAble" value="1"> 允许
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="addAble" value="2"> 不允许
                    </label>
                </div>
            </div>
        </div>


    </form>
</div>

<!-- 修改页面 -->
<div id="updateDiv" style="display: none">
    <form class="form-horizontal" role="form" method="post" id="updateForm">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">属性名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="name">
                <input type="text" class="form-control" id="id">
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">类型</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="type" value="1"> spu属性
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="type" value="2"> sku属性
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">属性录入方式</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="inputType" value="1"> 手动输入
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="inputType" value="2"> 从可选项中选择
                    </label>
                </div>
            </div>
        </div>


        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">选择方式</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="selectType" value="1"> 输入框
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="selectType" value="2"> 单选按钮
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="selectType" value="3"> 复选框
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="selectType" value="4"> 下拉列表
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">是否允许扩展属性值</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="addAble" value="1"> 允许
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="addAble" value="2"> 不允许
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="reset" class="btn btn-danger" onclick="aaa()"><span
                        class="glyphicon glyphicon-remove"></span>重置
                </button>
            </div>
        </div>
    </form>
</div>


</body>
<%----------------------------------------分割线----------------------------------------------%>
<script>

    // 页面加载函数
    $(function () {
        //queryAttributeList();

        // 加载新增页面
        addDivHTML = $("#addDiv").html();
        // 修改新增页面
        updateDivHTML = $("#updateDiv").html();

        initZtree();
    })

    //刷新页面
    function search() {
        attributeTable.ajax.reload();
    }

    var attributeTable;

    // 列表展示
    function queryAttributeList() {
        attributeTable = $("#myTable").DataTable({
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
            "serverSide": true, // 开启后台
            "searching": false, // 关闭搜索框
            "processing": true, // 是否显示正在处理的状态
            "lengthMenu": [3, 5, 10], // 设置每页显示的条数
            // 禁用第一列排序
            columnDefs: [{
                targets: 0,
                "orderable": false
            }],
            "order": [[1, 'asc']],

            // 发送ajax
            "ajax": {
                "type": "post",
                "url": "<%=request.getContextPath()%>/attributeController/queryAttributeList",
                "data": function (data) {
                    //条件查询
                    data.categoryId = zTreeObj.getSelectedNodes()[0].id;

                },
            },

            // 渲染列表数据
            "columns": [
                {
                    "data": "id", "title": '<input type="checkbox" class="btn btn-info btn-sm" onclick="qx(this)">',
                    "render": function (data) {
                        return "<input value='" + data + "' type='checkbox' value = 'data'  name='check'/>";
                    }
                },
                {"data": "name", "title": "汽车名称"},
                {
                    "data": "type",
                    "render": function (data) {
                        if (data == 1) {
                            return data = "spu属性";
                        } else {
                            return data = "sku属性";
                        }
                    },
                    "title": "汽车名称"
                },
                {
                    "data": "inputType",
                    "render": function (data) {
                        if (data == 1) {
                            return data = "手动输入";
                        } else {
                            return data = "从可选项中选择";
                        }
                    },
                    "title": "属性录入方式"
                },
                {
                    "data": "selectType",
                    "render": function (data) {
                        if (data == 1) {
                            return data = "输入框";
                        } else if (data == 2) {
                            return data = "单选按钮";
                        } else if (data == 3) {
                            return data = "复选框";
                        } else {
                            return data = "下拉列表";
                        }

                    },
                    "title": "选择方式"
                },
                {
                    "data": "addAble",
                    "render": function (data) {
                        if (data == 1) {
                            return data = "允许";
                        } else {
                            return data = "不允许";
                        }
                    },
                    "title": "是否允许扩展属性值"
                },
                {
                    "data": "id", "title": "操作",
                    "render": function (data) {
                        return '<button type="button" class="btn btn-info btn-sm" onclick="update(' + data + ')"><span class="glyphicon glyphicon-pencil"></span>修改</button>' +
                            '<button type="button" class="btn btn-danger btn-sm" onclick="deleteAttribute(' + data + ')"><span class="glyphicon glyphicon-pencil"></span>删除</button>';
                    }
                },

            ]
        })

    }

    // 初始化ztree树
    function initZtree(){
        $.post({
            url:"<%=request.getContextPath()%>/ClassifyController/queryClassifyList",
            dataType:"json",
            success:function(result){
                if(result.success){
                    // 将根节点默认展开
                    result.classifyList[0].open = true;

                    // 第一个参数代表ul的id
                    // 第二个参数代表全局设置
                    // 第三个删除代表节点数据
                    zTreeObj = $.fn.zTree.init($("#classify"),setting,result.classifyList);
                }
            },
            error:function(){
                bootbox.alert("加载分类列表失败！");
            }
        })
    }

    // 添加
    function attributeAddPage() {

        bootbox.confirm({
            title: "新增属性",
            size: "large",
            message: $("#addDiv form"),
            buttons: {
                confirm: {
                    label: "确认"
                },
                cancel: {
                    label: "取消",
                    className: "btn btn-danger"
                }
            },
            callback: function (result) {
                //如果点击了确认按钮
                if (result) {
                    var param = {};
                    //获取新增药品表单中的数据
                    param.name = $("#addForm #name").val();
                    param.type = $("#addForm [name=type]:checked").val();
                    param.inputType = $("#addForm [name=inputType]:checked").val();
                    param.addAble = $("#addForm [name=addAble]:checked").val();
                    param.selectType = $("#addForm [name=selectType]:checked").val();
                    //获取点击zTree的id
                    param.categoryId = zTreeObj.getSelectedNodes()[0].id;

                    //发起一个新增图书的ajax请求
                    $.ajax({
                        url: "<%=request.getContextPath()%>/attributeController/addAttribute",
                        type: "post",
                        data: param,
                        dataType: "json",
                        success: function (result) {
                            if (result.success) {
                                bootbox.alert("添加成功！");
                                //重新加载表格中的数据
                                search();
                            } else {
                                alert("新增属性失败!");
                            }
                        },
                        error: function () {
                            alert("新增属性失败!");
                        }
                    });
                }
                $("#addDiv").html(addDivHTML);
            }
        });
    }


    // 修改
    function update(id) {
        // 回显
        $.post({
            url: "<%=request.getContextPath()%>/attributeController/queryAttributeById",
            data: {"id": id},
            dataType: "json",
            success: function (result) {
                if (result.success) {
                    var attribute = result.attribute;
                    $("#updateForm #id").val(attribute.id);
                    $("#updateForm #name").val(attribute.name);
                    $("#updateForm [name=type][value='" + attribute.type + "']").prop("checked", true);
                    $("#updateForm [name=inputType][value='" + attribute.inputType + "']").prop("checked", true);
                    $("#updateForm [name=addAble][value='" + attribute.addAble + "']").prop("checked", true);
                    $("#updateForm [name=selectType][value='" + attribute.selectType + "']").prop("checked", true);

                    bootbox.confirm({
                        title: "修改图书",
                        size: "large",
                        message: $("#updateDiv").children(),
                        buttons: {
                            confirm: {
                                label: "确认"
                            },
                            cancel: {
                                label: "取消",
                                className: "btn btn-danger"
                            }
                        },
                        callback: function (result) {
                            //如果点击了确认按钮
                            if (result) {
                                var param = {};
                                //获取新增药品表单中的数据
                                param.id = $("#updateForm #id").val();
                                param.name = $("#updateForm #name").val();
                                param.type = $("#updateForm [name=type]:checked").val();
                                param.inputType = $("#updateForm [name=inputType]:checked").val();
                                param.addAble = $("#updateForm [name=addAble]:checked").val();
                                param.selectType = $("#updateForm [name=selectType]:checked").val();


                                //发起一个新增图书的ajax请求
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/attributeController/updateAttribute",
                                    type: "post",
                                    data: param,
                                    dataType: "json",
                                    success: function (result) {
                                        if (result.success) {
                                            bootbox.alert("修改成功！");
                                            //重新加载表格中的数据
                                            search();
                                        } else {
                                            alert("修改图书失败!");
                                        }
                                    },
                                    error: function () {
                                        alert("修改图书失败!");
                                    }
                                });
                            }
                            $("#updateDiv").html(updateDivHTML);
                        }
                    });
                }
            },
            error: function () {
                bootbox.alert("回显失败！");
            }

        })
    }

    // 删除、
    function deleteAttribute(id) {
        bootbox.confirm({
            title: "删除属性",
            size: "large",
            message: "您确定要删除吗？",
            buttons: {
                confirm: {
                    label: "确认"
                },
                cancel: {
                    label: "取消",
                    className: "btn btn-danger"
                }
            },
            callback: function (result) {
                //如果点击了确认按钮
                if (result) {
                    //发起一个删除图书的ajax请求
                    $.ajax({
                        url: "<%=request.getContextPath()%>/attributeController/deleteAttribute",
                        type: "post",
                        data: {"id": id},
                        dataType: "json",
                        success: function (result) {
                            if (result.success) {
                                bootbox.alert("删除成功！");
                                //重新加载表格中的数据
                                search();
                            } else {
                                alert("删除属性失败!");
                            }
                        },
                        error: function () {
                            alert("删除属性失败!");
                        }
                    });
                }
            }
        });
    }

    //分类展示
    var zTreeObj;
    // 属性配置
    var setting = {
        data:{
            simpleData:{
                enable:true,  // 是否使用简单数据模式
                idKey:"id",   // 子节点的唯一标识
                pIdKey:"pId", // 父节点的唯一标识

            }
        },
        callback:{
            onClick:function(event,treeId,zTreeObj,clickFlag){
                if(zTreeObj.isParent){
                    $("#attributePanel").hide();
                }else{
                    $("#attributePanel").show();
                    if(attributeTable == undefined){
                        queryAttributeList();
                    }else{
                        attributeTable.ajax.reload();
                    }
                }
            }
        },
        check:{
            enable:true
        }

    };





</script>
</html>
