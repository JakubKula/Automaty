<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 28.05.2021
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja Automatu</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
<%@include file="dashboard.jsp"%>

<form:form method="post" modelAttribute="vending" action="/vending/update" cssClass="m-4 p-3 width-medium">

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                    <h1 class="text-color-darker">Edycja automatu</h1>
                    <div class="form-group">
                        <form:hidden path="id"/>
                        <br>Adres<br>
                        <form:input path="address"/>
                        <br>Marka<br>
                        <form:input path="mark" />
                        <br>Model<br>
                        <form:input path="model"/>
                        <br>Numer<br>
                        <th><form:input path="number"/></th>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-color rounded-0" type="submit">Zmień</button>
                    </div>
</form:form>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
                </sec:authorize>
</body>
</html>
