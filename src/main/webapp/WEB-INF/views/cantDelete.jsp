<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 25.05.2021
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<%@include file="header.jsp"%>
<section class="dashboard-section">
    <div class="container pt-4 pb-4">
        <div class="border-dashed view-height">
            <div class="container w-25">
                    <h1 class="text-color-darker">Nie możesz usunąć gdy przedmiot ma na stanie jakieś produkty.</h1>

            </div>
        </div>
    </div>
</section>

</body>
</html>
