<%@ page import="com.etoak.po.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<%
    if(session.getAttribute("u")==null){
        response.sendRedirect("login.html");
        return;
    }
%>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="border: solid 1px deepskyblue;
    background-color: pink">
        <h2 style="text-align: center;margin-top: 10px;color: white">婚礼管理系统</h2>
    </div>
</div>
<br>
<form class="layui-form" action="javascript:;">
    <div id="container">
        <a href="add.jsp" class="layui-btn layui-btn-normal layui-btn-radius" id="add">
            <i class="layui-icon layui-icon-add-circle"> 添加</i></a>
        <div class="layui-input-inline">
            <label class="layui-form-label" style="width: 100px;">姓名：</label>
            <input type="text" name="name" id="name" placeholder="请输入姓名" autocomplete="off" class="layui-input"
                   style="border-radius:20px;padding:10px">
        </div>&nbsp;&nbsp;&nbsp;
        <div class="layui-input-inline">
            <label class="layui-form-label" style="width: 100px;">预期婚礼从：</label>
            <input type="text" placeholder="请选择时间" autocomplete="off" class="layui-input"
                   style="border-radius:20px;padding:10px" name="mydate1" id="time1">
        </div>
        <div class="layui-input-inline">
            <label class="layui-form-label" style="width: 100px;">到：</label>
            <input type="text" placeholder="请选择时间" autocomplete="off" class="layui-input"
                   style="border-radius:20px;padding:10px" name="mydate2" id="time2">
        </div>
        <button class="layui-btn layui-btn-normal layui-btn-radius" id="btn_check">
            <i class="layui-icon layui-icon-search"> 查询</i></button>
        <a href="login.html" class="layui-btn layui-btn-radius" style="background-color: #007DDB;border-color: #007DDB">退出登录</a>
        <table id="demo" lay-filter="etoak"></table>
        <script type="text/html" id="toolbar">
            {{#  if(d.mstatus == 0){  }}
            <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="check" style="color: red">审核</a>
            {{#  } else {  }}
            <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="checked">已审核</a>
            {{#  }  }}
        </script>

        <script type="text/html" id="showCheck">
            {{#  if(d.mstatus == 1){  }}
            <div class="layui-table-cell" style="color: green">已审核通过</div>
            {{#  } else {  }}
            <div class="layui-table-cell" style="color: red">未审核</div>
            {{#  }  }}
        </script>
    </div>
</form>
<script src="layui/layui.js"></script>
<script src="script/jquery-1.10.2.js"></script>
<script>
    layui.use(['table', 'form', 'laydate', 'layer'], function () {
        //加载table模块
        let table = layui.table
            , form = layui.form
            , layer = layui.layer
            , laydate = layui.laydate;
        form.render() ;
        show();

        let btn_check = $("button#btn_check");
        btn_check.unbind();
        btn_check.click(function () {
            show();
        });


        function show() {
            table.render({
                elem: '#demo',
                text: {
                    none: '数据库中无数据'
                },
                even: true,
                url: 'show?mname=' + $("input#name").val() + '&time1=' + $("input#time1").val() + '&time2=' + $("input#time2").val(),
                method: 'post',
                limit: 6,
                page: true,

                cols: [[
                    {field: 'mname', title: '姓名', width: 100, fixed: 'left'},
                    {field: 'marea', title: '婚礼区域', width: 100, align: 'center'},
                    {field: 'mtype', title: '婚礼类型', width: 150, align: 'center'},
                    {field: 'mmoney', title: '预算金额', width: 130, align: 'center'},
                    {field: 'mstyle', title: '婚礼风格', width: 230, align: 'center'},
                    {field: 'mphone', title: '联系电话', width: 120, align: 'center'},
                    {field: 'mwishtime', title: '预计婚期', width: 120, align: 'center'},
                    {title: '审核状态', width: 130, align: 'center', toolbar: '#showCheck'},
                    {field: 'msettime', title: '创建日期', width: 120, align: 'center'},
                    <% if(((User)session.getAttribute("u")).getStatus().equals("1")){ %>
                    {fixed: 'right', title: '操作', width: 80, align: 'center', toolbar: '#toolbar'}
                    <% } %>
                ]]
            });
        }

        table.on('tool(etoak)', function (obj) {
            let data = obj.data;
            let layEvent = obj.event;
            let tr = obj.tr;
            if (layEvent == 'check') {
                layer.confirm('确定进行审核么？', function (index) {
                    $.ajax({
                        url: "checkItem",
                        type: "post",
                        data: "mid=" + data.mid,
                        dataType: "text",
                        async: true,
                        success: function (data) {
                            if (data == "suc") {
                                show();
                                layer.close(index);
                                return;
                            }
                        },
                        error: function () {
                            console.log(status);
                        }
                    });
                });
            } else if (layEvent == 'checked') {
                layer.open({
                    type: 1,
                    content: '该婚礼信息已经通过审核！',
                    title: '已通过审核',
                    area: ['300px', '100px']
                });
            }

        });

        //执行一个laydate实例
        laydate.render({
            elem: '#time1'
            , trigger: 'click'
        });
        laydate.render({
            elem: '#time2'
            , trigger: 'click'
        });
    });
</script>
</body>
</html>
