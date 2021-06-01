<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 20.05.2021
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Warehouse</title>
<%--    <h1><spring:message code="app.title"/></h1>--%>
</head>
<body>
    <table>
        <tr>
            <th>Id</th>
            <th>name</th>
            <th>pack Size</th>
            <th>type</th>
            <th>amount</th>
        </tr>
        <c:forEach items="${allProducts}" var="allProducts">
            <tr>
                <td>${allProducts.key.id}</td>
                <td>${allProducts.key.name}</td>
                <td>${allProducts.key.packSize}</td>
                <td>${allProducts.key.type}</td>
                <td>${allProducts.value}</td>
            </tr>
        </c:forEach>
    </table>
<button ><a class="nav-link disabled" href="/delivery/delivery"/>Dostawa</button>
</body>
</html>
