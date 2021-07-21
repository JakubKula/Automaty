<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 25.05.2021
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <form class="padding-small text-center" action="<c:url value="/logout"/>" method="post">
                    <h1 class="text-color-darker">Zalogowany jako (<sec:authentication property = "principal.username"/>), czy chcesz sie wylogować?</h1>
                    <input class="btn btn-color rounded-0" type="submit" value="Wyloguj"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</section>
</sec:authorize>
<sec:authorize access="isAnonymous()">
    <h1 align="center">Nie jesteś zalogowany</h1>
</sec:authorize>
</body>
</html>
