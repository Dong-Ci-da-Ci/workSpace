<html>
    <head>
        <title>freemarker导出pdf</title>
    </head>
    <body>
    <div style="font-family: SimSun">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td>图书编号</td>
                <td>图书名称</td>
                <td>图书价格</td>
                <td>是否上架</td>
                <td>出版日期</td>
            </tr>
            <#list bookList as book>
            <tr>
                <td>${book.bookId}</td>
                <td>${book.bookName}</td>
                <td>${book.bookPrice}</td>
                <td>
                    ${(book.isup==1)?string("是","否")}
                </td>
                <td>${book.producedDate?datetime}</td>
            </tr>
            </#list>
        </table>
    </div>
    </body>
</html>