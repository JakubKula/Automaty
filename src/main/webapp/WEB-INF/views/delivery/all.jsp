
<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 28.05.2021
  Time: 09:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Produkty</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
<%@include file="dashboard.jsp"%>
<div class="m-4 p-3 width-medium" style="position:absolute; left: 250px">
    <div class="m-4 p-3 border-dashed view-height">


<div class="row border-bottom border-3 p-1 m-1">
    <div align="center" class="col noPadding" id="delivery">
        <h3 class="color-header text-uppercase">Dostawy (${user.username})</h3><div class="col d-flex justify-content-end mb-2 noPadding">
    </div>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-2">Ilość</th>
            <th class="col-3">Typ</th>
            <th class="col-4">Gdzie</th>
            <th class="col-5">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Delivery" items="${Delivery}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Delivery.product.fullName}
                </td>
                <td class="col-2">
                        ${Delivery.amount}
                </td>
                <td class="col-3">
                        ${Delivery.type}
                </td>
                <td class="col-4">
                    <strong>${Delivery.warehouse.name}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Delivery.data)}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="carDelivery">
        <h3 class="color-header text-uppercase">Załadunki samochodu</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-2">Ilość</th>
            <th class="col-3">Typ</th>
            <th class="col-4">Gdzie</th>
            <th class="col-5">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Zaladunek" items="${Zaladunek}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zaladunek.product.fullName}
                </td>
                <td class="col-2">
                        ${Zaladunek.amount}
                </td>
                <td class="col-3">
                        ${Zaladunek.type}
                </td>
                <td class="col-4">
                    <strong>${Zaladunek.warehouse.name}</strong>/
                     <strong>${Zaladunek.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Zaladunek.data)}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="vendingDelivery">
        <h3 class="color-header text-uppercase">Załadunki automatów</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-2">Ilość</th>
            <th class="col-3">Typ</th>
            <th class="col-4">Gdzie</th>
            <th class="col-5">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Zaladunek" items="${zaladunekV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zaladunek.product.fullName}
                </td>
                <td class="col-2">
                        ${Zaladunek.amount}
                </td>
                <td class="col-3">
                        ${Zaladunek.type}
                </td>
                <td class="col-4">
                    <strong>${Zaladunek.vending.addressNumber}</strong>/
                    <strong>${Zaladunek.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Zaladunek.data)}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="destroyed">
        <h3 class="color-header text-uppercase">Zniszczone</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-2">Ilość</th>
            <th class="col-3">Typ</th>
            <th class="col-4">Gdzie</th>
            <th class="col-5">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Zniszczone" items="${Zniszczone}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zniszczone.product.fullName}
                </td>
                <td class="col-2">
                        ${Zniszczone.amount}
                </td>
                <td class="col-3">
                        ${Zniszczone.type}
                </td>
                <td class="col-4">
                    <strong>${Zniszczone.warehouse.name}</strong>
                    <strong>${Zniszczone.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Zniszczone.data)}
                </td>
            </tr>
        </c:forEach>
        <c:forEach var="Zniszczone" items="${ZniszczoneV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zniszczone.product.fullName}
                </td>
                <td class="col-2">
                        ${Zniszczone.amount}
                </td>
                <td class="col-3">
                        ${Zniszczone.type}
                </td>
                <td class="col-4">
                    <strong>${Zniszczone.vending.addressNumber}</strong>
                    <strong>${Zniszczone.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Zniszczone.data)}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="outOfDate">
        <h3 class="color-header text-uppercase">Przeterminowane</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-2">Ilość</th>
            <th class="col-3">Typ</th>
            <th class="col-4">Gdzie</th>
            <th class="col-5">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Przeterminowane" items="${Przeterminowane}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Przeterminowane.product.fullName}
                </td>
                <td class="col-2">
                        ${Przeterminowane.amount}
                </td>
                <td class="col-3">
                        ${Przeterminowane.type}
                </td>
                <td class="col-4">
                    <strong>${Przeterminowane.warehouse.name}</strong>
                    <strong>${Przeterminowane.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Przeterminowane.data)}
                </td>
            </tr>
        </c:forEach>
        <c:forEach var="Przeterminowane" items="${PrzeterminowaneV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Przeterminowane.product.fullName}
                </td>
                <td class="col-2">
                        ${Przeterminowane.amount}
                </td>
                <td class="col-3">
                        ${Przeterminowane.type}
                </td>
                <td class="col-4">
                    <strong>${Przeterminowane.vending.addressNumber}</strong>
                    <strong>${Przeterminowane.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Przeterminowane.data)}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="sold" >
        <h3 class="color-header text-uppercase">Sprzedane</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-2">Ilość</th>
            <th class="col-3">Typ</th>
            <th class="col-4">Gdzie</th>
            <th class="col-5">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Sprzedane" items="${Sprzedane}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Sprzedane.product.fullName}
                </td>
                <td class="col-2">
                        ${Sprzedane.amount}
                </td>
                <td class="col-3">
                        ${Sprzedane.type}
                </td>
                <td class="col-4">
                    <strong>${Sprzedane.warehouse.name}</strong>
                    <strong>${Sprzedane.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Sprzedane.data)}
                </td>
            </tr>
        </c:forEach>
        <c:forEach var="Sprzedane" items="${SprzedaneV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Sprzedane.product.fullName}
                </td>
                <td class="col-2">
                        ${Sprzedane.amount}
                </td>
                <td class="col-3">
                        ${Sprzedane.type}
                </td>
                <td class="col-4">
                    <strong>${Sprzedane.vending.addressNumber}</strong>
                    <strong>${Sprzedane.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Sprzedane.data)}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="eaten" >
        <h3 class="color-header text-uppercase">Zjedzone</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-2">Ilość</th>
            <th class="col-3">Typ</th>
            <th class="col-4">Gdzie</th>
            <th class="col-5">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Zjedzone" items="${Zjedzone}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zjedzone.product.fullName}
                </td>
                <td class="col-2">
                        ${Zjedzone.amount}
                </td>
                <td class="col-3">
                        ${Zjedzone.type}
                </td>
                <td class="col-4">
                    <strong>${Zjedzone.warehouse.name}</strong>
                    <strong>${Zjedzone.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Zjedzone.data)}
                </td>
            </tr>
        </c:forEach>
        <c:forEach var="Zjedzone" items="${ZjedzoneV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zjedzone.product.fullName}
                </td>
                <td class="col-2">
                        ${Zjedzone.amount}
                </td>
                <td class="col-3">
                        ${Zjedzone.type}
                </td>
                <td class="col-4">
                    <strong>${Zjedzone.vending.addressNumber}</strong>
                    <strong>${Zjedzone.car.markRegi}</strong>
                </td>
                <td class="col-5">
                        ${formatter.format(Zjedzone.data)}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </sec:authorize>

<sec:authorize access="isAnonymous()">
    <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
</sec:authorize>
</body>
</html>
