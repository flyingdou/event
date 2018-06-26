<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录中</title>
</head>
<body>
</body>
<script>
var page = {
     status : ${status == null ? 0 : status},
     upUrl : "${upUrl}"
     
};
	if(page.status == 0){
		sessionStorage.upUrl = page.upUrl;
		location.href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxbc83d7dbb3a30e14&redirect_uri=http://funcoin.cardcol.com/wechatLogin.html&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';
	}else if(page.status == 1){
		var upUrl = sessionStorage.upUrl;
		sessionStorage.removeItem("upUrl");
		location.href = upUrl;
	}
</script>
</html>