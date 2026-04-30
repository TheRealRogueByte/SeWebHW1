<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XSL View - Recipe Recommender</title>
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
            <li><a href="/xsl-display" class="active">XSL View</a></li>
            <li><a href="/scrape">Scrape</a></li>
        </ul>
    </div>
</nav>

<div class="st-wrap">

    <div class="st-page-title">
        <h2>Recipes &mdash; XSL Styled View</h2>
    </div>
    <p class="st-subtitle">Recipes are read into memory then displayed via XSLT transformation.</p>

    <div class="st-card" style="margin-bottom:14px;">
        <div class="st-card-header">Select User Profile</div>
        <div class="st-card-body">
            <form method="get" action="/xsl-display" style="display:flex; gap:10px; align-items:flex-end; flex-wrap:wrap;">
                <div style="flex:1; min-width:220px;">
                    <label class="st-form-label">Active User</label>
                    <select name="userId" class="st-form-control" onchange="this.form.submit()">
                        <c:forEach var="u" items="${users}">
                            <option value="${u.id}" <c:if test="${u.id == selectedUser.id}">selected</c:if>>
                                ${u.name} ${u.surname} &mdash; ${u.cookingSkillLevel} / ${u.preferredCuisineType}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </form>
        </div>
    </div>

    <div class="st-legend">
        <div class="st-legend-item">
            <div class="st-legend-swatch" style="background:#2e2200; border-color:#5e4000;"></div>
            <span>Matches <strong style="color:#f5c518;">${selectedUser.cookingSkillLevel}</strong> skill level</span>
        </div>
        <div class="st-legend-item">
            <div class="st-legend-swatch" style="background:#0e1f0e; border-color:#1a3a1a;"></div>
            <span>Other difficulty level</span>
        </div>
    </div>

    <div class="st-table-wrap xsl-output">
        <c:out value="${tableHtml}" escapeXml="false"/>
    </div>

</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
