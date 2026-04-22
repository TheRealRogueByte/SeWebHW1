<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter by Cuisine - Recipe Recommender</title>
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
            <a class="nav-link" href="/add-user">Add User</a>
            <a class="nav-link" href="/recommend-skill">Recommend</a>
            <a class="nav-link active" href="/filter-cuisine">By Cuisine</a>
            <a class="nav-link" href="/xsl-display">XSL View</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <h2 class="mb-1"><i class="bi bi-filter-circle me-2"></i>Filter Recipes by Cuisine</h2>
    <p class="text-muted mb-4">Uses XPath: <code>//recipe[cuisineTypes/cuisineType='...']</code></p>

    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <form action="/filter-cuisine" method="get" class="row g-3 align-items-end">
                <div class="col-md-5">
                    <label class="form-label fw-semibold">Select a Cuisine Type</label>
                    <select name="cuisine" class="form-select form-select-lg" required>
                        <option value="">-- Choose cuisine --</option>
                        <c:forEach var="c" items="${['Italian','Mediterranean','Asian','Japanese','Chinese','Thai','Indian','Mexican','American','French','European','Western','Greek','Spanish','British','Middle Eastern']}">
                            <option value="${c}" ${selectedCuisine == c ? 'selected' : ''}>${c}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-search me-2"></i>Search
                    </button>
                </div>
                <c:if test="${not empty selectedCuisine}">
                    <div class="col-auto">
                        <a href="/filter-cuisine" class="btn btn-outline-secondary btn-lg">Clear</a>
                    </div>
                </c:if>
            </form>
        </div>
    </div>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:if test="${not empty recipes}">
        <h4 class="mb-3">
            <i class="bi bi-tag me-2"></i>${selectedCuisine} Recipes
            <span class="badge bg-secondary ms-2">${recipes.size()}</span>
        </h4>
        <div class="row g-3">
            <c:forEach var="recipe" items="${recipes}">
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title">${recipe.title}</h5>
                            <p class="mb-1">
                                <span class="badge bg-secondary">${recipe.cuisineType1}</span>
                                <span class="badge bg-secondary">${recipe.cuisineType2}</span>
                            </p>
                            <c:choose>
                                <c:when test="${recipe.difficultyLevel == 'Beginner'}">
                                    <span class="badge bg-success">${recipe.difficultyLevel}</span>
                                </c:when>
                                <c:when test="${recipe.difficultyLevel == 'Intermediate'}">
                                    <span class="badge bg-warning text-dark">${recipe.difficultyLevel}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger">${recipe.difficultyLevel}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-footer bg-transparent">
                            <a href="/recipe-detail?id=${recipe.id}" class="btn btn-sm btn-outline-primary w-100">
                                <i class="bi bi-eye me-1"></i>View Details
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${not empty selectedCuisine and empty recipes}">
        <div class="alert alert-info"><i class="bi bi-info-circle me-2"></i>No recipes found for cuisine: <strong>${selectedCuisine}</strong></div>
    </c:if>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
