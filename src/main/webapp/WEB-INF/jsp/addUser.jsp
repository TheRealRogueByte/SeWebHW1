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
            <li><a href="/add-user" class="active">Add User</a></li>
            <li><a href="/recommend-skill">Recommend</a></li>
            <li><a href="/filter-cuisine">By Cuisine</a></li>
            <li><a href="/xsl-display">XSL View</a></li>
            <li><a href="/scrape">Scrape</a></li>
        </ul>
    </div>
</nav>

<div class="st-wrap">
    <div style="max-width:500px; margin:0 auto;">

        <div class="st-page-title">
            <h2>Add New User</h2>
        </div>

        <c:if test="${not empty error}">
            <div class="st-alert st-alert-danger">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="st-alert st-alert-success">${success}</div>
        </c:if>

        <div class="st-card">
            <div class="st-card-header">User Profile</div>
            <div class="st-card-body">

                <form action="/add-user" method="post">

                    <div class="st-form-row">
                        <div class="st-form-group">
                            <label class="st-form-label" for="name">First Name <span class="st-req">*</span></label>
                            <input type="text" class="st-form-control" id="name" name="name"
                                   value="${not empty name ? name : ''}" placeholder="e.g. Jane" required>
                        </div>
                        <div class="st-form-group">
                            <label class="st-form-label" for="surname">Surname <span class="st-req">*</span></label>
                            <input type="text" class="st-form-control" id="surname" name="surname"
                                   value="${not empty surname ? surname : ''}" placeholder="e.g. Smith" required>
                        </div>
                    </div>

                    <div class="st-form-group">
                        <label class="st-form-label" for="skill">Cooking Skill Level <span class="st-req">*</span></label>
                        <select class="st-form-control" id="skill" name="cookingSkillLevel" required>
                            <option value="">-- Select skill level --</option>
                            <option value="Beginner"     <c:if test="${cookingSkillLevel == 'Beginner'}">selected</c:if>>Beginner</option>
                            <option value="Intermediate" <c:if test="${cookingSkillLevel == 'Intermediate'}">selected</c:if>>Intermediate</option>
                            <option value="Advanced"     <c:if test="${cookingSkillLevel == 'Advanced'}">selected</c:if>>Advanced</option>
                        </select>
                    </div>

                    <div class="st-form-group">
                        <label class="st-form-label" for="cuisine">Preferred Cuisine Type <span class="st-req">*</span></label>
                        <select class="st-form-control" id="cuisine" name="preferredCuisineType" required>
                            <option value="">-- Select cuisine --</option>
                            <c:forEach var="c" items="${cuisines}">
                                <option value="${c}" <c:if test="${preferredCuisineType == c}">selected</c:if>>${c}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="st-card-footer" style="margin: 0 -14px -16px; padding:12px 14px;">
                        <button type="submit" class="st-btn st-btn-green">Save User</button>
                        <a href="/" class="st-btn st-btn-grey">Cancel</a>
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
