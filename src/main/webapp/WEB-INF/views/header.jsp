<%--
  Created by IntelliJ IDEA.
  User: kuba_ubundu
  Date: 29.05.2021
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Automaty</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Charmonman:400,700|Open+Sans:400,600,700&amp;subset=latin-ext"
          rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>

<body>
<header class="page-header">
    <nav class="navbar navbar-expand-lg justify-content-around">
        <a href="/" class="navbar-brand main-logo">
            Automaty
<%--            <span>Automaty</span>--%>
        </a>
        <ul class="nav nounderline text-uppercase">
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item ml-4">
                    <a class="nav-link color-header" href="/logout">Zalogowany
                        (<sec:authentication property = "principal.username"/>)
                    </a>
                </li>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <li class="nav-item ml-4">
                    <a class="nav-link color-header" href="/login">Logowanie</a>
                </li>
            </sec:authorize>
            <li class="nav-item ml-4">
                <a class="nav-link color-header" href="/register">Rejestracja</a>
            </li>
            <li class="nav-item ml-4">
                <a class="nav-link" href="/warehouse/all/1">Magazyn</a>
            </li>
            <li class="nav-item ml-4">
                <a class="nav-link disabled" href="/product/all">Produkty</a>
            </li>
            <li class="nav-item ml-4">
                <a class="nav-link disabled" href="/car/all">Samochody</a>
            </li>
            <li class="nav-item ml-4">
                <a class="nav-link disabled" href="/vending/all">Maszyny</a>
            </li>
        </ul>
    </nav>
</header>
<br />








