<html>
    <head>
        <title>我的freemaker</title>
    </head>
    <body>
        欢迎您，${username}
        您今天是第${user.loginCount}次登录本网站
        上次登录时间为${user.lastLoginTime?string("yyyy/MM/dd HH:mm:ss")}
    </body>
</html>