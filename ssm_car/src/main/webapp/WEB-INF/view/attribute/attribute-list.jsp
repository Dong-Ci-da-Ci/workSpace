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
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">属性列表</h3>
    </div>
    <div class="panel-body">
        <button type="button" class="btn btn-primary" onclick="showAddPage()"><span class="glyphicon glyphicon-plus"></span>新增</button>
        <button type="button" class="btn btn-danger"  onclick="deleteBathBook()"><span class="glyphicon glyphicon-minus"></span>批量删除</button>
        <button type="button" class="btn btn-success" onclick="importExcel()"><span class="glyphicon glyphicon-upload"></span>导入文件</button>
        <button type="button" class="btn btn-success" onclick="exportExcel()"><span class="glyphicon glyphicon-download"></span>导出文件</button>
        <button type="button" class="btn btn-success" onclick="exportWord()"><span class="glyphicon glyphicon-upload"></span>导出Word</button>
        <button type="button" class="btn btn-success" onclick="exportPdf()"><span class="glyphicon glyphicon-download"></span>导出Pdf</button>
        <table class="table table-condensed table-hover table-bordered table-striped" id="myTable">
            <thead>
            <tr>
                <th>
                    <button type="button" class="btn btn-info btn-sm" onclick="qx()"><span class="glyphicon glyphicon-cloud"></span>全选</button>
                    <button type="button" class="btn btn-success btn-sm" onclick="qbx()"><span class="glyphicon glyphicon-star-empty"></span>全不选</button>
                    <button type="button" class="btn btn-warning btn-sm" onclick="fx()"><span class="glyphicon glyphicon-headphones"></span>反选</button>
                </th>
                <th>属性名称</th>
                <th>属性类型</th>
                <th>属性录入方式</th>
                <th>选择方式</th>
                <th>是否允许扩展属性值</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>

</body>

<script>
    // 列表展示
    var attributeTable;
    function queryAttributeList(){
        // 跟表格的id保持一致
        bookTable = $('#myTable').DataTable({
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
            columns : [ {
                targets : 0,
                "order" : false
            } ],
            "order":[ [ 1, 'asc' ] ],

            // 发送ajax
            "ajax":{
                "type":"post",
                "url":"<%=request.getContextPath()%>/AttributeController/queryAttributeList",
                "data":function(param){
                    // 条件查询

                },
            },

            // 渲染列表数据
            "columns":[
                {"data":"id",
                    "render":function(data){
                        return "<input value='"+data+"' type='checkbox' name='chk'/>";
                    }
                },
                {"data":"name"},
                {"data":"type",
                    "render":function(data){
                        if (data == 1){
                            return data = "spu属性";
                        } else{
                            return data = "sku属性";
                        }
                    }
                },
                {"data":"inputType",
                    "render":function(data){
                        if (data == 1){
                            return data = "手动输入";
                        } else{
                            return data = "从可选项中选择";
                        }
                    }
                },
                {"data":"selectType",
                    "render":function(data){
                        if (data == 1){
                            return data = "输入框";
                        } else if (data == 2) {
                            return data = "单选按钮";
                        } else if (data == 3) {
                            return data = "复选框";
                        } else  {
                            return data = "下拉列表";
                        }

                    }
                },
                {"data":"addAble",
                    "render":function(data){
                        if (data == 1){
                            return data = "允许";
                        } else{
                            return data = "不允许";
                        }
                    }
                },




                {"data":"id",
                    "render":function(data){
                        return '<button type="button" class="btn btn-info btn-sm" onclick="updateBook('+data+')"><span class="glyphicon glyphicon-pencil"></span>修改</button>'+
                            '<button type="button" class="btn btn-danger btn-sm" onclick="deleteBook('+data+')"><span class="glyphicon glyphicon-pencil"></span>删除</button>';
                    }
                },
            ]


        });
    }
</script>
</html>
