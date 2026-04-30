<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Recipe Recommender</title>
    <link rel="stylesheet" href="/css/steam.css">
</head>
<body>

<nav class="st-nav">
    <div class="st-nav-inner">
        <a class="st-brand" href="/"><span>&#9673;</span> Recipe Recommender</a>
        <ul class="st-nav-links">
            <li><a href="/">Home</a></li>
        </ul>
    </div>
</nav>

<div class="st-wrap" style="text-align:center; padding-top:60px;">

    <div style="font-size:48px; color:#c94141; margin-bottom:16px;">&#9888;</div>
    <h2 style="font-size:18px; color:#c6d4df; text-transform:uppercase; letter-spacing:2px; margin-bottom:16px;">
        Something Went Wrong
    </h2>

    <div class="st-alert st-alert-danger" style="max-width:500px; margin:0 auto 20px; text-align:left;">
        ${error}
    </div>

    <a href="/" class="st-btn st-btn-blue">&laquo; Back to Home</a>

</div>

<div class="st-footer">
    Recipe Recommender &mdash; Semantic Web Project &bull; XML &bull; XPath &bull; XSL &bull; Java Servlets
</div>

</body>
</html>
