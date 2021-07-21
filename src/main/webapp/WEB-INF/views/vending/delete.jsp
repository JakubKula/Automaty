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
    <title>Usuniecie z automatu</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
<%@include file="../dashboardDelivery.jsp"%>
<form:form method="post" modelAttribute="vendingDelivery" action="/delivery/delete/vending/product" cssClass="m-4 p-3 width-medium">

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div align="flex-direction: column">
                <div col>

                    <table cellspacing="0" cellpadding="0" border="0" style="width: 100%">
                        <tbody>
                        <tr>
                            <td rowspan="2">
                                <h1 class="text-color-darker" align="center">Usunięcie produktu z automatu</h1>
                                <div class="form-group" align="center">
                                    <br>Produkt<br>
                                    <form:select path="product" items="${allProducts.keySet()}" itemLabel="fullName"  itemValue="id"  id="select"/>
                                    <form:errors path="product"/>
                                    <br>Ilość <div id="max-amount"></div>
                                    <form:input path="amount" /><br>
                                    <form:errors path="amount" />
                                    <br>Powód<br>
                                    <form:select path="type" items="${why}"  />
                                    <form:errors path="type"/>
                                    <br>Wybrany automat<br>
                                    (${vending.addressNumber})
                                </div>
                                <div class="form-group" align="center">
                                    <button class="btn btn-color rounded-0" type="submit" >Usuń produkty</button>
                                </div>
                            </td>
                        </tr>
                        <td colspan="2" align="center">
                            <br><br>
                            <h4>Dostępne ilości</h4>
                            Automat<br>(${vending.addressNumber})<br>
                            <c:forEach items="${allProducts}" var="allProducts">
                                <br>
                                ${allProducts.key.fullName}
                                <h6>Ilość dostępna: <strong>${allProducts.value}</strong></h6>

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
