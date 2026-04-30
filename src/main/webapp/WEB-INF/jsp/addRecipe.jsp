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
    <link rel="stylesheet" href="/css/steam.css">
</head>
<body>

<nav class="st-nav">
    <div class="st-nav-inner">
        <a class="st-brand" href="/"><span>&#9673;</span> Recipe Recommender</a>
        <ul class="st-nav-links">
            <li><a href="/">Home</a></li>
            <li><a href="/recipes">Recipes</a></li>
            <li><a href="/add-recipe" class="active">Add Recipe</a></li>
            <li><a href="/add-user">Add User</a></li>
            <li><a href="/recommend-skill">Recommend</a></li>
            <li><a href="/filter-cuisine">By Cuisine</a></li>
            <li><a href="/xsl-display">XSL View</a></li>
            <li><a href="/scrape">Scrape</a></li>
        </ul>
    </div>
</nav>

<div class="st-wrap">
    <div style="max-width:560px; margin:0 auto;">

        <div class="st-page-title">
            <h2>Add New Recipe</h2>
        </div>

        <c:if test="${not empty error}">
            <div class="st-alert st-alert-danger">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="st-alert st-alert-success">${success}</div>
        </c:if>

        <div class="st-card">
            <div class="st-card-header">Recipe Details</div>
            <div class="st-card-body">

                <form action="/add-recipe" method="post" novalidate>

                    <div class="st-form-group">
                        <label class="st-form-label" for="title">Recipe Title <span class="st-req">*</span></label>
                        <input type="text" class="st-form-control" id="title" name="title"
                               value="${not empty title ? title : ''}"
                               placeholder="e.g. Pasta Primavera" required>
                    </div>

                    <div class="st-form-row">
                        <div class="st-form-group">
                            <label class="st-form-label" for="ct1">Cuisine Type 1 <span class="st-req">*</span></label>
                            <select class="st-form-control" id="ct1" name="cuisineType1" required>
                                <option value="">-- Select --</option>
                                <c:forEach var="c" items="${cuisines}">
                                    <option value="${c}" <c:if test="${cuisineType1 == c}">selected</c:if>>${c}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="st-form-group">
                            <label class="st-form-label" for="ct2">Cuisine Type 2 <span class="st-req">*</span></label>
                            <select class="st-form-control" id="ct2" name="cuisineType2" required>
                                <option value="">-- Select --</option>
                                <c:forEach var="c" items="${cuisines}">
                                    <option value="${c}" <c:if test="${cuisineType2 == c}">selected</c:if>>${c}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="st-form-group">
                        <label class="st-form-label">Difficulty Level <span class="st-req">*</span></label>
                        <div class="st-radio-group">
                            <label class="st-radio-item">
                                <input type="radio" name="difficultyLevel" value="Beginner"
                                       <c:if test="${difficultyLevel == 'Beginner'}">checked</c:if> required>
                                <span class="st-tag st-tag-green">Beginner</span>
                            </label>
                            <label class="st-radio-item">
                                <input type="radio" name="difficultyLevel" value="Intermediate"
                                       <c:if test="${difficultyLevel == 'Intermediate'}">checked</c:if>>
                                <span class="st-tag st-tag-yellow">Intermediate</span>
                            </label>
                            <label class="st-radio-item">
                                <input type="radio" name="difficultyLevel" value="Advanced"
                                       <c:if test="${difficultyLevel == 'Advanced'}">checked</c:if>>
                                <span class="st-tag st-tag-red">Advanced</span>
                            </label>
                        </div>
                    </div>

                    <div class="st-card-footer" style="margin: 0 -14px -16px; padding:12px 14px;">
                        <button type="submit" class="st-btn st-btn-green">Save Recipe</button>
                        <a href="/recipes" class="st-btn st-btn-grey">Cancel</a>
                    </div>

                </form>
            </div>
        </div>

    </div>
</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
