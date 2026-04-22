<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error - Recipe Recommender</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/"><i class="bi bi-egg-fried me-2"></i>Recipe Recommender</a>
    </div>
</nav>
<div class="container my-5 text-center">
    <i class="bi bi-exclamation-triangle-fill text-danger" style="font-size:4rem;"></i>
    <h2 class="mt-3">Something went wrong</h2>
    <div class="alert alert-danger d-inline-block mt-3">${error}</div>
    <br>
    <a href="/" class="btn btn-primary mt-3"><i class="bi bi-house me-2"></i>Back to Home</a>
</div>
</body>
</html>
