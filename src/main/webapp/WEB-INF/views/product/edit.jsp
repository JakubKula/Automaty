<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 24.05.2021
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edytuj produkt</title>
</head>
<body>
<form:form method="post" modelAttribute="product" action="/products/update">
    <table>
        <tr>
            <th>Name</th>
            <th>Pack Size</th>
            <th>Type</th>
            <th>Description</th>
            <th>Weight</th>
        </tr>
        <tr>
            <form:hidden path="id"/>
            <th><form:input path="name" /></th>
            <th><form:input path="packSize"/></th>
            <th><form:select path="type" items="${type}"/></th>
            <th><form:input path="description"/></th>
            <th><form:input path="weight"/></th>
        </tr>
    </table>
    <button type="submit">Zmień</button>
</form:form>
</body>
</html>
