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
    <title>Filter by Cuisine - Recipe Recommender</title>
    <link rel="stylesheet" href="/css/steam.css">
</head>
<body>

<nav class="st-nav">
    <div class="st-nav-inner">
        <a class="st-brand" href="/"><span>&#9673;</span> Recipe Recommender</a>
        <ul class="st-nav-links">
            <li><a href="/">Home</a></li>
            <li><a href="/recipes">Recipes</a></li>
            <li><a href="/add-recipe">Add Recipe</a></li>
            <li><a href="/add-user">Add User</a></li>
            <li><a href="/recommend-skill">Recommend</a></li>
            <li><a href="/filter-cuisine" class="active">By Cuisine</a></li>
            <li><a href="/xsl-display">XSL View</a></li>
            <li><a href="/scrape">Scrape</a></li>
        </ul>
    </div>
</nav>

<div class="st-wrap">

    <div class="st-page-title">
        <h2>Filter Recipes by Cuisine</h2>
    </div>
    <p class="st-subtitle">Uses XPath: <code>//recipe[cuisineTypes/cuisineType='...']</code></p>

    <div class="st-card" style="margin-bottom:16px;">
        <div class="st-card-header">Search Filter</div>
        <div class="st-card-body">
            <form action="/filter-cuisine" method="get">
                <div style="display:flex; gap:10px; align-items:flex-end; flex-wrap:wrap;">
                    <div style="flex:1; min-width:200px;">
                        <label class="st-form-label">Select a Cuisine Type</label>
                        <select name="cuisine" class="st-form-control" required>
                            <option value="">-- Choose cuisine --</option>
                            <c:forEach var="c" items="${cuisines}">
                                <option value="${c}" <c:if test="${selectedCuisine == c}">selected</c:if>>${c}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <button type="submit" class="st-btn st-btn-blue">Search</button>
                    </div>
                    <c:if test="${not empty selectedCuisine}">
                        <div>
                            <a href="/filter-cuisine" class="st-btn st-btn-grey">Clear</a>
                        </div>
                    </c:if>
                </div>
            </form>
        </div>
    </div>

    <c:if test="${not empty error}">
        <div class="st-alert st-alert-danger">${error}</div>
    </c:if>

    <c:if test="${not empty recipes}">
        <div class="st-section-header" style="margin-bottom:2px;">
            ${selectedCuisine} Recipes
            <span class="st-tag">${recipes.size()}</span>
        </div>
        <div class="st-recipe-grid" style="margin-top:2px;">
            <c:forEach var="recipe" items="${recipes}">
                <div class="st-recipe-card">
                    <h5>${recipe.title}</h5>
                    <div class="tags">
                        <span class="st-tag">${recipe.cuisineType1}</span>
                        <span class="st-tag">${recipe.cuisineType2}</span>
                        <c:choose>
                            <c:when test="${recipe.difficultyLevel == 'Beginner'}">
                                <span class="st-tag st-tag-green">${recipe.difficultyLevel}</span>
                            </c:when>
                            <c:when test="${recipe.difficultyLevel == 'Intermediate'}">
                                <span class="st-tag st-tag-yellow">${recipe.difficultyLevel}</span>
                            </c:when>
                            <c:otherwise>
                                <span class="st-tag st-tag-red">${recipe.difficultyLevel}</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="footer-row">
                        <a href="/recipe-detail?id=${recipe.id}" class="st-btn st-btn-blue st-btn-sm st-btn-full">View Details</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${not empty selectedCuisine and empty recipes}">
        <div class="st-alert st-alert-info">No recipes found for cuisine: <strong>${selectedCuisine}</strong></div>
    </c:if>

</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
