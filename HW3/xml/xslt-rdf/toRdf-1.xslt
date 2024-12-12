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
        <xsl:apply-templates select="//ex:department"/>
        <xsl:apply-templates select="//ex:teacher"/>
        <xsl:apply-templates select="//ex:course"/>
    </xsl:template>

    <!-- Department template -->
    <xsl:template match="ex:department">
        <xsl:text>ex:dept</xsl:text><xsl:value-of select="substring-after(@id, 'd')"/>
        <xsl:text> a ex:Department ;&#xa;</xsl:text>
        <xsl:text>    ex:name "</xsl:text><xsl:value-of select="ex:name"/><xsl:text>"@en ;&#xa;</xsl:text>
        <xsl:text>    ex:location "</xsl:text><xsl:value-of select="ex:location"/><xsl:text>"@en ;&#xa;</xsl:text>
        <xsl:text>    ex:offers ex:course</xsl:text>
        <xsl:value-of select="substring-after(ex:courses/ex:course/@id, 'c')"/>
        <xsl:text> .&#xa;&#xa;</xsl:text>
    </xsl:template>

    <!-- Teacher template -->
    <xsl:template match="ex:teacher">
        <xsl:text>ex:teacher</xsl:text><xsl:value-of select="substring-after(@id, 't')"/>
        <xsl:text> a ex:Teacher ;&#xa;</xsl:text>
        <xsl:text>    ex:id "</xsl:text><xsl:value-of select="substring-after(@id, 't')"/><xsl:text>"^^xsd:integer ;&#xa;</xsl:text>
        <xsl:text>    foaf:name "</xsl:text><xsl:value-of select="ex:name"/><xsl:text>"@en ;&#xa;</xsl:text>
        <xsl:text>    ex:hasEmail &lt;mailto:</xsl:text><xsl:value-of select="ex:email"/><xsl:text>&gt; ;&#xa;</xsl:text>
        <xsl:text>    ex:hasPhone &lt;tel:</xsl:text><xsl:value-of select="ex:phone"/><xsl:text>&gt; ;&#xa;</xsl:text>
        <xsl:text>    ex:teaches </xsl:text>
        <xsl:for-each select="ex:teaches">
            <xsl:text>ex:course</xsl:text>
            <xsl:value-of select="substring-after(@courseRef, 'c')"/>
            <xsl:if test="position() != last()">
                <xsl:text> , </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text> ;&#xa;</xsl:text>
        <xsl:text>    ex:belongsTo ex:dept</xsl:text>
        <xsl:value-of select="substring-after(ancestor::ex:department/@id, 'd')"/>
        <xsl:text> .&#xa;&#xa;</xsl:text>
    </xsl:template>

    <!-- Course template -->
    <xsl:template match="ex:course">
        <xsl:text>ex:course</xsl:text><xsl:value-of select="substring-after(@id, 'c')"/>
        <xsl:text> a ex:Course ;&#xa;</xsl:text>
        <xsl:text>    ex:code "</xsl:text><xsl:value-of select="ex:code"/><xsl:text>" ;&#xa;</xsl:text>
        <xsl:text>    ex:title "</xsl:text><xsl:value-of select="ex:title"/><xsl:text>"@en ;&#xa;</xsl:text>
        <xsl:text>    ex:credits "</xsl:text><xsl:value-of select="ex:credits"/><xsl:text>"^^xsd:integer .&#xa;&#xa;</xsl:text>
    </xsl:template>

</xsl:stylesheet>