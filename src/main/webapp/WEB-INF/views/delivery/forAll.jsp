
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
<div class="m-4 p-3 width-medium" style="position:absolute; left: 220px; max-width: 1500px">
    <div class="m-4 p-3 border-dashed view-height">


<div class="row border-bottom border-3 p-1 m-1">
    <div align="center" class="col noPadding" id="delivery">
        <h3 class="color-header text-uppercase">Wszystkie dostawy</h3>
    </div>
</div>
<div style="max-width: 1500px">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-1">Ilość</th>
            <th class="col-2">Typ</th>
            <th class="col-3">Gdzie</th>
            <th class="col-3">Użytkownik</th>
            <th class="col-4">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Delivery" items="${Delivery}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Delivery.product.fullName}
                </td>
                <td class="col-1">
                        ${Delivery.amount}
                </td>
                <td class="col-2">
                        ${Delivery.type}
                </td>
                <td class="col-3">
                    <strong>${Delivery.warehouse.name}</strong>
                </td>
                <td class="col-3">
                    <strong>${Delivery.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Delivery.data)}
                </td>
                <td><a href="/delivery/confirm?id=${Delivery.id}&product=${Delivery.product.fullName}&amount=${Delivery.amount}
                &type=${Delivery.type}&where=${Delivery.warehouse.name}&data=${formatter.format(Delivery.data)}"
                             class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="carDelivery">
        <h3 class="color-header text-uppercase">Wszystkie załadunki samochodu</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-1">Ilość</th>
            <th class="col-2">Typ</th>
            <th class="col-3">Gdzie</th>
            <th class="col-3">Użytkownik</th>
            <th class="col-4">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Zaladunek" items="${Zaladunek}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zaladunek.product.fullName}
                </td>
                <td class="col-1">
                        ${Zaladunek.amount}
                </td>
                <td class="col-2">
                        ${Zaladunek.type}
                </td>
                <td class="col-3">
                    <strong>${Zaladunek.warehouse.name}</strong>/
                     <strong>${Zaladunek.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Zaladunek.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Zaladunek.data)}
                </td>
                <td><a href="/delivery/confirm?id=${Zaladunek.id}&product=${Zaladunek.product.fullName}&amount=${Zaladunek.amount}
                &type=${Zaladunek.type}&where=${Zaladunek.warehouse.name}/${Zaladunek.car.markRegi}&data=${formatter.format(Zaladunek.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="vendingDelivery">
        <h3 class="color-header text-uppercase">Wszystkie załadunki automatów</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-1">Ilość</th>
            <th class="col-2">Typ</th>
            <th class="col-3">Gdzie</th>
            <th class="col-3">Użytkownik</th>
            <th class="col-4">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Zaladunek" items="${zaladunekV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zaladunek.product.fullName}
                </td>
                <td class="col-1">
                        ${Zaladunek.amount}
                </td>
                <td class="col-2">
                        ${Zaladunek.type}
                </td>
                <td class="col-3">
                    <strong>${Zaladunek.vending.addressNumber}</strong>/
                    <strong>${Zaladunek.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Zaladunek.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Zaladunek.data)}
                </td>
                <td><a href="/delivery/confirm1?id=${Zaladunek.id}&product=${Zaladunek.product.fullName}&amount=${Zaladunek.amount}
                &type=${Zaladunek.type}&where=${Zaladunek.vending.addressNumber}/${Zaladunek.car.markRegi}&data=${formatter.format(Zaladunek.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="destroyed">
        <h3 class="color-header text-uppercase">Wszystkie zniszczone</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-1">Ilość</th>
            <th class="col-2">Typ</th>
            <th class="col-3">Gdzie</th>
            <th class="col-3">Użytkownik</th>
            <th class="col-4">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Zniszczone" items="${Zniszczone}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zniszczone.product.fullName}
                </td>
                <td class="col-1">
                        ${Zniszczone.amount}
                </td>
                <td class="col-2">
                        ${Zniszczone.type}
                </td>
                <td class="col-3">
                    <strong>${Zniszczone.warehouse.name}</strong>
                    <strong>${Zniszczone.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Zniszczone.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Zniszczone.data)}
                </td>
                <td><a href="/delivery/confirm?id=${Zniszczone.id}&product=${Zniszczone.product.fullName}&amount=${Zniszczone.amount}
                &type=${Zniszczone.type}&where=${Zniszczone.warehouse.name}/${Zniszczone.car.markRegi}&data=${formatter.format(Zniszczone.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>
        </c:forEach>
        <c:forEach var="Zniszczone" items="${ZniszczoneV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zniszczone.product.fullName}
                </td>
                <td class="col-1">
                        ${Zniszczone.amount}
                </td>
                <td class="col-2">
                        ${Zniszczone.type}
                </td>
                <td class="col-3">
                    <strong>${Zniszczone.vending.addressNumber}</strong>
                    <strong>${Zniszczone.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Zniszczone.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Zniszczone.data)}
                </td>
                <td><a href="/delivery/confirm1?id=${Zniszczone.id}&product=${Zniszczone.product.fullName}&amount=${Zniszczone.amount}
                &type=${Zniszczone.type}&where=${Zniszczone.vending.addressNumber}/${Zniszczone.car.markRegi}&data=${formatter.format(Zniszczone.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="outOfDate">
        <h3 class="color-header text-uppercase">Wszystkie przeterminowane</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-1">Ilość</th>
            <th class="col-2">Typ</th>
            <th class="col-3">Gdzie</th>
            <th class="col-3">Użytkownik</th>
            <th class="col-4">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Przeterminowane" items="${Przeterminowane}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Przeterminowane.product.fullName}
                </td>
                <td class="col-1">
                        ${Przeterminowane.amount}
                </td>
                <td class="col-2">
                        ${Przeterminowane.type}
                </td>
                <td class="col-3">
                    <strong>${Przeterminowane.warehouse.name}</strong>
                    <strong>${Przeterminowane.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Przeterminowane.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Przeterminowane.data)}
                </td>
                <td><a href="/delivery/confirm?id=${Przeterminowane.id}&product=${Przeterminowane.product.fullName}&amount=${Przeterminowane.amount}
                &type=${Przeterminowane.type}&where=${Przeterminowane.warehouse.name}/${Przeterminowane.car.markRegi}&data=${formatter.format(Przeterminowane.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>
        </c:forEach>
        <c:forEach var="Przeterminowane" items="${PrzeterminowaneV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Przeterminowane.product.fullName}
                </td>
                <td class="col-1">
                        ${Przeterminowane.amount}
                </td>
                <td class="col-2">
                        ${Przeterminowane.type}
                </td>
                <td class="col-3">
                    <strong>${Przeterminowane.vending.addressNumber}</strong>
                    <strong>${Przeterminowane.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Przeterminowane.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Przeterminowane.data)}
                </td>
                <td><a href="/delivery/confirm1?id=${Przeterminowane.id}&product=${Przeterminowane.product.fullName}&amount=${Przeterminowane.amount}
                &type=${Przeterminowane.type}&where=${Przeterminowane.vending.addressNumber}/${Przeterminowane.car.markRegi}&data=${formatter.format(Przeterminowane.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="sold" >
        <h3 class="color-header text-uppercase">Wszystkie sprzedane</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-1">Ilość</th>
            <th class="col-2">Typ</th>
            <th class="col-3">Gdzie</th>
            <th class="col-3">Użytkownik</th>
            <th class="col-4">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Sprzedane" items="${Sprzedane}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Sprzedane.product.fullName}
                </td>
                <td class="col-1">
                        ${Sprzedane.amount}
                </td>
                <td class="col-2">
                        ${Sprzedane.type}
                </td>
                <td class="col-3">
                    <strong>${Sprzedane.warehouse.name}</strong>
                    <strong>${Sprzedane.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Sprzedane.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Sprzedane.data)}
                </td>
                <td><a href="/delivery/confirm?id=${Sprzedane.id}&product=${Sprzedane.product.fullName}&amount=${Sprzedane.amount}
                &type=${Sprzedane.type}&where=${Sprzedane.warehouse.name}/${Sprzedane.car.markRegi}&data=${formatter.format(Sprzedane.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>
        </c:forEach>
        <c:forEach var="Sprzedane" items="${SprzedaneV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Sprzedane.product.fullName}
                </td>
                <td class="col-1">
                        ${Sprzedane.amount}
                </td>
                <td class="col-2">
                        ${Sprzedane.type}
                </td>
                <td class="col-3">
                    <strong>${Sprzedane.vending.addressNumber}</strong>
                    <strong>${Sprzedane.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Sprzedane.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Sprzedane.data)}
                </td>
            </tr>
            <td><a href="/delivery/confirm1?id=${Sprzedane.id}&product=${Sprzedane.product.fullName}&amount=${Sprzedane.amount}
                &type=${Sprzedane.type}&where=${Sprzedane.vending.addressNumber}/${Sprzedane.car.markRegi}&data=${formatter.format(Sprzedane.data)}"
                   class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
        </c:forEach>
        </tbody>
    </table>
    <div align="center" class="col noPadding" id="eaten" >
        <h3 class="color-header text-uppercase">Wszystkie zjedzone</h3>
    </div>
</div>
<div class="schedules-content">
    <table class="table">
        <thead>
        <tr class="d-flex">
            <th class="col-1">Produkt</th>
            <th class="col-1">Ilość</th>
            <th class="col-2">Typ</th>
            <th class="col-3">Gdzie</th>
            <th class="col-3">Użytkownik</th>
            <th class="col-4">Data</th>

        </tr>
        </thead>
        <tbody class="text-dark-text">
        <c:forEach var="Zjedzone" items="${Zjedzone}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zjedzone.product.fullName}
                </td>
                <td class="col-1">
                        ${Zjedzone.amount}
                </td>
                <td class="col-2">
                        ${Zjedzone.type}
                </td>
                <td class="col-3">
                    <strong>${Zjedzone.warehouse.name}</strong>
                    <strong>${Zjedzone.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Zjedzone.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Zjedzone.data)}
                </td>
                <td><a href="/delivery/confirm?id=${Zjedzone.id}&product=${Zjedzone.product.fullName}&amount=${Zjedzone.amount}
                &type=${Zjedzone.type}&where=${Zjedzone.warehouse.name}/${Zjedzone.car.markRegi}&data=${formatter.format(Zjedzone.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
            </tr>
        </c:forEach>
        <c:forEach var="Zjedzone" items="${ZjedzoneV}" >
            <tr class="d-flex">
                <td class="col-1">
                        ${Zjedzone.product.fullName}
                </td>
                <td class="col-1">
                        ${Zjedzone.amount}
                </td>
                <td class="col-2">
                        ${Zjedzone.type}
                </td>
                <td class="col-3">
                    <strong>${Zjedzone.vending.addressNumber}</strong>
                    <strong>${Zjedzone.car.markRegi}</strong>
                </td>
                <td class="col-3">
                    <strong>${Zjedzone.user.username}</strong>
                </td>
                <td class="col-4">
                        ${formatter.format(Zjedzone.data)}
                </td>
                <td><a href="/delivery/confirm1?id=${Zjedzone.id}&product=${Zjedzone.product.fullName}&amount=${Zjedzone.amount}
                &type=${Zjedzone.type}&where=${Zjedzone.vending.addressNumber}/${Zjedzone.car.markRegi}&data=${formatter.format(Zjedzone.data)}"
                       class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
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
