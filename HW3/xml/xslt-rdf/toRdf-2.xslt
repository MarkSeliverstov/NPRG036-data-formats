<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ex="http://example.org/vocabulary/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/">
    
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    
    <!-- Root template -->
    <xsl:template match="/">
        <xsl:text>@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .

</xsl:text>
        <xsl:apply-templates select="//ex:student"/>
        <xsl:apply-templates select="//ex:program"/>
        <xsl:apply-templates select="//ex:enrollment"/>
    </xsl:template>

    <!-- Student template -->
    <xsl:template match="ex:student">
        <xsl:text>ex:student</xsl:text><xsl:value-of select="substring-after(@id, 's')"/>
        <xsl:text> a ex:Student ;&#xa;</xsl:text>
        <xsl:text>    ex:id "</xsl:text><xsl:value-of select="substring-after(@id, 's')"/><xsl:text>"^^xsd:integer ;&#xa;</xsl:text>
        <xsl:text>    foaf:name "</xsl:text><xsl:value-of select="ex:name"/><xsl:text>"@en ;&#xa;</xsl:text>
        <xsl:text>    ex:hasEmail &lt;mailto:</xsl:text><xsl:value-of select="ex:email"/><xsl:text>&gt;</xsl:text>
        
        <!-- Handle phone numbers -->
        <xsl:if test="ex:phone">
            <xsl:for-each select="ex:phone">
                <xsl:if test="normalize-space(.) != ''">
                    <xsl:text> ;&#xa;    ex:hasPhone &lt;tel:</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>&gt;</xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        
        <xsl:text> ;&#xa;    ex:enrolledIn ex:program</xsl:text>
        <xsl:value-of select="substring-after(@programRef, 'p')"/>
        <xsl:text> .&#xa;&#xa;</xsl:text>
    </xsl:template>

    <!-- Program template -->
    <xsl:template match="ex:program">
        <xsl:text>ex:program</xsl:text><xsl:value-of select="substring-after(@id, 'p')"/>
        <xsl:text> a ex:Program ;&#xa;</xsl:text>
        <xsl:text>    ex:name "</xsl:text><xsl:value-of select="ex:name"/><xsl:text>"@en ;&#xa;</xsl:text>
        <xsl:text>    ex:duration "</xsl:text><xsl:value-of select="ex:duration"/><xsl:text>"^^xsd:integer .&#xa;&#xa;</xsl:text>
    </xsl:template>

    <!-- Enrollment template -->
    <xsl:template match="ex:enrollment">
        <xsl:text>ex:enrollment</xsl:text><xsl:value-of select="substring-after(@id, 'e')"/>
        <xsl:text> a ex:Enrollment ;&#xa;</xsl:text>
        <xsl:text>    ex:grade "</xsl:text><xsl:value-of select="ex:grade"/><xsl:text>"^^xsd:integer ;&#xa;</xsl:text>
        <xsl:text>    ex:enrolledOn "</xsl:text><xsl:value-of select="ex:enrolledOn"/><xsl:text>"^^xsd:date ;&#xa;</xsl:text>
        <xsl:text>    ex:completedOn "</xsl:text><xsl:value-of select="ex:completedOn"/><xsl:text>"^^xsd:date ;&#xa;</xsl:text>
        <xsl:text>    ex:course ex:course</xsl:text>
        <xsl:value-of select="substring-after(@courseRef, 'c')"/>
        <xsl:text> .&#xa;&#xa;</xsl:text>

        <!-- hasEnrolled relationship -->
        <xsl:text>ex:student</xsl:text>
        <xsl:value-of select="substring-after(ancestor::ex:student/@id, 's')"/>
        <xsl:text> ex:hasEnrolled ex:enrollment</xsl:text>
        <xsl:value-of select="substring-after(@id, 'e')"/>
        <xsl:text> .&#xa;&#xa;</xsl:text>
    </xsl:template>

</xsl:stylesheet>