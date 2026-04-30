<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scrape Recipes - Recipe Recommender</title>
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
            <li><a href="/filter-cuisine">By Cuisine</a></li>
            <li><a href="/xsl-display">XSL View</a></li>
            <li><a href="/scrape" class="active">Scrape</a></li>
        </ul>
    </div>
</nav>

<div class="st-wrap">
    <div style="max-width:600px; margin:0 auto;">

        <div class="st-page-title">
            <h2>Scrape Recipes from Web</h2>
        </div>

        <div class="st-card">
            <div class="st-card-header">BBC Good Food &mdash; Web Scraper</div>
            <div class="st-card-body">

                <p style="font-size:12px; color:#8f98a0; line-height:1.6; margin-bottom:14px;">
                    This will scrape recipe titles from
                    <strong style="color:#c6d4df;">bbcgoodfood.com/recipes/collection/budget-autumn</strong>
                    and add them to the XML database with randomly assigned cuisine types and difficulty levels.
                </p>

                <c:if test="${not empty error}">
                    <div class="st-alert st-alert-danger">${error}</div>
                </c:if>

                <c:if test="${not empty success}">
                    <div class="st-alert st-alert-success">${success}</div>
                    <c:if test="${not empty scrapedRecipes}">
                        <div class="st-table-wrap" style="margin-bottom:14px;">
                            <c:forEach var="r" items="${scrapedRecipes}">
                                <div class="st-list-item">
                                    <span>${r.title}</span>
                                    <span style="display:flex; gap:4px; flex-shrink:0;">
                                        <span class="st-tag">${r.cuisineType1}</span>
                                        <span class="st-tag">${r.cuisineType2}</span>
                                        <c:choose>
                                            <c:when test="${r.difficultyLevel == 'Beginner'}">
                                                <span class="st-tag st-tag-green">${r.difficultyLevel}</span>
                                            </c:when>
                                            <c:when test="${r.difficultyLevel == 'Intermediate'}">
                                                <span class="st-tag st-tag-yellow">${r.difficultyLevel}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="st-tag st-tag-red">${r.difficultyLevel}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </c:if>

                <form action="/scrape" method="post">
                    <button type="submit" class="st-btn st-btn-green st-btn-full st-btn-lg">
                        &#8659; Start Scraping
                    </button>
                </form>

            </div>
            <div class="st-card-footer">
                <a href="/recipes" class="st-btn st-btn-grey st-btn-sm">View All Recipes</a>
            </div>
        </div>

    </div>
</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
