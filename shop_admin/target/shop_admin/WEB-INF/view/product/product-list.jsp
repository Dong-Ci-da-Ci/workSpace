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
    <title>商品管理</title>
    <jsp:include page="../../common/js-url.jsp"></jsp:include>

</head>
<body>



<!-- 展示页面 -->
    <div class="panel panel-primary" >
        <div class="panel-heading">
            <h3 class="panel-title">商品列表</h3>
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

<!-- 添加页面 -->
<div id="addDiv" style="display: none">
    <form class="form-horizontal" role="form" method="post" id="addForm">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="addName">
            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品价格</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="addPrice">
            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品标题</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="addTitle">
            </div>
        </div>



        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品品牌</label>
            <div class="col-sm-6">
                <select class="form-control" id="addBrandSelect">
                    <option value="-1">===请选择===</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品描述</label>
            <div class="col-sm-6">
                <textarea class="form-control" rows="5" id="addRemark"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">是否热销产品</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="addIsHot" value="1"> 是
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="addIsHot" value="2"> 否
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">是否上架</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="addStatus" value="1"> 是
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="addStatus" value="2"> 否
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品分类</label>
            <div class="col-sm-7" id="addClassifyDiv">
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">SPU（商品关键属性）</label>
            <div class="col-sm-6" id="addSpuAttributeDiv">

            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">SKU（商品销售属性）</label>
            <div class="col-sm-6" id="addSkuAttributeDiv">

            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label"></label>
            <div class="col-sm-8" id="addSkuTableDiv">

            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">图片</label>
            <div class="col-sm-6">
                <input id="img" name="avatarPath" class="form-control" type="hidden"/>

                <%--这个image是图片插件的Id，可以用来初始化图片插件--%>
                <input type="file" id="images" name="images" multiple class="form-control"/>
            </div>
        </div>



    </form>
</div>

<!-- 修改页面 -->
<div id="updateDiv" style="display: none">
    <form class="form-horizontal" role="form" method="post" id="updateForm">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="updateName">
                <input type="text" class="form-control" id="id">
            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品价格</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="updatePrice">
            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品标题</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="updateTitle">
            </div>
        </div>



        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品品牌</label>
            <div class="col-sm-6">
                <select class="form-control" id="updateBrandSelect">
                    <option value="-1">===请选择===</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品描述</label>
            <div class="col-sm-6">
                <textarea class="form-control" rows="5" id="updateRemark"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">是否热销产品</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="updateIsHot" value="1"> 是
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="updateIsHot" value="2"> 否
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">是否上架</label>
            <div class="col-sm-6">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="updateStatus" value="1"> 是
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="updateStatus" value="2"> 否
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">商品分类</label>
            <div class="col-sm-7" id="updateClassifyDiv">
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">SPU（商品关键属性）</label>
            <div class="col-sm-6" id="updateSpuAttributeDiv">

            </div>
        </div>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">SKU（商品销售属性）</label>
            <div class="col-sm-6" id="updateSkuAttributeDiv">

            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label"></label>
            <div class="col-sm-8" id="updateSkuTableDiv">

            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">图片展示</label>
            <div class="col-sm-6">
                <input type="hidden" class="form-control" id="oldFileName" autocomplete="off">
                <div id="myDiv"></div>
            </div>
        </div>

        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">图片</label>
            <div class="col-sm-6">
                <input id="img" name="avatarPath" class="form-control" type="hidden"/>

                <%--这个image是图片插件的Id，可以用来初始化图片插件--%>
                <input type="file" id="images" name="images" multiple class="form-control"/>
            </div>
        </div>
    </form>
</div>


