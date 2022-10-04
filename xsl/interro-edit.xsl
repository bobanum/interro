<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:z="https://bobanum.github.io/interro" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:template match="/">
        <link href="../css/edit.css" rel="stylesheet"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="z:interro">
        <div class="interro edit">
            <form>
                <xsl:apply-templates select="@titre"/>
                <xsl:apply-templates select="@sous-titre"/>
                <xsl:apply-templates select="z:entete"/>
                <xsl:apply-templates select="z:pied"/>
                <xsl:apply-templates select="z:inter"/>
                <!-- <xsl:apply-templates select="section"/> -->
            </form>
        </div>
    </xsl:template>
    <xsl:template match="@titre">
        <div>
            <label for="titre">Titre</label>
            <input name="titre" id="titre">
                <xsl:attribute name="value">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </input>
        </div>
    </xsl:template>
    <xsl:template match="@sous-titre">
        <div>
            <label for="sous-titre">Sous-titre</label>
            <input name="sous-titre" id="sous-titre">
                <xsl:attribute name="value">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </input>
        </div>
    </xsl:template>
    <xsl:template match="z:entete">
        <div>
            <label for="entete">En-tête</label>
            <textarea class="html" name="entete" id="entete" rows="3" cols="65">
                <xsl:value-of select="."/>
            </textarea>
        </div>
    </xsl:template>
    <xsl:template match="z:pied">
        <div>
            <label for="pied">Pied</label>
            <textarea class="html" name="pied" id="pied" rows="3" cols="65">
                <xsl:value-of select="."/>
            </textarea>
        </div>
    </xsl:template>
    <xsl:template match="z:inter">
        <div class="inter">
            <label for="inter">Inter</label>
            <textarea class="html" name="inter" id="inter" rows="3" cols="65">
                <xsl:value-of select="."/>
            </textarea>
        </div>
    </xsl:template>
    <xsl:template match="section">
        <section>
            <xsl:apply-templates select="@titre|@sous-titre"/>
            <xsl:apply-templates select="z:entete"/>
            <xsl:apply-templates select="z:question"/>
            <xsl:apply-templates select="z:pied"/>
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