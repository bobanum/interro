<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml">
    <!--
    ============================================================
    ATTRIBUTE-SETS
    ============================================================
    -->
    <xsl:attribute-set name="name-id">
        <xsl:attribute name="name">
            <xsl:value-of select="ancestor-or-self::*[@name][1]/@name"/>
        </xsl:attribute>
        <xsl:attribute name="id">
            <xsl:value-of select="ancestor-or-self::*[@name][1]/@name"/>
        </xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet> 