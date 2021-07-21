<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 28.05.2021
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Potwierdź</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">

<div class="m-4 p-3 width-medium">
    <div class="m-4 p-3 border-dashed view-height">

        <div class="row border-bottom border-3 p-1 m-1">
            <div class="col noPadding">
                <h3 class="color-header text-uppercase">Czy na pewno chcesz usunąć tą dostawę?</h3>
            </div>
            <div class="col d-flex justify-content-end mb-2 noPadding">
                <a href="/" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Powrót</a>
            </div>
        </div>

        <div class="schedules-content">
            <table class="table">
                <thead>
                <tr class="d-flex">
                    <th class="col-1">Produkt</th>
                    <th class="col-2">Ilość</th>
                    <th class="col-3">Typ</th>
                    <th class="col-3">Gdzie</th>
                    <th class="col-4">Data</th>
                    <th class="col-1 center">AKCJE</th>
                </tr>
                </thead>
            <tbody class="text-dark-text">
                <tr class="d-flex">
                <td class="col-1">${param.product}</td>
                <td class="col-2">${param.amount}</td>
                <td class="col-3">${param.type}</td>
                <td class="col-3">${param.where}</td>
                <td class="col-4">${param.data}</td>

                <td><a href="/delivery/for/all/delivery" class="btn btn-success ">Anuluj</a> </td>
                <td><a href="/delivery/remove/${param.id}" class="btn btn-danger rounded-0 text-light m-1">Usuń</a></td>
                </tr>
            </tbody>
            </table>
        </div>
    </div>
</div>

</sec:authorize>
<sec:authorize access="isAnonymous()">
    <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
</sec:authorize>
</body>
</html>
