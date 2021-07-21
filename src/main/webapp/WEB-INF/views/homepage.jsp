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

<sec:authorize access="isAnonymous()">
    <h1 align="center">Witaj, zaloguj sie</h1>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <h1 align="center">Witaj <sec:authentication property = "principal.username"/></h1>
</sec:authorize>
</body>
</html>
