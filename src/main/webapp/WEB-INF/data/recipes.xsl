<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="userSkillLevel" select="'Intermediate'"/>
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <table style="width:100%;border-collapse:collapse;font-size:12px;font-family:Arial,Helvetica,sans-serif;">
            <thead>
                <tr style="background:#2a475e;">
                    <th style="padding:8px 10px;text-align:left;color:#c6d4df;font-size:11px;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #1b2838;">#</th>
                    <th style="padding:8px 10px;text-align:left;color:#c6d4df;font-size:11px;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #1b2838;">Title</th>
                    <th style="padding:8px 10px;text-align:left;color:#c6d4df;font-size:11px;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #1b2838;">Cuisine Type 1</th>
                    <th style="padding:8px 10px;text-align:left;color:#c6d4df;font-size:11px;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #1b2838;">Cuisine Type 2</th>
                    <th style="padding:8px 10px;text-align:left;color:#c6d4df;font-size:11px;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #1b2838;">Difficulty Level</th>
                    <th style="padding:8px 10px;text-align:left;color:#c6d4df;font-size:11px;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #1b2838;">Action</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="recipes/recipe">
                    <tr>
                        <xsl:choose>
                            <xsl:when test="difficultyLevel = $userSkillLevel">
                                <xsl:attribute name="style">background-color:#2e2200;</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="style">background-color:#0e1f0e;</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                        <td style="padding:7px 10px;border-bottom:1px solid #1e2837;color:#8f98a0;vertical-align:middle;">
                            <xsl:value-of select="@id"/>
                        </td>
                        <td style="padding:7px 10px;border-bottom:1px solid #1e2837;color:#c6d4df;vertical-align:middle;font-weight:bold;">
                            <xsl:value-of select="title"/>
                        </td>
                        <td style="padding:7px 10px;border-bottom:1px solid #1e2837;vertical-align:middle;">
                            <span style="display:inline-block;background:#2a475e;color:#c6d4df;padding:2px 8px;border-radius:2px;font-size:11px;">
                                <xsl:value-of select="cuisineTypes/cuisineType[1]"/>
                            </span>
                        </td>
                        <td style="padding:7px 10px;border-bottom:1px solid #1e2837;vertical-align:middle;">
                            <span style="display:inline-block;background:#2a475e;color:#c6d4df;padding:2px 8px;border-radius:2px;font-size:11px;">
                                <xsl:value-of select="cuisineTypes/cuisineType[2]"/>
                            </span>
                        </td>
                        <td style="padding:7px 10px;border-bottom:1px solid #1e2837;vertical-align:middle;">
                            <xsl:choose>
                                <xsl:when test="difficultyLevel = $userSkillLevel">
                                    <span style="display:inline-block;background:#5e4910;color:#f5c518;padding:2px 8px;border-radius:2px;font-size:11px;">
                                        <xsl:value-of select="difficultyLevel"/>
                                    </span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span style="display:inline-block;background:#3d5e1a;color:#a4d44e;padding:2px 8px;border-radius:2px;font-size:11px;">
                                        <xsl:value-of select="difficultyLevel"/>
                                    </span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td style="padding:7px 10px;border-bottom:1px solid #1e2837;vertical-align:middle;">
                            <a style="display:inline-block;background:linear-gradient(to bottom,#4d9ab5,#2e6887);color:#c6d4df;padding:4px 10px;border-radius:2px;font-size:11px;font-weight:bold;text-transform:uppercase;letter-spacing:0.5px;text-decoration:none;">
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
