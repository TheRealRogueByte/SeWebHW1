<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Recipes - Recipe Recommender</title>
    <link rel="stylesheet" href="/css/steam.css">
</head>
<body>

<nav class="st-nav">
    <div class="st-nav-inner">
        <a class="st-brand" href="/"><span>&#9673;</span> Recipe Recommender</a>
        <ul class="st-nav-links">
            <li><a href="/">Home</a></li>
            <li><a href="/recipes" class="active">Recipes</a></li>
            <li><a href="/add-recipe">Add Recipe</a></li>
            <li><a href="/add-user">Add User</a></li>
            <li><a href="/recommend-skill">Recommend</a></li>
            <li><a href="/filter-cuisine">By Cuisine</a></li>
            <li><a href="/xsl-display">XSL View</a></li>
            <li><a href="/scrape">Scrape</a></li>
        </ul>
    </div>
</nav>

<div class="st-wrap">

    <div class="st-page-title">
        <h2>All Recipes</h2>
        <a href="/add-recipe" class="st-btn st-btn-green st-btn-sm">+ Add Recipe</a>
    </div>
    <p class="st-subtitle">Read from local XML file into memory &mdash; ${recipes.size()} recipes loaded</p>

    <c:if test="${not empty error}">
        <div class="st-alert st-alert-danger">${error}</div>
    </c:if>

    <div class="st-table-wrap">
        <table class="st-table">
            <thead>
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
                        <td style="color:#8f98a0;">${recipe.id}</td>
                        <td><strong>${recipe.title}</strong></td>
                        <td><span class="st-tag">${recipe.cuisineType1}</span></td>
                        <td><span class="st-tag">${recipe.cuisineType2}</span></td>
                        <td>
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
                        </td>
                        <td>
                            <a href="/recipe-detail?id=${recipe.id}" class="st-btn st-btn-blue st-btn-sm">View</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
