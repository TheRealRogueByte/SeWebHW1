<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String[] cuisines = {"Italian","Mediterranean","Asian","Japanese","Chinese","Thai",
        "Indian","Mexican","American","French","European","Western","Greek","Spanish","British","Middle Eastern"};
    request.setAttribute("cuisines", cuisines);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Recipe - Recipe Recommender</title>
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
            <a class="nav-link active" href="/add-recipe">Add Recipe</a>
            <a class="nav-link" href="/add-user">Add User</a>
            <a class="nav-link" href="/recommend-skill">Recommend</a>
            <a class="nav-link" href="/filter-cuisine">By Cuisine</a>
            <a class="nav-link" href="/xsl-display">XSL View</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white">
                    <h4 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Add New Recipe</h4>
                </div>
                <div class="card-body p-4">

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger"><i class="bi bi-exclamation-triangle me-2"></i>${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success"><i class="bi bi-check-circle me-2"></i>${success}</div>
                    </c:if>

                    <form action="/add-recipe" method="post" novalidate>
                        <div class="mb-3">
                            <label for="title" class="form-label fw-semibold">Recipe Title <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="title" name="title"
                                   value="${not empty title ? title : ''}"
                                   placeholder="e.g. Pasta Primavera" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="ct1" class="form-label fw-semibold">Cuisine Type 1 <span class="text-danger">*</span></label>
                                <select class="form-select" id="ct1" name="cuisineType1" required>
                                    <option value="">-- Select --</option>
                                    <c:forEach var="c" items="${cuisines}">
                                        <option value="${c}" <c:if test="${cuisineType1 == c}">selected</c:if>>${c}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="ct2" class="form-label fw-semibold">Cuisine Type 2 <span class="text-danger">*</span></label>
                                <select class="form-select" id="ct2" name="cuisineType2" required>
                                    <option value="">-- Select --</option>
                                    <c:forEach var="c" items="${cuisines}">
                                        <option value="${c}" <c:if test="${cuisineType2 == c}">selected</c:if>>${c}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Difficulty Level <span class="text-danger">*</span></label>
                            <div class="d-flex gap-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="difficultyLevel" id="beginner" value="Beginner" <c:if test="${difficultyLevel == 'Beginner'}">checked</c:if> required>
                                    <label class="form-check-label" for="beginner"><span class="badge bg-success">Beginner</span></label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="difficultyLevel" id="intermediate" value="Intermediate" <c:if test="${difficultyLevel == 'Intermediate'}">checked</c:if>>
                                    <label class="form-check-label" for="intermediate"><span class="badge bg-warning text-dark">Intermediate</span></label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="difficultyLevel" id="advanced" value="Advanced" <c:if test="${difficultyLevel == 'Advanced'}">checked</c:if>>
                                    <label class="form-check-label" for="advanced"><span class="badge bg-danger">Advanced</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-success"><i class="bi bi-save me-2"></i>Save Recipe</button>
                            <a href="/recipes" class="btn btn-outline-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
