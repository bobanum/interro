<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml">
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
    <xsl:template name="label">
        <label>
            <xsl:attribute name="for">
                <xsl:value-of select="@name"/>
            </xsl:attribute>
            <xsl:value-of select="xs:annotation/xs:documentation"/>
        </label>
    </xsl:template>
    <xsl:template match="xs:attribute">
        <div>
            <xsl:call-template name="label"></xsl:call-template>
            <xsl:apply-templates select="." mode="champ"/>
***
        </div>
    </xsl:template>
    <xsl:attribute-set name="name-id">
        <xsl:attribute name="name">
            <xsl:value-of select="ancestor-or-self::*[@name][1]/@name"/>
        </xsl:attribute>
        <xsl:attribute name="id">
            <xsl:value-of select="ancestor-or-self::*[@name][1]/@name"/>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:template match="xs:attribute[@type='xs:string']|xs:restriction[@base='xs:string']" mode="champ">
        <input type="text" xsl:use-attribute-sets="name-id">
            <xsl:apply-templates select="xs:pattern"/>
        </input>
    </xsl:template>
    <xsl:template match="xs:attribute[@type='xs:date']" mode="champ">
        <input type="date" xsl:use-attribute-sets="name-id"></input>
    </xsl:template>
    <xsl:template match="xs:attribute[xs:simpleType]" mode="champ">
        <xsl:apply-templates select="xs:simpleType/*" mode="champ"/>
    </xsl:template>
    <xsl:template match="xs:attribute[starts-with(@type, 'z:')]" mode="champ">
        <xsl:variable name="type" select="substring-after(self::*/@type,':')"/>
        <xsl:apply-templates select="//xs:simpleType[@name=$type]">
            <xsl:with-param name="referer" select="."></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="xs:simpleType[@name]">
        <xsl:param name="referer"></xsl:param>
        <xsl:copy-of select=".">
            
        </xsl:copy-of>
        58<xsl:value-of select="name($referer)"/>
        <xsl:value-of select="$referer">
        </xsl:value-of>
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

</xsl:stylesheet> 