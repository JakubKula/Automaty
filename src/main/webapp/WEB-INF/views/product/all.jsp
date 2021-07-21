
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


    <div class="m-4 p-3 width-medium">
        <div class="m-4 p-3 border-dashed view-height">

            <div class="row border-bottom border-3 p-1 m-1">
                <div class="col noPadding">
                    <h3 class="color-header text-uppercase">Produkty</h3>
                </div>
                <div class="col d-flex justify-content-end mb-2 noPadding">
                    <a href="/product/add" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Dodaj produkt</a>
                </div>
            </div>

            <div class="schedules-content">
                <table class="table">
                    <thead>
                    <tr class="d-flex">
                        <th class="col-1">Nazwa</th>
                        <th class="col-1">Rozmiar opakowania</th>
                        <th class="col-2">Typ</th>
                        <th class="col-2">Opis</th>
                        <th class="col-3">Waga/Objętość</th>
                        <th class="col-1 center">AKCJE</th>
                    </tr>
                    </thead>
                    <tbody class="text-dark-text">
                    <c:forEach var="items" items="${items}" >
                        <tr class="d-flex">
                            <td class="col-1">
                                    ${items.name}
                            </td>
                            <td class="col-1">
                                    ${items.packSize}
                            </td>
                            <td class="col-2">
                                    ${items.type}
                            </td>
                            <td class="col-2">
                                    ${items.description}
                            </td>
                            <td class="col-2">
                                <c:choose>
                                <c:when test="${items.type.equals('puszka')||items.type.equals('PET')}" >
                            <td>${items.weight} ml</td>
                            </c:when>
                            <c:otherwise>
                                <td>${items.weight} g</td>
                            </c:otherwise>
                            </c:choose>
                            </td>
                            <td><a href="/product/edit/${items.id}" class="btn btn-danger rounded-0 text-light m-1">Edytuj</a> </td>
                            <td><a href="/product/confirm?id=${items.id}&name=${items.name}&packSize=${items.packSize}&type=${items.type}" class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    </div>
    </section>

</sec:authorize>
<sec:authorize access="isAnonymous()">
    <h1 align="center">Aby zobaczyć treści musisz być zalogowany</h1>
</sec:authorize>
</body>
</html>
