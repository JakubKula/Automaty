<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 02.06.2021
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Automaty</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
    <%@include file="dashboard.jsp"%>

    <div class="m-4 p-3 width-medium">
        <div class="m-4 p-3 border-dashed view-height">

            <div class="row border-bottom border-3 p-1 m-1">
                <div class="col noPadding">
                    <h3 class="color-header text-uppercase">Stan Automatu (${vending.addressNumber})</h3>
                </div>
                Wartość produktów w automacie (${value}) PLN
                <br><br>
                Gotówka w automacie (${vending.cash}) PLN
                <div class="col d-flex justify-content-end mb-2 noPadding">
                    <a href="/delivery/chooseCar" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Załadunek</a>
                </div>
            </div>

            <div class="schedules-content">
                <table class="table">
                    <thead>
                    <tr class="d-flex">
                        <th class="col-1">ID</th>
                        <th class="col-2">Nazwa</th>
                        <th class="col-2">Ilość w opakowaniu</th>
                        <th class="col-3">typ</th>
                        <th class="col-3">Ilość (sztuk)</th>
                        <th class="col-3">Cena</th>
                    </tr>
                    </thead>
                    <tbody class="text-dark-text">
                        <c:forEach items="${allProducts}" var="allProducts">
                        <tr class="d-flex">
                            <td class="col-1">
                                    ${allProducts.key.id}
                            </td>
                            <td class="col-2">
                                    ${allProducts.key.name}
                            </td>
                            <td class="col-2">
                                    ${allProducts.key.packSize}
                            </td>
                            <td class="col-3">
                                    ${allProducts.key.type}
                            </td>
                            <td class="col-3">
                                    ${allProducts.value}
                            </td>
                            <td class="col-3">
                            <c:forEach items="${allProductsPrices}" var="allProductsPrices">
                                <c:if test="${allProductsPrices.key.id.equals(allProducts.key.id)}">
                                    ${allProductsPrices.value}
                                </c:if>
                            </c:forEach>
                                PLN
                            </td>
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
