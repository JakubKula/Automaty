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
    <title>Wybierz samochód</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
<%@include file="../dashboardDelivery.jsp"%>
<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                    <h1 class="text-color-darker">z jakiego samochodu?</h1>
                    <div class="form-group">
                        <form:form method="get" modelAttribute="vendingDelivery" action="/delivery/delete/car/product" cssClass="m-4 p-3 width-medium">
                            <form:select path="car" items="${cars}" itemLabel="markRegi" itemValue="id" />
                            <form:errors path="car"/>
                        <div class="form-group">
                            <button class="btn btn-color rounded-0" type="submit">Wybierz</button>
                            </form:form>
                        </div>
                    </div>
                    </div>
                    </div>



                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
                </sec:authorize>
</body>
</html>
