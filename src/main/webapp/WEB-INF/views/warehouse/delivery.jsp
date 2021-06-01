<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 24.05.2021
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="dostawa.js" type="text/javascript"></script>


<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Dostawa</title>
</head>
<body>
<form:form method="post" modelAttribute="delivery">
    <table>
        <thead>
        <tr>
            <td>Produkt</td>
            <td>Ilość</td>
            <td>Magazyn</td>
        </tr>
        </thead>
        <tr>
            <td><form:select path="product" items="${products}" itemLabel="fullName"  itemValue="id" />
            <form:errors path="product"/></td>

            <td><form:input path="amount"/>
            <form:errors path="amount"/></td>

            <td><form:select path="warehouse" items="${warehouses}" itemLabel="name" itemValue="id" />
            <form:errors path="warehouse"/></td>
        </tr>

    </table>
    <br>
    <button id="dodaj-produkt"> <i class="fa fa-plus-square-o"></i><a class="nav-link disabled" href="/product/add"/> Dodaj produkt</button>
    <br>
    <input type="submit" value="Wyślij dostawę">
</form:form>

</body>
</html>
