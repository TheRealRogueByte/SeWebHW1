<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recommendations - Recipe Recommender</title>
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
            <a class="nav-link active" href="/recommend-skill">Recommend</a>
            <a class="nav-link" href="/filter-cuisine">By Cuisine</a>
            <a class="nav-link" href="/xsl-display">XSL View</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <c:if test="${not empty error}">
        <div class="alert alert-warning"><i class="bi bi-exclamation-triangle me-2"></i>${error}</div>
    </c:if>

    <c:if test="${not empty user}">
        <div class="card shadow-sm mb-4">
            <div class="card-body bg-primary text-white rounded">
                <div class="row align-items-center">
                    <div class="col">
                        <h5 class="mb-1"><i class="bi bi-person-circle me-2"></i>${user.name} ${user.surname}</h5>
                        <p class="mb-0">
                            Skill: <strong>${user.cookingSkillLevel}</strong>
                            &bull; Preferred Cuisine: <strong>${user.preferredCuisineType}</strong>
                        </p>
                    </div>
                    <div class="col-auto">
                        <c:choose>
                            <c:when test="${mode == 'skill'}">
                                <span class="badge bg-warning text-dark fs-6">By Skill Level</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-danger fs-6">By Skill + Cuisine</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <c:choose>
                <c:when test="${mode == 'skill'}">
                    <h2><i class="bi bi-stars me-2"></i>Recipes Matching Your Skill Level</h2>
                </c:when>
                <c:otherwise>
                    <h2><i class="bi bi-magic me-2"></i>Best Matches — Skill &amp; Cuisine</h2>
                </c:otherwise>
            </c:choose>
            <div>
                <a href="/recommend-skill" class="btn btn-outline-warning btn-sm me-1">By Skill</a>
                <a href="/recommend-skill-cuisine" class="btn btn-outline-danger btn-sm">Skill + Cuisine</a>
            </div>
        </div>

        <p class="text-muted">
            <c:choose>
                <c:when test="${mode == 'skill'}">
                    XPath: <code>//recipe[difficultyLevel='${user.cookingSkillLevel}']</code>
                </c:when>
                <c:otherwise>
                    XPath: <code>//recipe[difficultyLevel='${user.cookingSkillLevel}' and cuisineTypes/cuisineType='${user.preferredCuisineType}']</code>
                </c:otherwise>
            </c:choose>
            &mdash; Found <strong>${recipes.size()}</strong> recipe(s)
        </p>

        <c:choose>
            <c:when test="${empty recipes}">
                <div class="alert alert-info"><i class="bi bi-info-circle me-2"></i>No recipes found for these criteria.</div>
            </c:when>
            <c:otherwise>
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
            </c:otherwise>
        </c:choose>
    </c:if>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
