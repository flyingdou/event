<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录中</title>
<script src='event/js/jquery.min.js'></script>
</head>
<body>
</body>
<script>

// 载入函数
$(function () {
	
	var page = {
		     status : ${status == null ? 0 : status},
		     upUrl : "${upUrl}",
		     loginResult: ${loginResult == null ? 0 : loginResult}
		};

	    alert(JSON.stringify(page));
		if (page.status == 1 && page.loginResult != 0 && !page.loginResult.success) {
			alert('请您先关注本公众号，再操作！');
			page = {};
			// 跳转到公众号二维码页面
			return;
			location.href = 'event/funcoinQRCode.jsp';
		}
		
		if(page.status == 0){
			sessionStorage.upUrl = page.upUrl;
			page = {};
			location.href='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxbc83d7dbb3a30e14&redirect_uri=http://funcoin.cardcol.com/wechatLogin.html&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';
		}else if(page.status == 1){
			var upUrl = sessionStorage.upUrl;
			sessionStorage.removeItem("upUrl");
			page = {};
			location.href = upUrl;
		}
	
})
</script>
</html>