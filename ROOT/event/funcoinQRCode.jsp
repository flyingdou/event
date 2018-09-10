<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":"+ request.getServerPort() + path + "/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>关注方孔微信公众号</title>
<script type="text/javascript" src="event/js/jquery.min.js"></script>
<style type="text/css">

.content{
	margin: 0;
	padding: 0;

}

.reminder{
   	text-align: center;
}


</style>
</head>
<body>

      <!-- 方孔微信公众号二维码 -->
      <div class = 'content'>
             <div class = 'reminder'>请长按识别二维码，关注方孔微信公众号</div>
             <div class = 'qrcodeDiv'>
                  <img src="event/img/funcoinQRCode.jpg">
             </div>
      
      </div>

</body>
</html>