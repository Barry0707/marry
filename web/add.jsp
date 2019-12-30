<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="layui/css/layui.css">
    <title>添加</title>
</head>
<body style="background-color: white">
<form class="layui-form" action="add" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">婚礼区域（单选）:</label>
        <div class="layui-input-block">
            <input type="radio" name="marea" value="李沧区" title="李沧区" checked>
            <input type="radio" name="marea" value="市南区" title="市南区">
            <input type="radio" name="marea" value="城阳区" title="城阳区">
            <input type="radio" name="marea" value="市北区" title="市北区">
            <input type="radio" name="marea" value="黄岛区" title="黄岛区">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">婚礼类型（单选）:</label>
        <div class="layui-input-block">
            <input type="radio" name="mtype" value="户外草坪" title="户外草坪" checked>
            <input type="radio" name="mtype" value="浪漫西式" title="浪漫西式">
            <input type="radio" name="mtype" value="传统中式" title="传统中式">
            <input type="radio" name="mtype" value="教堂婚礼" title="教堂婚礼">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">婚礼风格（可多选）:</label>
        <div class="layui-input layui-input-block" style="border: none">
            <input type="checkbox" name="mstyle" title="波多米亚风" value="波多米亚风">
            <input type="checkbox" name="mstyle" title="森林田园风" value="森林田园风">
            <input type="checkbox" name="mstyle" title="复古风" value="复古风">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">预算金额（单选）: </label>
        <div class="layui-input-inline">
            <select id="money" name="money" lay-verify="required"
                    lay-filter="money">
                <option value=""></option>
                <option value="20000">20000</option>
                <option value="50000">50000</option>
                <option value="100000">100000</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">可选折扣:</label>
        <div class="layui-input-inline">
            <select id="count" name="count" style="border-radius: 20px;border-color: deeppink"
                    lay-filter="count" lay-verify="required">
                <option value=""></option>
                <option value="0.98" disabled>98折</option>
                <option value="0.95" disabled>95折</option>
                <option value="0.9" disabled >9折</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block" style="margin-left: 0">
            <input type="button" class="layui-btn layui-btn-radius" style="background-color: deeppink;border-color: deeppink" id="math"  value="计算金额">
            <input type="text" lay-verify="required" class="layui-btn layui-btn-radius layui-btn-primary" id="result" name="result" style="border-color: deeppink">
            <a href="pay.html" class="layui-btn layui-btn-radius" style="background-color: deeppink;border-color: deeppink">支付</a>
        </div>
    </div>
    <div class="layui-form-item">
        <label style="color: red;">请填写您的真实信息，方面客服联系到您！</label>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">姓名:</label>
            <div class="layui-inline">
                <input type="text" name="mname" id="mname" lay-verify="required|checkName" autofocus placeholder="请填写姓名"
                       autocomplete="off" class="layui-input" style="border-radius: 20px;border-color: deeppink">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系电话:</label>
            <div class="layui-inline">
                <input type="text" name="mphone" id="mphone" lay-verify="required|phone" autofocus placeholder="请填写手机号"
                       autocomplete="off" class="layui-input" style="border-radius: 20px;border-color: deeppink">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">预算婚期:</label>
            <div class="layui-inline">
                <input type="text" name="mtime" id="mtime" autofocus placeholder="请填写预算婚期"
                       autocomplete="off" class="layui-input" style="border-radius: 20px;border-color: deeppink" lay-verify="required">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block" style="display: flex;justify-content:center;margin: 0 auto">
            <button class="layui-btn layui-btn-radius" lay-submit lay-filter="btn_submit" style="background-color: deeppink;border-color: deeppink;">增加</button>
                <br><br>
            <input type="reset" class="layui-btn layui-btn-radius layui-btn-primary" style="border-color: deeppink" value="重置">
        </div>
    </div>
</form>
<script src="script/jquery-1.10.2.js"></script>
<script src="layui/layui.js"></script>
<script>

        layui.use(['form', 'layer', 'laydate'], function () {
            let form = layui.form
                , layer = layui.layer
                , laydate = layui.laydate;

            //事件监听
            //监听下拉列表框
            form.verify({
                checkName: function (value, item) {
                    if (value == "" || value == null) {
                        return "请填写姓名"
                    }
                }
            });

            $("input#math").click(function () {
                let money = $("select#money").val();
                console.log(money);
                let count = $("select#count").val();
                console.log(count);
                let all = money*count;
                console.log(all);
                let text = $("input#result");
                text.attr("value",all);
            });    //计算金额

            form.on('select(money)', function(data){
                if(data.value == 20000){
                    $("#count option[value='0.98']").removeAttr("disabled");
                    $("#count option[value='0.95']").attr("disabled","true");
                    $("#count option[value='0.9']").attr("disabled","true");
                    form.render('select');
                }else if (data.value == 50000){
                    $("#count option[value='0.98']").removeAttr("disabled");
                    $("#count option[value='0.95']").removeAttr("disabled");
                    $("#count option[value='0.9']").attr("disabled","true");
                    form.render('select');
                }else if (data.value == 100000){
                    $("#count option[value='0.98']").removeAttr("disabled");
                    $("#count option[value='0.95']").removeAttr("disabled");
                    $("#count option[value='0.9']").removeAttr("disabled");
                    form.render('select');
                }
            });

            laydate.render({
                elem: '#mtime',
                trigger: 'click',
                min: 30
            });

        });

</script>
</body>
</html>
