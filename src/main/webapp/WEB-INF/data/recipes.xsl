<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="userSkillLevel" select="'Intermediate'"/>
    <xsl:param name="selectedUserId" select="'1'"/>
    <xsl:param name="userName" select="'User'"/>

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html lang="en">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Recipe List - XSL View</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
            <style>
                body { background-color: #f8f9fa; }
                .recipe-skill-match { background-color: #FFD700 !important; }
                .recipe-no-match { background-color: #90EE90 !important; }
                .legend-box { display: inline-block; width: 20px; height: 20px; margin-right: 6px; border: 1px solid #ccc; vertical-align: middle; }
            </style>
        </head>
        <body>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="/">Recipe Recommender</a>
                    <div class="navbar-nav ms-auto">
                        <a class="nav-link text-white" href="/recipes">All Recipes</a>
                        <a class="nav-link text-white" href="/add-recipe">Add Recipe</a>
                        <a class="nav-link text-white" href="/add-user">Add User</a>
                        <a class="nav-link text-white" href="/recommend-skill">Recommend</a>
                        <a class="nav-link text-white" href="/filter-cuisine">By Cuisine</a>
                        <a class="nav-link text-white active" href="/xsl-display">XSL View</a>
                    </div>
                </div>
            </nav>

            <div class="container mt-4">
                <h2 class="mb-1">Recipes - XSL Styled View</h2>
                <p class="text-muted">Viewing for: <strong><xsl:value-of select="$userName"/></strong> | Skill: <strong><xsl:value-of select="$userSkillLevel"/></strong></p>

                <div class="mb-3">
                    <span class="legend-box" style="background-color:#FFD700;"></span> Matches your skill level
                    <span class="legend-box ms-3" style="background-color:#90EE90;"></span> Other difficulty level
                </div>

                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Cuisine Type 1</th>
                            <th>Cuisine Type 2</th>
                            <th>Difficulty Level</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="recipes/recipe">
                            <tr>
                                <xsl:choose>
                                    <xsl:when test="difficultyLevel = $userSkillLevel">
                                        <xsl:attribute name="class">recipe-skill-match</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="class">recipe-no-match</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <td><xsl:value-of select="@id"/></td>
                                <td><strong><xsl:value-of select="title"/></strong></td>
                                <td><xsl:value-of select="cuisineTypes/cuisineType[1]"/></td>
                                <td><xsl:value-of select="cuisineTypes/cuisineType[2]"/></td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="difficultyLevel = $userSkillLevel">
                                            <span class="badge bg-warning text-dark"><xsl:value-of select="difficultyLevel"/></span>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <span class="badge bg-success"><xsl:value-of select="difficultyLevel"/></span>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td>
                                    <a class="btn btn-sm btn-outline-dark">
                                        <xsl:attribute name="href">/recipe-detail?id=<xsl:value-of select="@id"/></xsl:attribute>
                                        View
                                    </a>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                </div>
            </div>
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
