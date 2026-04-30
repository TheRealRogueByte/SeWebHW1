<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recommendations - Recipe Recommender</title>
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
            <li><a href="/recommend-skill" class="active">Recommend</a></li>
            <li><a href="/filter-cuisine">By Cuisine</a></li>
            <li><a href="/xsl-display">XSL View</a></li>
            <li><a href="/scrape">Scrape</a></li>
        </ul>
    </div>
</nav>

<div class="st-wrap">

    <c:if test="${not empty error}">
        <div class="st-alert st-alert-warning">${error}</div>
    </c:if>

    <c:if test="${not empty user}">

        <div class="st-user-strip">
            <div>
                <div class="user-name">${user.name} ${user.surname}</div>
                <div class="user-meta">
                    Skill Level: <strong style="color:#c6d4df;">${user.cookingSkillLevel}</strong>
                    &nbsp;&bull;&nbsp;
                    Preferred Cuisine: <strong style="color:#c6d4df;">${user.preferredCuisineType}</strong>
                </div>
            </div>
            <div style="display:flex; gap:6px; align-items:center;">
                <c:choose>
                    <c:when test="${mode == 'skill'}">
                        <span class="st-tag st-tag-yellow">By Skill Level</span>
                    </c:when>
                    <c:otherwise>
                        <span class="st-tag st-tag-red">By Skill + Cuisine</span>
                    </c:otherwise>
                </c:choose>
                <a href="/recommend-skill" class="st-btn st-btn-grey st-btn-sm">Skill Only</a>
                <a href="/recommend-skill-cuisine" class="st-btn st-btn-grey st-btn-sm">Skill + Cuisine</a>
            </div>
        </div>

        <div class="st-page-title">
            <c:choose>
                <c:when test="${mode == 'skill'}">
                    <h2>Recipes Matching Your Skill Level</h2>
                </c:when>
                <c:otherwise>
                    <h2>Best Matches &mdash; Skill &amp; Cuisine</h2>
                </c:otherwise>
            </c:choose>
        </div>

        <p class="st-subtitle">
            XPath:
            <c:choose>
                <c:when test="${mode == 'skill'}">
                    <code>//recipe[difficultyLevel='${user.cookingSkillLevel}']</code>
                </c:when>
                <c:otherwise>
                    <code>//recipe[difficultyLevel='${user.cookingSkillLevel}' and cuisineTypes/cuisineType='${user.preferredCuisineType}']</code>
                </c:otherwise>
            </c:choose>
            &mdash; Found <strong style="color:#c6d4df;">${recipes.size()}</strong> recipe(s)
        </p>

        <c:choose>
            <c:when test="${empty recipes}">
                <div class="st-alert st-alert-info">No recipes found for these criteria.</div>
            </c:when>
            <c:otherwise>
                <div class="st-recipe-grid">
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
            </c:otherwise>
        </c:choose>

    </c:if>

</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
