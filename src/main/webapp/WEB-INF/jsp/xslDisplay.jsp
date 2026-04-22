<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XSL View - Recipe Recommender</title>
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
            <a class="nav-link active" href="/xsl-display">XSL View</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <h2 class="mb-1"><i class="bi bi-file-earmark-code me-2"></i>Recipes — XSL Styled View</h2>
    <p class="text-muted mb-3">Recipes are read into memory then displayed via XSLT transformation.</p>

    <%-- User selector --%>
    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <form method="get" action="/xsl-display" class="row g-3 align-items-end">
                <div class="col-md-5">
                    <label class="form-label fw-semibold">Select User</label>
                    <select name="userId" class="form-select" onchange="this.form.submit()">
                        <c:forEach var="u" items="${users}">
                            <option value="${u.id}"
                                <c:if test="${u.id == selectedUser.id}">selected</c:if>>
                                ${u.name} ${u.surname} — ${u.cookingSkillLevel} / ${u.preferredCuisineType}
                            </option>
                        </c:forEach>
                    </select>
                </div>

            </form>
        </div>
    </div>

    <%-- Legend --%>
    <div class="mb-3 d-flex gap-4">
        <span><span style="display:inline-block;width:18px;height:18px;background:#FFD700;border:1px solid #ccc;vertical-align:middle;margin-right:5px;"></span>Matches <strong>${selectedUser.cookingSkillLevel}</strong> skill level</span>
        <span><span style="display:inline-block;width:18px;height:18px;background:#90EE90;border:1px solid #ccc;vertical-align:middle;margin-right:5px;"></span>Other difficulty level</span>
    </div>

    <%-- XSL-transformed table --%>
    <div class="table-responsive shadow-sm rounded bg-white">
        ${tableHtml}
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