</body>
<%----------------------------------------分割线----------------------------------------------%>
<script>

    // 页面加载函数
    $(function () {
        queryAttributeList();

        // 加载新增页面
        addDivHTML = $("#addDiv").html();
        // 修改新增页面
        updateDivHTML = $("#updateDiv").html();

        // 初始化文件上传插件
        initFileInput("#addForm #images");
        initFileInput("#updateForm #images");

        // 初始商品品牌
        querybrandList();


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
                "url": "<%=request.getContextPath()%>/ProductController/queryProductList",
                "data": function (data) {

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
                {"data": "name", "title": "商品名称"},
                {"data": "title", "title": "商品标题"},
                {"data": "price", "title": "商品价格"},
                {"data": "remark", "title": "商品评论"},

                {"data":"mainImage","title":"图片",
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


                {"data": "brandId", "title": "商品商标"},
                {
                    "data": "isHot",
                    "render": function (data) {
                        if (data == 1) {
                            return data = "是";
                        } else {
                            return data = "否";
                        }
                    },
                    "title": "是否上架"
                },
                {
                    "data": "status",
                    "render": function (data) {
                        if (data == 1) {
                            return data = "状态1";
                        } else {
                            return data = "状态2";
                        }
                    },
                    "title": "状态"
                },
                {"data": "classifyId1", "title": "商品分类1"},
                {"data": "classifyId2", "title": "商品分类2"},
                {"data": "classifyId3", "title": "商品分类3"},


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

    // 查询图书类型列表
    var brandList;
    function querybrandList(){
        $.ajax({
            url:"<%=request.getContextPath()%>/ProductController/querybrandList",
            brand:"post",
            databrand:"json",
            success:function(result){
                if(result.success){
                                     // ↓从后台获取的数据
                    brandList = result.brandList;
                    //往添加页面拼接
                    var brandListHTML = "";
                    for (var i=0; i<brandList.length; i++){
                        brandListHTML+= "<option value='"+brandList[i].id+"'>"+ brandList[i].name+"</option>";
                    }

                    //初始化条件查询数据
                    $("#brand").append(brandListHTML);
                }else{
                    alert("加载图书类型失败!");
                }
            },
            error:function(){
                alert("加载图书类型失败!");
            }
        });
    }

    // 添加
    function attributeAddPage() {
        //加载添加页面中商品品牌数据
        var typeListHTML = "";
        for (var i=0; i<brandList.length; i++){
            typeListHTML+= "<option value='"+brandList[i].id+"'>"+ brandList[i].name+"</option>";
        }
        //addBrandSelect是添加页面的id值
        $("#addBrandSelect").append(typeListHTML);


        // 展示商品的一级分类
        // 发送一个查询商品类型的请求
        changeClassify();

        bootbox.confirm({
            title: "新增商品",
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
                    //1.获取新增药品表单中的 普通数据（往商品表里填充的数据）
                    param.name = $("#addForm #addName").val();
                    param.price = $("#addForm #addPrice").val();
                    param.title = $("#addForm #addTitle").val();
                    param.brandId = $("#addBrandSelect").val();
                    param.isHot = $("#addForm [name=addIsHot]:checked").val();
                    param.status = $("#addForm [name=addStatus]:checked").val();
                    param.mainImage = $("#addForm #img").val();
                    //获取所有商品分类三级联动下拉列表
                    var classifySelectArr = $("#addForm #addClassifyDiv [name=classifySelect]");
                    //.eq(index)-->根据下标获取结果 .val()-->下标为0的value值(数据的ID)
                    param.classifyId1 = classifySelectArr.eq(0).val();
                    param.classifyId2 = classifySelectArr.eq(1).val();
                    param.classifyId3 = classifySelectArr.eq(2).val();
                    //获取文本域中文本内容
                    param.remark = $("#addForm #addRemark").val();

                    // 2.获取商品属性的数据
                    var productAttributeArr = [];
                    $(".attribute").each(function(){
                        // 获取属性名称的div
                        var attributeNameDIV = $(this).find(".attributeName");
                        // 获取属性ID
                        var attributeId = attributeNameDIV.attr("attributeId");
                        // 获取属性值
                        var attributeName = attributeNameDIV.attr("attributeName");
                        var attributeIsSku = attributeNameDIV.attr("isSku");
                        // 获取该属性选中的属性值
                        // 获取属性值的DIV
                        var attributeValueDIV = $(this).find(".attributeValue");
                        attributeValueDIV.find(".abc").each(function(){
                            var productAttribute = {"attributeId":attributeId,"attributeName":attributeName,"isSku":attributeIsSku};
                            // 判断当前遍历的属性值元素是单选按钮还是复选框还是下拉框
                            var tagName = this.tagName; // INPUT SELECT
                            // 如果当前遍历的属性值元素是INPUT类型
                            if(tagName == "INPUT"){
                                var type = this.type;
                                if(type == "text"){
                                    productAttribute.value = this.value;
                                }else if(type == "radio" && this.checked){
                                    productAttribute.valueId = $(this).attr("valueId");
                                }else if(type == "checkbox" && this.checked){
                                    productAttribute.valueId = $(this).attr("valueId");
                                }
                            }else if(tagName == "SELECT"){
                                productAttribute.valueId = $(this).find("option:selected").attr("valueId");
                            }
                            if(productAttribute.valueId != null){
                                productAttributeArr.push(productAttribute);
                            }

                        })

                    })

                    // 3.组装商品sku表的数据
                    var productSkuArr = [];
                    $(".dataRow").each(function (){
                        var tdArr = $(this).children();
                        var properties = {};
                        tdArr.each(function(i){

                            if(i < tdArr.length -2){
                                properties[$(this).attr("attributeId")]= $(this).attr("valueId");
                            }

                        })
                        var prudoctSku = {};
                        prudoctSku.properties = JSON.stringify(properties);
                        prudoctSku.price = $(this).find("[name=price]").val();
                        prudoctSku.stock = $(this).find("[name=stock]").val();
                        productSkuArr.push(prudoctSku);
                    })

                    var productInfos = {"product":param,"productAttributeValueList":productAttributeArr,"productSkuList":productSkuArr};


                    //发起一个新增图书的ajax请求
                    $.ajax({
                        url: "<%=request.getContextPath()%>/ProductController/addProduct",
                        data:JSON.stringify(productInfos),
                        contentType:"application/json",
                        dataType:"json",

                        type: "post",


                        success:function(result){
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
    var productSkuMap = {};
    function update(id) {
        // 回显
        $.post({
            url:"<%=request.getContextPath()%>/ProductController/getProductById",
            data: {"id": id},
            dataType: "json",
            success: function (result) {
                if (result.success) {
                    var product = result.product;
                    // 获取商品属性值的信息
                    var productAttributeValueList = result.productAttributeValueList;
                    // 获取商品SKU信息
                    var productSkuList = result.productSkuList;


                    // 1.回显商品基本信息
                    $("#id").val(product.id);
                    $("#updateName").val(product.name);
                    $("#updatePrice").val(product.price);
                    $("#updateTitle").val(product.title);
                    $("#updateRemark").val(product.remark   );
                    $("[name=updateIsHot][value="+ product.isHot +"]").prop("checked",true);
                    $("[name=updateStatus][value="+ product.status +"]").prop("checked",true);

                    // 回显图片
                    // 分隔后台查询出的图片名
                    var fileNameArr = product.mainImage.split(",");
                    var str = "";
                    for(var i=0; i<fileNameArr.length-1; i++){
                        str += "<img src='<%=request.getContextPath()%>/images/"+fileNameArr[i]+"' width='100px'/>";
                    }
                    $("#updateForm #myDiv").append(str);
                    // 回显图片名
                    $("#updateForm #oldFileName").val(result.fileName);


                    // 2.回显商品分类
                    initClassifySelect(1,product.classifyId1);
                    // 下一级分类的pid等于上一级id
                    // 二级分类的pid是第一级分类的被选中节点的id
                    initClassifySelect(product.classifyId1,product.classifyId2);
                    initClassifySelect(product.classifyId2,product.classifyId3);

                    // 3.回显商品属性
                    huixianAttribute(product,productAttributeValueList);

                    // 4.回显sku表格数据
                    for (var i = 0; i <productSkuList.length ; i++) {
                        productSkuMap[productSkuList[i].properties] = productSkuList[i];
                    }
                    huixianSkuTable(productSkuMap);






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
                            // 1.获取商品的基本信息数据
                            var param = {};
                            param.id = $("#id").val();
                            param.name = $("#updateName").val();
                            param.price = $("#updatePrice").val();
                            param.title = $("#updateTitle").val();
                            param.isHot = $("[name=updateIsHot]:checked").val();
                            param.status = $("[name=updateStatus]:checked").val();
                            // 获取所有商品分类的下拉框
                            var classifySelectArr = $("#updateClassifyDiv [name=classifySelect]");
                            param.classifyId1 = classifySelectArr.eq(0).val();
                            param.classifyId2 = classifySelectArr.eq(1).val();
                            param.classifyId3 = classifySelectArr.eq(2).val();
                            param.remark = $("#updateRemark").val();

                            // 2.获取商品属性的数据
                            var productAttributeArr = [];
                            $(".attribute").each(function(){
                                // 获取属性名称的div
                                var attributeNameDIV = $(this).find(".attributeName");
                                // 获取属性ID
                                var attributeId = attributeNameDIV.attr("attributeId");
                                // 获取属性值
                                var attributeName = attributeNameDIV.attr("attributeName");
                                var attributeIsSku = attributeNameDIV.attr("isSku");
                                // 获取该属性选中的属性值
                                // 获取属性值的DIV
                                var attributeValueDIV = $(this).find(".attributeValue");
                                attributeValueDIV.find(".abc").each(function(){
                                    var productAttribute = {"attributeId":attributeId,"attributeName":attributeName,"isSku":attributeIsSku};
                                    // 判断当前遍历的属性值元素是单选按钮还是复选框还是下拉框
                                    var tagName = this.tagName; // INPUT SELECT
                                    // 如果当前遍历的属性值元素是INPUT类型
                                    if(tagName == "INPUT"){
                                        var type = this.type;
                                        if(type == "text"){
                                            productAttribute.value = this.value;
                                        }else if(type == "radio" && this.checked){
                                            productAttribute.valueId = $(this).attr("valueId");
                                        }else if(type == "checkbox" && this.checked){
                                            productAttribute.valueId = $(this).attr("valueId");
                                        }
                                    }else if(tagName == "SELECT"){
                                        productAttribute.valueId = $(this).find("option:selected").attr("valueId");
                                    }
                                    if(productAttribute.valueId != null){
                                        productAttributeArr.push(productAttribute);
                                    }
                                })

                            })

                            // 3.组装商品sku表的数据
                            var productSkuArr = [];
                            $(".dataRow").each(function (){
                                var tdArr = $(this).children();
                                var properties = {};
                                tdArr.each(function(i){
                                    if(i < tdArr.length -2){
                                        properties[$(this).attr("attributeId")]= $(this).attr("valueId");
                                    }

                                })
                                var prudoctSku = {};
                                prudoctSku.properties = JSON.stringify(properties);
                                prudoctSku.price = $(this).find("[name=price]").val();
                                prudoctSku.stock = $(this).find("[name=stock]").val();
                                productSkuArr.push(prudoctSku);
                            })


                            var productInfos = {"product":param,"productAttributeValueList":productAttributeArr,"productSkuList":productSkuArr};

                            // 发送一个修改商品的ajax请求
                            $.post({
                                url:"<%=request.getContextPath()%>/ProductController/updateProduct",
                                data:JSON.stringify(productInfos),
                                contentType:"application/json",
                                dataType:"json",
                                success:function(result){
                                    if(result.success){
                                        bootbox.alert("修改商品成功！！！");
                                    }else{
                                        bootbox.alert("修改商品失败！！！");
                                    }
                                },
                                error:function(){
                                    bootbox.alert("修改商品失败！！！");
                                }
                            })

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

    //回显商品属性
    function huixianAttribute(product,productAttributeValueList){
        // 根据第三级分类id进行查询该节点下的spu和sku
        $.post({
            url:"<%=request.getContextPath()%>/attributeController/queryAttributeListByClassifyId",
            data:{classifyId:product.classifyId3},
            dataType:"json",
            success:function(result){
                if(result.success){
                    // 商品分类所有的属性数组
                    var arrributeList = result.arrributeList;
                    // 存放sku属性的数组
                    var skuAttributeArr = [];
                    // 存放spu属性的数组
                    var spuAttributeArr = [];

                    for (var i=0; i<arrributeList.length; i++){
                        // 如果type==1说明是spu属性
                        if(arrributeList[i].type == 1){
                            spuAttributeArr.push(arrributeList[i]);
                        }else{
                            skuAttributeArr.push(arrributeList[i]);
                        }
                    }

                    // 初始化修改商品表单中的spu属性
                    initAddSpuAttribute(spuAttributeArr,"#updateSpuAttributeDiv");
                    // 初始化新增商品表单中的sku属性
                    initAddSkuAttribute(skuAttributeArr,"#updateSkuAttributeDiv");

                    // 回显商品属性
                    // 获取被选中的属性的id
                    var productAttributeValueMap = {};
                    for(var i=0; i<productAttributeValueList.length; i++){
                        // 获取当前遍历的商品属性的id
                        var attributeId = productAttributeValueList[i].attributeId;
                        // 获取当前遍历的商品属性值的id
                        var valueId = productAttributeValueList[i].valueId;
                        // 将数据库中属性id存到productAttributeValueMap里
                        if(productAttributeValueMap[attributeId] !=null ){
                            productAttributeValueMap[attributeId].push(valueId);
                        }else{
                            productAttributeValueMap[attributeId] = [valueId];
                        }
                    }

                    console.log(productAttributeValueMap);

                    $("#updateForm .attribute").each(function(){
                        // 获取属性名称的div
                        var attributeNameDIV = $(this).find(".attributeName");
                        // 获取属性ID
                        var attributeId = attributeNameDIV.attr("attributeId");
                        // 获取属性值的DIV
                        var attributeValueDIV = $(this).find(".attributeValue");
                        attributeValueDIV.find(".abc").each(function(){
                            // 判断当前遍历的属性值元素是单选按钮还是复选框还是下拉框
                            var tagName = this.tagName; // INPUT SELECT
                            // 如果当前遍历的属性值元素是INPUT类型
                            if(tagName == "INPUT"){
                                var type = this.type;
                                if(type == "text"){
                                    this.value = productAttributeValueMap[attributeId][0];
                                }else if(type == "radio" || type == "checkbox"){
                                    // == 不区分数据类型 ===才区分数据类型
                                    // js将String转为int
                                    if(productAttributeValueMap[attributeId].indexOf(parseInt($(this).attr("valueId"))) != -1){
                                        this.checked = true;
                                    }
                                }
                            }else if(tagName == "SELECT"){
                                this.value = productAttributeValueMap[attributeId][0];
                            }
                        })
                    })

                    initSkuTable(2);

                }

            },
            error:function(){
                bootbox.alert("查询商品分类失败！！！");
            }
        })
    }

    // 回显商品SKU表格
    function huixianSkuTable(productSkuMap){
        $(".dataRow").each(function (){
            // 获取当前行的td
            var tdArr = $(this).children();
            var properties = {};
            tdArr.each(function(i){
                if(i < tdArr.length - 2){
                    properties[$(this).attr("attributeId")] = $(this).attr("valueId");
                }
            })
            if(productSkuMap[JSON.stringify(properties)] != null){
                $(this).find("[name=price]").val(productSkuMap[JSON.stringify(properties)].price);
                $(this).find("[name=stock]").val(productSkuMap[JSON.stringify(properties)].stock);
            }
        })
    }

    //三级联动
    function changeClassify(obj){
        $(obj).parent().nextAll().remove();
        var pId = obj == undefined ? 1 : obj.value;
        // 如果前面没有一个兄弟说明是一级分类，如果前面有一个兄弟说明是二级分类，如果前面有两个兄弟说明是三级分类
        var length = $(obj).parent().prevAll().length;
        //如果当前节点是第三级分类，就查出当前选中的商品的spu和sku属性
        if(length == 2){
            $.post({
                url:"<%=request.getContextPath()%>/attributeController/queryAttributeListByClassifyId",
                data:{classifyId:obj.value},
                dataType:"json",
                success:function(result){
                    if(result.success){
                        // 商品分类所有的属性数组
                        var arrributeList = result.arrributeList;
                        // 存放sku属性的数组
                        var skuAttributeArr = [];
                        // 存放spu属性的数组
                        var spuAttributeArr = [];
                        for (var i=0; i<arrributeList.length; i++){
                            // 如果type==1说明是spu属性
                            if(arrributeList[i].type == 1){
                                spuAttributeArr.push(arrributeList[i]);
                            }else{
                                skuAttributeArr.push(arrributeList[i]);
                            }
                        }

                        // 初始化新增商品表单中的spu属性
                        initAddSpuAttribute(spuAttributeArr,"#addSpuAttributeDiv");
                        // 初始化新增商品表单中的sku属性
                        initAddSkuAttribute(skuAttributeArr,"#addSkuAttributeDiv");
                    }

                },
                error:function(){
                    bootbox.alert("查询商品分类失败！！！");
                }
            })
        }
        //查询分类下拉框，三级联动
        $.post({
            url:"<%=request.getContextPath()%>/ClassifyController/queryClassifyListByPid",
            data:{pId:pId},
            dataType:"json",
            success:function(result){
                if(result.success){
                    if(result.classifyList.length<1){
                        return ;
                    }

                    var classifySelectHTML = "<div class='col-sm-4'><select onchange='changeClassify(this)' class='form-control' name='classifySelect'><option value='-1'>请选择</option>";
                    for (var i=0; i<result.classifyList.length; i++) {
                        classifySelectHTML+="<option value='"+result.classifyList[i].id+"'>"+result.classifyList[i].name+"</option>"
                    }
                    classifySelectHTML+="</select></div>";
                    $("#addClassifyDiv").append(classifySelectHTML);
                }
            },
            error:function(){
                bootbox.alert("查询商品分类失败！！！");
            }
        })
    }
    //但的选择三级联动时查询SPU数据
    function initAddSpuAttribute(spuAttributeArr,divId){
        var addSpuAttributeDivHTML = "";

        // 遍历squ属性数组
        for(var i=0; i<spuAttributeArr.length; i++){
            addSpuAttributeDivHTML += "<div class='attribute'><div class='attributeName' isSku='"+ spuAttributeArr[i].type +"' attributeId='"+spuAttributeArr[i].id+ "' attributeName='"+spuAttributeArr[i].name+"'>"+spuAttributeArr[i].name + "：</div><div class='attributeValue'>";
            // 先判断当前遍历输入的属性值录入方式（inputType）
            // 如果是手动输入（inputType==1）直接显示一个文本框
            // 如果是从可选项中选择（inputType==2），再去判断属性选择方式（selecttype）
            // 如果selecttype==2就把可选项展示成单选按钮
            // 如果selecttype==3就把可选项展示成复选框
            // 如果selecttype==4就把可选项展示成下拉框
            if(spuAttributeArr[i].inputType ==1){
                addSpuAttributeDivHTML += "<input type='text' class=\"form-control\"/>";
            }else{
                // 当前遍历属性的可选项，多个值之间用逗号分隔
                var valueArr = spuAttributeArr[i].inputList.split(",");
                // 遍历属性值的id字符串，多个值之间用逗号分隔
                var valueIdArr = spuAttributeArr[i].valueIdList.split(",");
                if(spuAttributeArr[i].selectType == 2){

                    for (var j=0; j<valueArr.length; j++){
                        addSpuAttributeDivHTML += "<input class='abc' type='radio' name='a' valueId='" +valueIdArr[j]+ "' value='"+ valueArr[j] +"' />" + valueArr[j];
                    }
                }else if(spuAttributeArr[i].selectType == 3){
                    for (var j=0; j<valueArr.length; j++){
                        addSpuAttributeDivHTML += "<input class='abc' type='checkbox' name='a' valueId='" +valueIdArr[j]+ "' value='"+ valueArr[j] +"' //>" + valueArr[j];
                    }
                }else if(spuAttributeArr[i].selectType == 4){
                    addSpuAttributeDivHTML += "<select class='form-control abc' name='a' >"
                    for (var j=0; j<valueArr.length; j++){
                        addSpuAttributeDivHTML += "<option value='"+valueArr[j]+"' valueId='" +valueIdArr[j]+ "'>" + valueArr[j]+"</option>" ;
                    }
                    addSpuAttributeDivHTML += "</select>";
                }

                addSpuAttributeDivHTML += "</div>";
                // 如果当前遍历的属性允许新增属性值/
                if(spuAttributeArr[i].addAble == 1){
                    addSpuAttributeDivHTML+="<div><input type='text' /><button onclick='addCustomValue(this,"+spuAttributeArr[i].selectType+","+spuAttributeArr[i].id+","+"\""+spuAttributeArr[i].inputList+"\""+")' type='button'>新增</button></div>"
                }

            }
            addSpuAttributeDivHTML +="<br/>";

        }
        $(divId).html(addSpuAttributeDivHTML);
    }
    //但的选择三级联动时查询SKU数据
    function initAddSkuAttribute(skuAttributeArr,divId){
        var addSkuAttributeDivHTML = "";
        // 遍历squ属性数组
        for(var i=0; i<skuAttributeArr.length; i++){
            addSkuAttributeDivHTML += "<div class='attribute'><div class='attributeName' isSku='"+ skuAttributeArr[i].type +"' attributeId='"+skuAttributeArr[i].id+ "' attributeName='"+skuAttributeArr[i].name+"'>"+skuAttributeArr[i].name + "：</div><div class='attributeValue'>";
            // 先判断当前遍历输入的属性值录入方式（inputType）
            // 如果是手动输入（inputType==1）直接显示一个文本框
            // 如果是从可选项中选择（inputType==2），再去判断属性选择方式（selecttype）
            // 如果selecttype==2就把可选项展示成单选按钮
            // 如果selecttype==3就把可选项展示成复选框
            // 如果selecttype==4就把可选项展示成下拉框
            if(skuAttributeArr[i].inputType ==1){
                addSkuAttributeDivHTML += "<input type='text' class=\"form-control\"/>";
            }else{
                // 当前遍历属性的可选项，多个值之间用逗号分隔
                var valueArr = skuAttributeArr[i].inputList.split(",");
                // 遍历属性值的id字符串，多个值之间用逗号分隔
                var valueIdArr = skuAttributeArr[i].valueIdList.split(",");

                if(skuAttributeArr[i].selectType == 2){
                    for (var j=0; j<valueArr.length; j++){
                        addSkuAttributeDivHTML += "<input class='abc' type='radio' name='a' valueId='" +valueIdArr[j]+ "' value='"+ valueArr[j] +"' onclick='initSkuTable(1)'/>" + valueArr[j];
                    }
                }else if(skuAttributeArr[i].selectType == 3){
                    for (var j=0; j<valueArr.length; j++){
                        addSkuAttributeDivHTML += "<input class='abc' type='checkbox' name='a' valueId='" +valueIdArr[j]+ "' value='"+ valueArr[j] +"' onclick='initSkuTable(1)'/>" + valueArr[j];
                    }
                }else if(skuAttributeArr[i].selectType == 4){
                    addSkuAttributeDivHTML += "<select class='form-control abc' name='a' onchange='initSkuTable(1)'>"
                    for (var j=0; j<valueArr.length; j++){
                        addSkuAttributeDivHTML += "<option value='"+valueArr[j]+"' valueId='" +valueIdArr[j]+ "'>" + valueArr[j]+"</option>" ;
                    }
                    addSkuAttributeDivHTML += "</select>";
                }

                addSkuAttributeDivHTML += "</div>";
                // 如果当前遍历的属性允许新增属性值/
                if(skuAttributeArr[i].addAble == 1){
                    addSkuAttributeDivHTML+="<div><input type='text' /><button onclick='addCustomValue(this,"+skuAttributeArr[i].selectType+","+skuAttributeArr[i].id+","+"\""+skuAttributeArr[i].inputList+"\""+")' type='button'>新增</button></div>"
                }

            }
            addSkuAttributeDivHTML +="</div>";

        }
        $(divId).html(addSkuAttributeDivHTML);
    }
    //加载SKU数据表格
    function initSkuTable(type){
        var type = type == 1 ? "add" :"update";
        // 用于存放所有SKU属性的数组
        var attributeArr = [];
        // 获取sku属性Div中的所有属性div
        $("#" + type +"SkuAttributeDiv .attribute").each(function(){
            // 获取属性名称的div
            var attributeNameDIV = $(this).find(".attributeName");
            // 获取属性ID
            var attributeId = attributeNameDIV.attr("attributeId");
            // 获取属性值
            var attributeName = attributeNameDIV.attr("attributeName");
            // 获取该属性选中的属性值
            // 获取属性值的DIV
            var attributeValueDIV = $(this).find(".attributeValue");
            // 获取属性值得DIV中的属性值元素（单选/复选框/下拉框）
            var attributeValueElementArr = attributeValueDIV.find("[name=a]");
            // 用于存放选中的属性值的数组
            var valueArr = [];
            attributeValueElementArr.each(function(){
                // 判断当前遍历的属性值元素是单选按钮还是复选框还是下拉框
                var tagName = this.tagName; // INPUT SELECT
                // 如果当前遍历的属性值元素是INPUT类型
                if(tagName == "INPUT"){
                    var type = this.type;
                    if(type == "text"){
                        valueArr.push(this.value);
                    }else if(type == "radio" && this.checked){
                        valueArr.push($(this).attr("valueId") + ":" +this.value); // attr方法设置或返回被选元素的属性值。
                    }else if(type == "checkbox" && this.checked){
                        valueArr.push($(this).attr("valueId") + ":" +this.value);
                    }
                }else if(tagName == "SELECT"){
                    valueArr.push($(this).find("option:selected").attr("valueId") + ":" +this.value);
                }
            })

            // 创建一个sku对象
            var attribute = {};
            attribute.id = attributeId;
            attribute.name = attributeName;
            attribute.valueList = valueArr;
            if(attribute.valueList.length > 0){
                attributeArr.push(attribute);
            }

        })

        if(attributeArr.length > 0){
            //生成SKU表格
            var skuTableHTML = "<table class=\"table table-condensed table-hover table-bordered table-striped\" id=\"myTable\"><thead><tr>";
            // 生成sku表格的表头
            var valueListArr = [];
            for(var i=0; i<attributeArr.length; i++){
                skuTableHTML += "<th>" + attributeArr[i].name + "</th>";
                valueListArr.push(attributeArr[i].valueList);
            }
            skuTableHTML += "<th>库存</th>";
            skuTableHTML += "<th>价格</th>";
            skuTableHTML += "</tr>";
            skuTableHTML += "</thead>";
        }

        // 根据所有选中属性值的数组生成笛卡尔积
        var descarValue = DescartesUtils.descartes(valueListArr);
        // 生成sku表格中的数据行
        for(var i=0; i<descarValue.length ; i++){
            skuTableHTML += "<tr class='dataRow'>";
            for(var j =0; j<descarValue[i].length; j++ ){
                var arr = descarValue[i][j].split(":");
                skuTableHTML += "<td attributeId='"+ attributeArr[j].id +"' valueId='"+ arr[0] +"'>" +arr[1] +"</td>";
            }
            skuTableHTML += "<td><input type='text' size='8' name='price'/></td>";
            skuTableHTML += "<td><input type='text' size='8' name='stock'/></td>";
            skuTableHTML += "<tr>";
        }

        $("#"+ type +"SkuTableDiv").html(skuTableHTML);

        if(productSkuMap){
            huixianSkuTable(productSkuMap);
        }


    }
    //允许新增属性值
    function addCustomValue(obj,selectType,id,inputList){
        var value = $(obj).prev(":text").val();
        if(value.trim() == ""){
            bootbox.alert("属性值不能为空！");
            return;
        }
        // 判断用户当前输入的值存不存在
        var arr = inputList.split(",");
        var flag = false;
        for (var i=0; i<arr.length; i++){
            if(value == arr[i]){
                bootbox.alert("该属性值已存在！");
                flag = true;
                return ;
            }
        }

        if(flag == false){
            // 如果属性值不存在则发送ajax进行添加
            $.post({
                url:"<%=request.getContextPath()%>/AttributeValueController/addAttributeValue",
                data:{attrid:id,value:value},
                dataType:"json",
                success:function(result){
                    if(result.success){
                        var attributeDiv = $(obj).parent().prev("div");
                        var select = $(obj).parent().prev("select");
                        var input = $(obj).prev(":text");
                        if(selectType == 2){
                            attributeDiv.append("<input type='radio'/>"+value);
                            input.val("");
                        }else if(selectType == 3){
                            attributeDiv.append("<input type='checkbox'/>"+value);
                            input.val("");
                        }else if(selectType == 4){
                            attributeDiv.find("select").append("<option value='"+value+"'>"+value+"</option>");
                            input.val("");
                        }
                    }else {
                        bootbox.alert("新增属性值失败！");
                    }
                },
                error:function(){
                    bootbox.alert("新增属性值失败！");
                }
            })

        }


    }


    // 查询商品
    function initClassifySelect(pid,selectedId){
        $.ajax({
            url:"<%=request.getContextPath()%>/ClassifyController/queryClassifyListByPid",
            data:{pId:pid},
            dataType:"json",
            success:function(result){
                var classifySelectHTML = "<div class='col-sm-4'><select onchange='changeClassify(this)' class='form-control' name='classifySelect'><option value='-1'>请选择</option>";
                for (var i=0; i<result.classifyList.length; i++) {
                    classifySelectHTML+="<option "+ (selectedId == result.classifyList[i].id ?"selected":"") +" value='"+result.classifyList[i].id+"'>"+result.classifyList[i].name+"</option>"
                }
                classifySelectHTML+="</select></div>";
                $("#updateClassifyDiv").append(classifySelectHTML);
            },
            error:function(){
                bootbox.alert("查询分类失败！");
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
            uploadUrl:"<%=request.getContextPath()%>/ProductController/uploadPicture",
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
