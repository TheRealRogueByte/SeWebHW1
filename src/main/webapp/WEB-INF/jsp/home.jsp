<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Recommender</title>
    <link rel="stylesheet" href="/css/steam.css">
</head>
<body>

<nav class="st-nav">
    <div class="st-nav-inner">
        <a class="st-brand" href="/"><span>&#9673;</span> Recipe Recommender</a>
        <ul class="st-nav-links">
            <li><a href="/" class="active">Home</a></li>
            <li><a href="/recipes">Recipes</a></li>
            <li><a href="/add-recipe">Add Recipe</a></li>
            <li><a href="/add-user">Add User</a></li>
            <li><a href="/recommend-skill">Recommend</a></li>
            <li><a href="/filter-cuisine">By Cuisine</a></li>
            <li><a href="/xsl-display">XSL View</a></li>
            <li><a href="/scrape">Scrape</a></li>
        </ul>
    </div>
</nav>

<div class="st-hero">
    <h1>Recipe Recommender</h1>
    <p>Discover recipes tailored to your cooking skill and cuisine preferences</p>
    <a href="/recipes" class="st-btn st-btn-green st-btn-lg" style="margin-right:10px;">Browse Recipes</a>
    <a href="/recommend-skill" class="st-btn st-btn-blue st-btn-lg">Get Recommendations</a>
</div>

<div class="st-wrap">

    <div class="st-section-header" style="margin-bottom:2px;">
        Featured Tools
        <a href="/recipes">See all recipes &rsaquo;</a>
    </div>

    <div class="st-feature-grid">

        <div class="st-feature-cell">
            <div class="feat-icon">&#9776;</div>
            <h5>Browse All Recipes</h5>
            <p>View all recipes loaded from XML. Read directly into memory from local file.</p>
            <a href="/recipes" class="st-btn st-btn-blue st-btn-sm">View Recipes</a>
        </div>

        <div class="st-feature-cell">
            <div class="feat-icon">&#43;</div>
            <h5>Add a Recipe</h5>
            <p>Add new recipes to the XML database with full server-side validation.</p>
            <a href="/add-recipe" class="st-btn st-btn-green st-btn-sm">Add Recipe</a>
        </div>

        <div class="st-feature-cell">
            <div class="feat-icon">&#9786;</div>
            <h5>Add a User</h5>
            <p>Register users with their cooking skill level and cuisine preference.</p>
            <a href="/add-user" class="st-btn st-btn-blue st-btn-sm">Add User</a>
        </div>

        <div class="st-feature-cell">
            <div class="feat-icon">&#9733;</div>
            <h5>Recommend by Skill</h5>
            <p>Get recipes matching the first user&rsquo;s cooking skill level using XPath.</p>
            <a href="/recommend-skill" class="st-btn st-btn-green st-btn-sm">Recommend</a>
        </div>

        <div class="st-feature-cell">
            <div class="feat-icon">&#10024;</div>
            <h5>Skill + Cuisine Match</h5>
            <p>Double-filtered recommendations by skill AND preferred cuisine via XPath.</p>
            <a href="/recommend-skill-cuisine" class="st-btn st-btn-green st-btn-sm">Best Match</a>
        </div>

        <div class="st-feature-cell">
            <div class="feat-icon">&#9741;</div>
            <h5>Filter by Cuisine</h5>
            <p>Find all recipes of a specific cuisine type via XPath query.</p>
            <a href="/filter-cuisine" class="st-btn st-btn-blue st-btn-sm">Filter</a>
        </div>

        <div class="st-feature-cell">
            <div class="feat-icon">&#10070;</div>
            <h5>XSL Styled View</h5>
            <p>Display recipes via XSLT transformation. Highlights recipes that match your skill.</p>
            <a href="/xsl-display" class="st-btn st-btn-grey st-btn-sm">XSL View</a>
        </div>

        <div class="st-feature-cell">
            <div class="feat-icon">&#8659;</div>
            <h5>Scrape from Web</h5>
            <p>Scrape recipes from BBC Good Food and add them to the XML database.</p>
            <a href="/scrape" class="st-btn st-btn-grey st-btn-sm">Scrape Now</a>
        </div>

    </div>

    <div class="st-card" style="margin-top:16px;">
        <div class="st-card-header">About This Project</div>
        <div class="st-card-body" style="font-size:12px; color:#8f98a0; line-height:1.7;">
            This is a Semantic Web demonstration project built on Java Servlets, JSP, and Apache Tomcat.
            All data is stored in <code>XML</code> files and queried using <code>XPath</code> expressions.
            The XSL View page demonstrates <code>XSLT</code> transformation with parameterised stylesheets.
            Schema validation is handled by both <code>DTD</code> and <code>XSD</code>.
        </div>
    </div>

</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
