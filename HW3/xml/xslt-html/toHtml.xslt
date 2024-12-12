<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ex="http://example.org/vocabulary/">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- Main template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>University Information System</title>
                <style>
                    table { border-collapse: collapse; margin: 20px 0; }
                    th, td { border: 1px solid black; padding: 8px; }
                    h1, h2 { color: navy; }
                    .section { margin: 20px; }
                </style>
            </head>
            <body>
                <h1>University Information System</h1>
                
                <!-- Programs Section -->
                <div class="section">
                    <h2>Programs</h2>
                    <table>
                        <tr>
                            <th>Program Name</th>
                            <th>Duration (years)</th>
                        </tr>
                        <xsl:apply-templates select="//ex:program"/>
                    </table>
                </div>

                <!-- Students Section -->
                <div class="section">
                    <h2>Students and Enrollments</h2>
                    <table>
                        <tr>
                            <th>Student</th>
                            <th>Program</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Enrollments</th>
                        </tr>
                        <xsl:apply-templates select="//ex:student"/>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Program Template -->
    <xsl:template match="ex:program">
        <tr>
            <td><xsl:value-of select="ex:name"/></td>
            <td><xsl:value-of select="ex:duration"/></td>
        </tr>
    </xsl:template>

    <!-- Student Template -->
    <xsl:template match="ex:student">
        <tr>
            <td><xsl:value-of select="ex:name"/></td>
            <td>
                <xsl:value-of select="//ex:program[@id=current()/@programRef]/ex:name"/>
            </td>
            <td><xsl:value-of select="ex:email"/></td>
            <td><xsl:value-of select="ex:phone"/></td>
            <td>
                <ul>
                    <xsl:for-each select="ex:courseEnrollments/ex:enrollment">
                        <li>
                            Course: <xsl:value-of select="@courseRef"/>
                            Grade: <xsl:value-of select="ex:grade"/>
                            (<xsl:value-of select="ex:enrolledOn"/> - 
                            <xsl:value-of select="ex:completedOn"/>)
                        </li>
                    </xsl:for-each>
                </ul>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>