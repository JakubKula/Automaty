<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 31.05.2021
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj produkt</title>
</head>
<body>
<h1>Dodawanie produktu</h1>
<form:form method="post" modelAttribute="product">
    <br>Nazwa<br>
    <form:input path="name"/>
    <form:errors path="name"/>
    <br>
    <br>Ilość w opakowaniu<br>
    <form:input path="packSize"/>
    <form:errors path="packSize"/>
    <br>
    <br>Typ<br>
    <form:select path="type" items="${type}"  />
    <form:errors path="type"/>
    <br>
    <br>Waga/Objętość<br>
    <form:input path="weight"/>
    <form:errors path="weight"/>
    <br>
    <br>Opis<br>
    <form:input path="description"/>
    <form:errors path="description"/>
    <br><br>

    <input type="submit" value="Dodaj produkt">
</form:form>
</body>
</html>
