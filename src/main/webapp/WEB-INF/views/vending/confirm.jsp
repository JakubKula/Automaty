<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 28.05.2021
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Potwierdź</title>
</head>
<body>
<h1>Czy na pewno chcesz usunąć ten vending?</h1>
<table>
    <tr>
        <td>Id</td>
        <td>Adres</td>
        <td>Marka</td>
        <td>Model</td>
        <td>Numer</td>
    </tr>
    <tr>
        <td>${param.id}</td>
        <td>${param.address}</td>
        <td>${param.mark}</td>
        <td>${param.model}</td>
        <td>${param.number}</td>

    </tr>
</table>
<a href="<c:url value="/vending/all"/>">Anuluj</a>
<a href="<c:url value="/vending/remove/${param.id}"/>">Usuń</a>
</body>
</html>
