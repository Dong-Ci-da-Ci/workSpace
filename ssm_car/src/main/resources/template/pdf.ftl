<html>
    <head>
        <title>freemarker导出pdf</title>
    </head>
    <body>
    <div style="font-family: SimSun">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td>汽车编号</td>
                <td>汽车名称</td>
                <td>汽车价格</td>
                <td>是否上市</td>
                <td>汽车配置</td>
                <td>汽车简介</td>
                <td>出厂日期</td>
                <td>修改日期</td>
                <td>品牌名称</td>

            </tr>
            <#list carList as car>
            <tr>
                <td>${car.carId}</td>
                <td>${car.carName}</td>
                <td>${car.carPrice}</td>
                <td>
                    ${(car.isup==1)?string("是","否")}
                </td>
                <td>${car.configure?replace("1","suv")?replace("2","面包车")?replace("3","跑车")?replace("4","越野车")}</td>
                <td>${car.introduction}</td>
                <td>${car.producedDate?date}</td>
                <td><#if car.updateDate??> ${car.updateDate?date}</#if></td>
                <td>${(car.brandId==1)?string("奔驰",(car.brandId==2)?string("宝马","雷克沙斯"))}</td>
            </tr>
            </#list>
        </table>
    </div>
    </body>
</html>