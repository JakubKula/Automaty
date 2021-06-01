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
                    <h3 class="color-header text-uppercase">Samochody</h3>
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
                        <th class="col-2">Marka</th>
                        <th class="col-3">Model</th>
                        <th class="col-4">Registration</th>
                        <th class="col-1 center">AKCJE</th>
                    </tr>
                    </thead>
                    <tbody class="text-dark-text">
                    <c:forEach var="cars" items="${cars}" >
                        <tr class="d-flex">
                            <td class="col-1">
                                    ${cars.id}
                            </td>
                            <td class="col-2">
                                    ${cars.mark}
                            </td>
                            <td class="col-3">
                                    ${cars.model}
                            </td>
                            <td class="col-4">
                                    ${cars.registration}
                            </td>
                            <td><a href="/car/edit/${cars.id}" class="btn btn-danger rounded-0 text-light m-1">Edytuj</a> </td>
                            <td><a href="/car/confirm?id=${cars.id}&mark=${cars.mark}&model=${cars.model}&registration=${cars.registration}" class="btn btn-danger rounded-0 text-light m-1">Usuń</a> </td>
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
