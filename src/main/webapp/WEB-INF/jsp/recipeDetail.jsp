<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${recipe.title} - Recipe Recommender</title>
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
    <div style="max-width:600px; margin:0 auto;">

        <div class="st-breadcrumb">
            <a href="/">Home</a>
            <span class="sep">&rsaquo;</span>
            <a href="/recipes">Recipes</a>
            <span class="sep">&rsaquo;</span>
            <span>${recipe.title}</span>
        </div>

        <div class="st-card">
            <div class="st-card-header">${recipe.title}</div>
            <div class="st-card-body" style="padding:0;">
                <p style="padding:10px 14px 6px; font-size:11px; color:#8f98a0; margin:0;">
                    Retrieved via XPath: <code>//recipe[@id='${recipe.id}']</code>
                </p>
                <hr style="margin:0;">
                <table class="st-info-table">
                    <tr>
                        <td class="info-label">Recipe ID</td>
                        <td class="info-val">#${recipe.id}</td>
                    </tr>
                    <tr>
                        <td class="info-label">Title</td>
                        <td class="info-val"><strong>${recipe.title}</strong></td>
                    </tr>
                    <tr>
                        <td class="info-label">Cuisine Type 1</td>
                        <td class="info-val"><span class="st-tag">${recipe.cuisineType1}</span></td>
                    </tr>
                    <tr>
                        <td class="info-label">Cuisine Type 2</td>
                        <td class="info-val"><span class="st-tag">${recipe.cuisineType2}</span></td>
                    </tr>
                    <tr>
                        <td class="info-label">Difficulty Level</td>
                        <td class="info-val">
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
                    </tr>
                </table>
            </div>
            <div class="st-card-footer">
                <a href="/recipes" class="st-btn st-btn-grey st-btn-sm">&laquo; Back to List</a>
                <a href="/filter-cuisine?cuisine=${recipe.cuisineType1}" class="st-btn st-btn-blue st-btn-sm">
                    More ${recipe.cuisineType1} recipes
                </a>
            </div>
        </div>

    </div>
</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
