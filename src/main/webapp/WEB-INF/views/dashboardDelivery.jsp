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
        <a class="nav-link" href="/delivery/delivery">
          <span>Dostawa</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/delivery/car/delivery">
          <span>Załadunek samochodu</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/delivery/chooseCar">
          <span>Załadunek automatu</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/delivery/warehouse/delete">
          <span>Usuniecie produktu z magazynu</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/delivery/chooseCar1">
          <span>Usuniecie produktu z samochodu</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/delivery/chooseVending">
          <span>Usuniecie produktu z automatu</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/vending/chooseVending">
          <span>Ustaw ceny na automacie</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
    </ul>

