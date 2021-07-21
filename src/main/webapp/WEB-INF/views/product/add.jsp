<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 31.05.2021
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj produkt</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">

<form:form method="post" modelAttribute="product" action="/product/add" cssClass="m-4 p-3 width-medium">

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <h1 class="text-color-darker">Dodawanie produktu</h1>
                <div class="form-group">
                    <br>Nazwa<br>
                    <form:input path="name"/>
                    <form:errors path="name"/>
                    <br>
                    <br>Ilość w opakowaniu<br>
                    <form:input path="packSize"/>
                    <form:errors path="packSize"/>
                    <br>
                    <br>Typ<br>
                    <form:select path="type" items="${type}"  />
                    <form:errors path="type"/>
                    <br>
                    <br>Waga/Objętość<br>
                    <form:input path="weight"/>
                    <form:errors path="weight"/>
                    <br>
                    <br>Opis<br>
                    <form:input path="description"/>
                    <form:errors path="description"/>
                    <br><br>
                </div>
                <div class="form-group">
                    <button class="btn btn-color rounded-0" type="submit">Dodaj produkt</button>
                </div>
                </form:form>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
                </sec:authorize>
</body>
</html>
