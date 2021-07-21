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
    <title>Dodawanie samochodu</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
<%@include file="dashboard.jsp"%>

<form:form method="post" modelAttribute="car" action="/car/add" cssClass="m-4 p-3 width-medium">

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                    <h1 class="text-color-darker">Dodawanie samochodu</h1>
                    <div class="form-group">
                        <br>Marka<br>
                        <form:input path="mark"/>
                        <form:errors path="mark"/>
                        <br>Model<br>
                        <form:input path="model"/>
                        <form:errors path="model"/>
                        <br>Rejestracja<br>
                        <th><form:input path="registration"/></th>
                        <form:errors path="registration"/>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-color rounded-0" type="submit">Dodaj</button>
                    </div>
</form:form>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
                </sec:authorize>
</body>
</html>
