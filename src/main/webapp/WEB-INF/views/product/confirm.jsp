<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 24.05.2021
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Potwierdź</title>
</head>
<h1>Czy na pewno chcesz usunąć ten produkt?</h1>
<body>
<table>
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Pack Size</td>
        <td>Type</td>
    </tr>
    <tr>
        <td>${param.id}</td>
        <td>${param.name}</td>
        <td>${param.packSize}</td>
        <td>${param.type}</td>

    </tr>
</table>
<a href="<c:url value="/product/all"/>">Anuluj</a>
<a href="<c:url value="/product/remove/${param.id}"/>">Usuń</a>
</body>
</html>
