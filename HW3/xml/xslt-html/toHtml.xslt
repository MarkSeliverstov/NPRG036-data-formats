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
                
                <!-- Departments Section -->
                <div class="section">
                    <h2>Departments and Courses</h2>
                    <table>
                        <tr>
                            <th>Department</th>
                            <th>Location</th>
                            <th>Courses</th>
                            <th>Teachers</th>
                        </tr>
                        <xsl:apply-templates select="//ex:department"/>
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
                            <th>Enrollments</th>
                        </tr>
                        <xsl:apply-templates select="//ex:student"/>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Department Template -->
    <xsl:template match="ex:department">
        <tr>
            <td><xsl:value-of select="ex:name"/></td>
            <td><xsl:value-of select="ex:location"/></td>
            <td>
                <ul>
                    <xsl:for-each select="ex:courses/ex:course">
                        <li>
                            <xsl:value-of select="concat(ex:code, ' - ', ex:title, 
                                                ' (', ex:credits, ' credits)')"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </td>
            <td>
                <ul>
                    <xsl:for-each select="ex:teachers/ex:teacher">
                        <li>
                            <xsl:value-of select="concat(ex:name, ' (', ex:email, ')')"/>
                            <ul>
                                <xsl:for-each select="ex:teaches">
                                    <li>
                                        <xsl:value-of select="concat('Course Ref: ', @courseRef, 
                                                            ', Rating: ', @rating)"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </li>
                    </xsl:for-each>
                </ul>
            </td>
        </tr>
    </xsl:template>

    <!-- Student Template -->
    <xsl:template match="ex:student">
        <tr>
            <td><xsl:value-of select="ex:name"/></td>
            <td>
                <xsl:value-of select="concat(
                    ex:programEnrollment/ex:program/ex:name,
                    ' (Started: ',
                    ex:programEnrollment/@year,
                    ')')"/>
            </td>
            <td><xsl:value-of select="ex:email"/></td>
            <td>
                <ul>
                    <xsl:for-each select="ex:courseEnrollments/ex:enrollment">
                        <li>
                            <xsl:value-of select="concat(
                                'Course: ', @courseRef,
                                ', Grade: ', ex:grade,
                                ', ', @semester,
                                ' ', @year)"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>