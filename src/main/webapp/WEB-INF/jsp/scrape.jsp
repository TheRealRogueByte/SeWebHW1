<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scrape Recipes - Recipe Recommender</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/"><i class="bi bi-egg-fried me-2"></i>Recipe Recommender</a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="/">Home</a>
            <a class="nav-link" href="/recipes">All Recipes</a>
            <a class="nav-link" href="/add-recipe">Add Recipe</a>
            <a class="nav-link active" href="/scrape">Scrape</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow-sm">
                <div class="card-header" style="background:#8e44ad; color:white;">
                    <h4 class="mb-0"><i class="bi bi-cloud-download me-2"></i>Scrape Recipes from BBC Good Food</h4>
                </div>
                <div class="card-body p-4">
                    <p class="text-muted">
                        This will scrape recipe titles from
                        <strong>bbcgoodfood.com/recipes/collection/budget-autumn</strong>
                        and add them to the XML database with randomly assigned cuisine types and difficulty levels.
                    </p>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger"><i class="bi bi-exclamation-triangle me-2"></i>${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success"><i class="bi bi-check-circle me-2"></i>${success}</div>
                        <c:if test="${not empty scrapedRecipes}">
                            <ul class="list-group">
                                <c:forEach var="r" items="${scrapedRecipes}">
                                    <li class="list-group-item">${r.title} &mdash; <span class="badge bg-secondary">${r.cuisineType1}</span> <span class="badge bg-secondary">${r.cuisineType2}</span> <span class="badge bg-primary">${r.difficultyLevel}</span></li>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </c:if>

                    <form action="/scrape" method="post" class="mt-3">
                        <button type="submit" class="btn btn-lg w-100" style="background:#8e44ad;color:white;">
                            <i class="bi bi-cloud-download me-2"></i>Start Scraping
                        </button>
                    </form>
                    <a href="/recipes" class="btn btn-outline-secondary w-100 mt-2">View All Recipes</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
