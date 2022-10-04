<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:template match="/">
        <link href="../css/print.css" rel="stylesheet"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="interro">
        <div class="interro print">
            <xsl:apply-templates select="@titre|@sous-titre"/>
            <xsl:apply-templates select="entete"/>
            <xsl:apply-templates select="section"/>
            <xsl:apply-templates select="pied"/>
        </div>
    </xsl:template>
    <xsl:template match="@titre">
        <h1>
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>
    <xsl:template match="@sous-titre">
        <h2>
            <xsl:value-of select="."/>
        </h2>
    </xsl:template>
    <xsl:template match="entete">
        <header>
            <xsl:value-of select="."/>
        </header>
    </xsl:template>
    <xsl:template match="pied">
        <footer>
            <xsl:value-of select="."/>
        </footer>
    </xsl:template>
    <xsl:template match="inter">
        <div class="inter">
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="section">
        <section>
            <xsl:apply-templates select="@titre|@sous-titre"/>
            <xsl:apply-templates select="entete"/>
            <xsl:apply-templates select="question"/>
            <xsl:apply-templates select="pied"/>
        </section>
    </xsl:template>
    <xsl:template match="question">
        <article>
            <xsl:apply-templates select="@libele|libele"/>
        </article>
    </xsl:template>
    <xsl:template match="libele">
        <div class="libele">
            <xsl:copy-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="@libele">
        <div class="libele">
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
</xsl:stylesheet> 