<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml">
    <!--
    ============================================================
    NAMED TEMPLATES
    ============================================================
    -->
    <xsl:template name="label">
        <label>
            <xsl:attribute name="for">
                <xsl:value-of select="@name"/>
            </xsl:attribute>
            <xsl:value-of select="xs:annotation/xs:documentation"/>
        </label>
    </xsl:template>
    <xsl:template name="text-restriction" mode="champ">
        <xsl:param name="attribute" select="."></xsl:param>
        <xsl:param name="restriction" select="."></xsl:param>
        <xsl:for-each select="$attribute">
            <input type="text" xsl:use-attribute-sets="name-id">
                <xsl:apply-templates select="$restriction/xs:pattern"/>
            </input>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet> 