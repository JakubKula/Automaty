<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 24.05.2021
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Dostawa do magazynu</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
<%@include file="../dashboardDelivery.jsp"%>
<form:form method="post" modelAttribute="delivery" action="/delivery/delivery" cssClass="m-4 p-3 width-medium">

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <h1 class="text-color-darker">Dostawa </h1>
                <div class="form-group">
                    <br>Produkt<br>
                    <td><form:select path="product" items="${products}" itemLabel="fullName"  itemValue="id" />
                        <form:errors path="product"/></td>
                    <br>Ilość paczek:<br>
                    <td><form:input path="amount" />
                        <form:errors path="amount" /></td>

                    <br>Magazyn<br>
                    <td><form:select path="warehouse" items="${warehouses}" itemLabel="name" itemValue="id" />
                        <form:errors path="warehouse"/></td>
                </div>
                <div class="form-group">
                    <button class="btn btn-color rounded-0" type="submit">Dodaj dostawę</button>

                    <br><br>
                    <button id="dodaj-produkt" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4"> <i class="fa fa-plus-square-o"></i><a class="nav-link disabled" href="/product/add"/> Dodaj produkt</button>
                </div>
                </form:form>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
                </sec:authorize>



</body>
</html>
