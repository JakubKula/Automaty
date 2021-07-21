<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 31.05.2021
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<style>
  /* ------------------------CZĘŚĆ-ROZWIJANA-MENU------------------------ */

  /* wygląd głównych rozwijanych elementów - ul */
  ol{
    position: fixed;

  }
  ol > li > ul {
    display:none;
    list-style-type:none;
    padding:0;
    margin:0;
  }

  /* wygląd elementu - li - w części rozwijanej */
  ol > li > ul > li {
    position:relative;

  }

  /* wygląd elementu - a - w części rozwijanej */
  ol > li > ul > li > a {
    border-top:1px solid #FFF;
  }



</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<section class="dashboard-section" style="margin-top: -23px">
  <div class="row dashboard-nowrap">
    <ol>
      <li>
    <ul class="nav flex-column long-bg">
      <li class="nav-item">
        <a class="nav-link" href="#delivery">
          <span>Dostawy</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#carDelivery">
          <span>Załadunki samochodu</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#vendingDelivery">
          <span>Załadunki automatu</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#destroyed">
          <span>Zniszczone</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#outOfDate">
          <span>Przeterminowane</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="#sold">
        <span>Sprzedane</span>
        <i class="fas fa-angle-right"></i>
      </a>
    </li>
      <li class="nav-item">
        <a class="nav-link" href="#eaten">
          <span>Zjedzone</span>
          <i class="fas fa-angle-right"></i>
        </a>
      </li>
      <sec:authorize access="hasRole('ADMIN')">
        <li class="nav-item">
          <a class="nav-link color-header" href="/delivery/choose/user">
            <span>Dostawy użytkowników</span>
            <i class="fas fa-angle-right"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link color-header" href="/delivery/for/all/delivery">
            <span>Wszystkie dostawy</span>
            <i class="fas fa-angle-right"></i>
          </a>
        </li>
      </sec:authorize>
    </ul>
      </li>
    </ol>

