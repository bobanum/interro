<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:include href="named-templates.xsl" />
    <xsl:template match="/">
        <form>
            <xsl:apply-templates/>
        </form>
    </xsl:template>
    <xsl:template match="xs:schema">
        <xsl:apply-templates select="xs:element[@name='interro']"/>
    </xsl:template>
    <xsl:template match="xs:element[@name='interro']">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="xs:complexType">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="xs:attribute">
        <div>
            <xsl:call-template name="label"></xsl:call-template>
            <xsl:apply-templates select="." mode="champ"/>
        </div>
    </xsl:template>
    <xsl:template match="xs:attribute[@type='xs:string']" mode="champ">
        <xsl:call-template name="text-restriction"></xsl:call-template>
        <!-- <input type="text" xsl:use-attribute-sets="name-id">
            <xsl:apply-templates select="xs:pattern"/>
        </input> -->
    </xsl:template>
    <xsl:template match="xs:restriction[@base='xs:string']" mode="champ">
        <input type="text" xsl:use-attribute-sets="name-id">
            <xsl:apply-templates select="xs:pattern"/>
        </input>
    </xsl:template>
    <xsl:template match="xs:attribute[@type='xs:date']" mode="champ">
        <input type="date" xsl:use-attribute-sets="name-id"></input>
    </xsl:template>
    <xsl:template match="xs:attribute[xs:simpleType[xs:restriction]]" mode="champ">
        <xsl:call-template name="text-restriction">
            <xsl:with-param name="restriction" select="xs:simpleType/xs:restriction"></xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="xs:attribute[starts-with(@type, 'z:')]" mode="champ">
        <xsl:variable name="type" select="substring-after(self::*/@type,':')"/>
        <xsl:apply-templates select="//xs:simpleType[@name=$type]">
            <xsl:with-param name="attribute" select="."></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="xs:simpleType[@name][xs:restriction]">
        <xsl:param name="attribute"></xsl:param>
        <xsl:call-template name="text-restriction">
            <xsl:with-param name="attribute" select="$attribute"></xsl:with-param>
            <xsl:with-param name="restriction" select="xs:restriction"></xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="xs:pattern">
        <xsl:attribute name="pattern">
            <xsl:value-of select="@value"/>
        </xsl:attribute>
        <xsl:apply-templates select="xs:annotation/xs:documentation"/>
    </xsl:template>
    <xsl:template match="xs:annotation/xs:documentation">
        <xsl:attribute name="placeholder">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    <!--
    ============================================================
    NAMED TEMPLATES
    ============================================================
    -->
    <!--
    ============================================================
    ATTRIBUTE-SETS
    ============================================================
    -->
    <xsl:include href="attribute-sets.xsl" />
</xsl:stylesheet> 