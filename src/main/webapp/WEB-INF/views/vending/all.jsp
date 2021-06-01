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
    <title>Vending</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    <%--<p> Zalogowany jako: <sec:authentication property = "username"/></p>--%>
<h1>Vendingi</h1>
<table>
    <tr>
        <th>Id</th>
        <th>Adres</th>
        <th>Marka</th>
        <th>Model</th>
        <th>Numer</th>
    </tr>
    <c:forEach items="${vending}" var="vending">
        <tr>
            <td>${vending.id}</td>
            <td>${vending.address}</td>
            <td>${vending.mark}</td>
            <td>${vending.model}</td>
            <td>${vending.number}</td>
            <td><a href="/vending/edit/${vending.id}">Edytuj</a> </td>
            <td><a href="/vending/confirm?id=${vending.id}&address=${vending.address}&mark=${vending.mark}
            &model=${vending.model}&number=${vending.number}">Usuń</a> </td>
        </tr>
    </c:forEach>
    </sec:authorize>
</table>
</body>
</html>
