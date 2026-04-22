<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="userSkillLevel" select="'Intermediate'"/>
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <table class="table table-bordered table-hover mb-0">
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
                                <xsl:attribute name="style">background-color: #FFD700;</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="style">background-color: #90EE90;</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <td><xsl:value-of select="@id"/></td>
                        <td><strong><xsl:value-of select="title"/></strong></td>
                        <td><xsl:value-of select="cuisineTypes/cuisineType[1]"/></td>
                        <td><xsl:value-of select="cuisineTypes/cuisineType[2]"/></td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="difficultyLevel = $userSkillLevel">
                                    <span style="background:#ffc107;color:#000;padding:2px 8px;border-radius:4px;font-size:0.85em;">
                                        <xsl:value-of select="difficultyLevel"/>
                                    </span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span style="background:#198754;color:#fff;padding:2px 8px;border-radius:4px;font-size:0.85em;">
                                        <xsl:value-of select="difficultyLevel"/>
                                    </span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <a style="font-size:0.85em;">
                                <xsl:attribute name="href">/recipe-detail?id=<xsl:value-of select="@id"/></xsl:attribute>
                                View
                            </a>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>

</xsl:stylesheet>
