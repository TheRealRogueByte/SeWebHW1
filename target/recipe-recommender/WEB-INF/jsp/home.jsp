<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Recommender</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        .hero { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%); color: white; padding: 80px 0; }
        .feature-card { transition: transform 0.2s, box-shadow 0.2s; border: none; border-radius: 12px; }
        .feature-card:hover { transform: translateY(-4px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
        .feature-icon { font-size: 2.5rem; margin-bottom: 1rem; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/"><i class="bi bi-egg-fried me-2"></i>Recipe Recommender</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav">
            <div class="navbar-nav ms-auto">
                <a class="nav-link active" href="/">Home</a>
                <a class="nav-link" href="/recipes">All Recipes</a>
                <a class="nav-link" href="/add-recipe">Add Recipe</a>
                <a class="nav-link" href="/add-user">Add User</a>
                <a class="nav-link" href="/recommend-skill">Recommend</a>
                <a class="nav-link" href="/filter-cuisine">By Cuisine</a>
                <a class="nav-link" href="/xsl-display">XSL View</a>
                <a class="nav-link" href="/scrape">Scrape</a>
            </div>
        </div>
    </div>
</nav>

<div class="hero text-center">
    <div class="container">
        <h1 class="display-4 fw-bold mb-3"><i class="bi bi-egg-fried me-3"></i>Recipe Recommender</h1>
        <p class="lead mb-4">Discover recipes tailored to your cooking skill and cuisine preferences</p>
        <a href="/recipes" class="btn btn-warning btn-lg me-2"><i class="bi bi-list-ul me-2"></i>Browse Recipes</a>
        <a href="/recommend-skill" class="btn btn-outline-light btn-lg"><i class="bi bi-stars me-2"></i>Get Recommendations</a>
    </div>
</div>

<div class="container my-5">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card feature-card shadow-sm h-100 text-center p-4">
                <div class="feature-icon text-warning"><i class="bi bi-list-check"></i></div>
                <h5 class="fw-bold">Browse All Recipes</h5>
                <p class="text-muted">View all 24+ recipes loaded from XML. Read directly into memory from local file.</p>
                <a href="/recipes" class="btn btn-outline-warning mt-auto">View Recipes</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card shadow-sm h-100 text-center p-4">
                <div class="feature-icon text-success"><i class="bi bi-plus-circle"></i></div>
                <h5 class="fw-bold">Add a Recipe</h5>
                <p class="text-muted">Add new recipes to the XML database with full validation.</p>
                <a href="/add-recipe" class="btn btn-outline-success mt-auto">Add Recipe</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card shadow-sm h-100 text-center p-4">
                <div class="feature-icon text-info"><i class="bi bi-person-plus"></i></div>
                <h5 class="fw-bold">Add a User</h5>
                <p class="text-muted">Register users with their cooking skill level and cuisine preference.</p>
                <a href="/add-user" class="btn btn-outline-info mt-auto">Add User</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card shadow-sm h-100 text-center p-4">
                <div class="feature-icon text-primary"><i class="bi bi-stars"></i></div>
                <h5 class="fw-bold">Recommend by Skill</h5>
                <p class="text-muted">Get recipes matching the first user's cooking skill level using XPath.</p>
                <a href="/recommend-skill" class="btn btn-outline-primary mt-auto">Recommend</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card shadow-sm h-100 text-center p-4">
                <div class="feature-icon text-danger"><i class="bi bi-magic"></i></div>
                <h5 class="fw-bold">Skill + Cuisine Match</h5>
                <p class="text-muted">Double-filtered recommendations by skill AND preferred cuisine using XPath.</p>
                <a href="/recommend-skill-cuisine" class="btn btn-outline-danger mt-auto">Best Match</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card shadow-sm h-100 text-center p-4">
                <div class="feature-icon text-secondary"><i class="bi bi-filter-circle"></i></div>
                <h5 class="fw-bold">Filter by Cuisine</h5>
                <p class="text-muted">Find all recipes of a specific cuisine type via XPath query.</p>
                <a href="/filter-cuisine" class="btn btn-outline-secondary mt-auto">Filter</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card shadow-sm h-100 text-center p-4">
                <div class="feature-icon" style="color:#e67e22"><i class="bi bi-file-earmark-code"></i></div>
                <h5 class="fw-bold">XSL Styled View</h5>
                <p class="text-muted">Display recipes using XSLT. Yellow = matches your skill, Green = others.</p>
                <a href="/xsl-display" class="btn btn-outline-warning mt-auto">XSL View</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card feature-card shadow-sm h-100 text-center p-4">
                <div class="feature-icon" style="color:#8e44ad"><i class="bi bi-cloud-download"></i></div>
                <h5 class="fw-bold">Scrape from Web</h5>
                <p class="text-muted">Scrape recipes from BBC Good Food and add them to the XML database.</p>
                <a href="/scrape" class="btn mt-auto" style="color:#8e44ad; border-color:#8e44ad">Scrape Now</a>
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark text-white text-center py-3 mt-5">
    <p class="mb-0">Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
