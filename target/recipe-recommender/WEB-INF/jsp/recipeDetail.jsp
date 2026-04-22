<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${recipe.title} - Recipe Recommender</title>
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
            <a class="nav-link" href="/filter-cuisine">By Cuisine</a>
            <a class="nav-link" href="/xsl-display">XSL View</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Home</a></li>
            <li class="breadcrumb-item"><a href="/recipes">Recipes</a></li>
            <li class="breadcrumb-item active">${recipe.title}</li>
        </ol>
    </nav>

    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow border-0">
                <div class="card-header bg-dark text-white py-3">
                    <h3 class="mb-0"><i class="bi bi-book me-2"></i>${recipe.title}</h3>
                </div>
                <div class="card-body p-4">
                    <p class="text-muted mb-1">Retrieved via XPath: <code>//recipe[@id='${recipe.id}']</code></p>
                    <hr>
                    <dl class="row fs-5">
                        <dt class="col-sm-4 text-muted">Recipe ID</dt>
                        <dd class="col-sm-8">#${recipe.id}</dd>

                        <dt class="col-sm-4 text-muted">Title</dt>
                        <dd class="col-sm-8"><strong>${recipe.title}</strong></dd>

                        <dt class="col-sm-4 text-muted">Cuisine Type 1</dt>
                        <dd class="col-sm-8"><span class="badge bg-secondary fs-6">${recipe.cuisineType1}</span></dd>

                        <dt class="col-sm-4 text-muted">Cuisine Type 2</dt>
                        <dd class="col-sm-8"><span class="badge bg-secondary fs-6">${recipe.cuisineType2}</span></dd>

                        <dt class="col-sm-4 text-muted">Difficulty Level</dt>
                        <dd class="col-sm-8">
                            <c:choose>
                                <c:when test="${recipe.difficultyLevel == 'Beginner'}">
                                    <span class="badge bg-success fs-6">${recipe.difficultyLevel}</span>
                                </c:when>
                                <c:when test="${recipe.difficultyLevel == 'Intermediate'}">
                                    <span class="badge bg-warning text-dark fs-6">${recipe.difficultyLevel}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger fs-6">${recipe.difficultyLevel}</span>
                                </c:otherwise>
                            </c:choose>
                        </dd>
                    </dl>
                </div>
                <div class="card-footer bg-transparent d-flex gap-2">
                    <a href="/recipes" class="btn btn-outline-dark"><i class="bi bi-arrow-left me-1"></i>Back to List</a>
                    <a href="/filter-cuisine?cuisine=${recipe.cuisineType1}" class="btn btn-outline-secondary">
                        More ${recipe.cuisineType1} recipes
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
