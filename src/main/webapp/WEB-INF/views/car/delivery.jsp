<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 29.05.2021
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="dostawa.js" type="text/javascript"></script>


<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Dostawa</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
<%@include file="../dashboardDelivery.jsp"%>
<form:form method="post" modelAttribute="delivery" action="/delivery/car/delivery" cssClass="m-4 p-3 width-medium">
<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div align="flex-direction: column">
                <div col>

                    <table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
                        <tbody>
                            <tr>
                                <td rowspan="2">
                                    <h1 class="text-color-darker" align="center">Załadunek samochodu</h1>
                                    <div class="form-group" align="center">
                                        <br>Produkt<br>
                                        <form:select path="product" items="${productsAvailable.keySet()}" itemLabel="fullName"  itemValue="id"  id="select"/>
                                        <form:errors path="product"/>
                                        <br>Ilość paczek<br>
                                        <form:input path="amount" /><br>
                                        <form:errors path="amount" />
                                        <br>Magazyn<br>
                                        <form:select path="warehouse" items="${warehouses}" itemLabel="name" itemValue="id" />
                                        <form:errors path="warehouse"/>
                                        <br>Samochód<br>
                                        <form:select path="car" items="${cars}" itemLabel="markRegi" itemValue="id" />
                                        <form:errors path="car"/>
                                    </div>
                                    <div class="form-group" align="center">
                                        <button class="btn btn-color rounded-0" type="submit" >Wyślij załadunek</button>
                                    </div>
                                </td>
                            </tr>
                            <td colspan="2" align="center">
                                <br><br>
                                <h4>Dostępne ilości</h4>
                                <c:forEach items="${productsAvailable}" var="productsAvailable">
                                    <br>
                                    ${productsAvailable.key.fullName}
                                    <h6>Dostepna ilość sztuk: <strong>
                                        ${productsAvailable.value}
                                    </strong></h6>


                                </c:forEach>
                            </td>
                            </tr>
                        </tbody>
                    </table>



            </div>


</form:form>
</sec:authorize>
<sec:authorize access="isAnonymous()">
    <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
</sec:authorize>
</body>
</html>
