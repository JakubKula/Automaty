<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 27.05.2021
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h1>Register</h1>
<form:form method="post" modelAttribute="user">
    <br>User Name<br>
    <form:input path="username"/>
    <form:errors path="username"/>
    <br>Password<br>
    <form:input path="password"/>
    <form:errors path="password"/>
    <br>
    <input type="submit" value="Register"/>
</form:form>
<%--    <form method="post" action="/register">--%>
<%--        <div><label>User Name : <input type="text" name="username"/> </label></div>--%>
<%--        <div><label>Password : <input type="password" name="password"/> </label></div>--%>
<%--        <div><input type="submit" value="Register"/></div>--%>
<%--    </form>--%>
</body>
</html>
