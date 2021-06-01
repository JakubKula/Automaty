<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 20.05.2021
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="header.jsp"%>

<h1 align="center">Hello from JSP</h1>
<h1 align="center">Strona w budowie</h1>
<sec:authorize access="isAuthenticated()">
    <form  action="<c:url value="/logout"/>" method="post">
        <input align="center" type="submit" value="Wyloguj">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</sec:authorize>
</body>
</html>
