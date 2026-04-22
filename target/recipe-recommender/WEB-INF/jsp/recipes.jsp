<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Recipes - Recipe Recommender</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/"><i class="bi bi-egg-fried me-2"></i>Recipe Recommender</a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="/">Home</a>
            <a class="nav-link active" href="/recipes">All Recipes</a>
            <a class="nav-link" href="/add-recipe">Add Recipe</a>
            <a class="nav-link" href="/add-user">Add User</a>
            <a class="nav-link" href="/recommend-skill">Recommend</a>
            <a class="nav-link" href="/filter-cuisine">By Cuisine</a>
            <a class="nav-link" href="/xsl-display">XSL View</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2><i class="bi bi-list-ul me-2"></i>All Recipes</h2>
        <a href="/add-recipe" class="btn btn-success"><i class="bi bi-plus-circle me-1"></i>Add Recipe</a>
    </div>
    <p class="text-muted">Read from local XML file into memory — ${recipes.size()} recipes loaded</p>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="table-responsive shadow-sm rounded">
        <table class="table table-hover table-striped mb-0 bg-white">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Cuisine Type 1</th>
                    <th>Cuisine Type 2</th>
                    <th>Difficulty</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="recipe" items="${recipes}">
                    <tr>
                        <td>${recipe.id}</td>
                        <td><strong>${recipe.title}</strong></td>
                        <td><span class="badge bg-secondary">${recipe.cuisineType1}</span></td>
                        <td><span class="badge bg-secondary">${recipe.cuisineType2}</span></td>
                        <td>
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
                        </td>
                        <td>
                            <a href="/recipe-detail?id=${recipe.id}" class="btn btn-sm btn-outline-primary">
                                <i class="bi bi-eye me-1"></i>View
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
