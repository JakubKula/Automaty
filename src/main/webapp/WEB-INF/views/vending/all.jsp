<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 28.05.2021
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Cars</title>
</head>
<body>
<%@include file="../header.jsp"%>
<sec:authorize access="isAuthenticated()">
    <%@include file="dashboard.jsp"%>

    <div class="m-4 p-3 width-medium">
        <div class="m-4 p-3 border-dashed view-height">

            <div class="row border-bottom border-3 p-1 m-1">
                <div class="col noPadding">
                    <h3 class="color-header text-uppercase">Automaty</h3>
                </div>
                <div class="col d-flex justify-content-end mb-2 noPadding">
                    <a href="/" class="btn btn-success rounded-0 pt-0 pb-0 pr-4 pl-4">Powrót</a>
                </div>
            </div>

            <div class="schedules-content">
                <table class="table">
                    <thead>
                    <tr class="d-flex">
                        <th class="col-1">ID</th>
                        <th class="col-1">Adres</th>
                        <th class="col-2">Marka</th>
                        <th class="col-3">Model</th>
                        <th class="col-3">Numer</th>
                        <th class="col-1 center">AKCJE</th>
                    </tr>
                    </thead>
                    <tbody class="text-dark-text">
                    <c:forEach items="${vending}" var="vending">
                        <tr class="d-flex">
                            <td class="col-1">
                                    ${vending.id}
                            </td>
                            <td class="col-1">
                                    ${vending.address}
                            </td>
                            <td class="col-2">
                                    ${vending.mark}
                            </td>
                            <td class="col-3">
                                    ${vending.model}
                            </td>
                            <td class="col-3">
                                    ${vending.number}
                            </td>
                            <td><a href="/vending/edit/${vending.id}" class="btn btn-danger rounded-0 text-light m-1">Edytuj</a> </td>
                            <td><a href="/vending/confirm?id=${vending.id}&address=${vending.address}&mark=${vending.mark}&model=${vending.model}&number=${vending.number}" class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
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
</table>
</body>
</html>
