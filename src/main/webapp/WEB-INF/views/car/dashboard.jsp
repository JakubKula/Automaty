<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 31.05.2021
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<section class="dashboard-section">
  <div class="row dashboard-nowrap">
    <ul class="nav flex-column long-bg">
      <li class="nav-item">
        <a class="nav-link" href="/car/add">
          <span class="nav-link color-header" >Dodaj Samochód</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>

      <c:forEach var="cars" items="${cars}" >
      <li class="nav-item">
        <a class="nav-link" href="/car/${cars.id}">
          <span>${cars.markRegi}</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      </c:forEach>

    </ul>

