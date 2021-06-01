<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 28.05.2021
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja vendingu</title>
</head>
<body>
<form:form method="post" modelAttribute="vending" action="/vending/update">
    <table>
        <tr>
            <th>Adres</th>
            <th>Marka</th>
            <th>Model</th>
            <th>Numer</th>
        </tr>
        <tr>
            <form:hidden path="id"/>
            <th><form:input path="address" /></th>
            <th><form:input path="mark" /></th>
            <th><form:input path="model"/></th>
            <th><form:input path="number"/></th>
        </tr>
    </table>
    <button type="submit">Zmień</button>
</form:form>
</body>
</body>
</html>
