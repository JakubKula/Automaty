<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 27.05.2021
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<%@include file="../header.jsp"%>

<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                <form class="padding-small text-center" action="/login" method="post">
                    <h1>Rejestracja</h1>
                    <form:form method="post" modelAttribute="user">
                        <br>Nazwa użytkownika<br>
                        <form:input path="username" placeholder="podaj nazwę użytkownika" />
                        <form:errors path="username"/>
                        <br>Hasło<br>
                        <form:input path="password" placeholder="podaj hasło" />
                        <form:errors path="password"/>
                        <br><br>
                        <input class="btn btn-color rounded-0" type="submit" value="Zarejestruj"/>
                    </form:form>
                </form>
            </div>
        </div>
    </div>
</section>

</body>
</html>
