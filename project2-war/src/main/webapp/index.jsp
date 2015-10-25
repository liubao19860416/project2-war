<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SendMessage</title>
</head>
<body>
    <center>
	<h2>SendMessage to Android ISO</h2>
	<form id="form1" name="form1" method="post" action="<%=basePath %>message/getLoadApplications/0">
		<table width="266" height="99" border="1" cellpadding="0" cellspacing="0">
		  <tr>
		    <td width="82">用户名：</td>
		    <td width="168"><input type="text" name="userName" value="admin" /></td>
		  </tr>
		  <tr>
		    <td>密&nbsp;码：</td>
		    <td><input type="password" name="password" value="admin" /></td>
		  </tr>
		  <tr align="center">
		    <td height="25"><input type="submit" name="Submit" value="提交" /></td>
		    <td><input type="reset" name="Submit2" value="取消" /></td>
		  </tr>
		</table>
	</form>
	</center>
</body>
</html>