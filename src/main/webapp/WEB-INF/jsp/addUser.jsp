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
    <title>Add User - Recipe Recommender</title>
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
            <a class="nav-link active" href="/add-user">Add User</a>
            <a class="nav-link" href="/recommend-skill">Recommend</a>
            <a class="nav-link" href="/filter-cuisine">By Cuisine</a>
            <a class="nav-link" href="/xsl-display">XSL View</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-info text-white">
                    <h4 class="mb-0"><i class="bi bi-person-plus me-2"></i>Add New User</h4>
                </div>
                <div class="card-body p-4">

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger"><i class="bi bi-exclamation-triangle me-2"></i>${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success"><i class="bi bi-check-circle me-2"></i>${success}</div>
                    </c:if>

                    <form action="/add-user" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="name" class="form-label fw-semibold">Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="name" name="name"
                                       value="${not empty name ? name : ''}" placeholder="e.g. Jane" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="surname" class="form-label fw-semibold">Surname <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="surname" name="surname"
                                       value="${not empty surname ? surname : ''}" placeholder="e.g. Smith" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="skill" class="form-label fw-semibold">Cooking Skill Level <span class="text-danger">*</span></label>
                            <select class="form-select" id="skill" name="cookingSkillLevel" required>
                                <option value="">-- Select skill level --</option>
                                <option value="Beginner" <c:if test="${cookingSkillLevel == 'Beginner'}">selected</c:if>>Beginner</option>
                                <option value="Intermediate" <c:if test="${cookingSkillLevel == 'Intermediate'}">selected</c:if>>Intermediate</option>
                                <option value="Advanced" <c:if test="${cookingSkillLevel == 'Advanced'}">selected</c:if>>Advanced</option>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label for="cuisine" class="form-label fw-semibold">Preferred Cuisine Type <span class="text-danger">*</span></label>
                            <select class="form-select" id="cuisine" name="preferredCuisineType" required>
                                <option value="">-- Select cuisine --</option>
                                <c:forEach var="c" items="${cuisines}">
                                    <option value="${c}" <c:if test="${preferredCuisineType == c}">selected</c:if>>${c}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-info text-white"><i class="bi bi-save me-2"></i>Save User</button>
                            <a href="/" class="btn btn-outline-secondary">Cancel</a>
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
