<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
        <xsl:text>
            
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="pubmed-article">
<xsl:text> 
</xsl:text>
       <xsl:for-each select="article/front/article-meta">
           <xsl:for-each select="contrib-group/contrib[@contrib-type='author']/name">
               <xsl:value-of select="surname"></xsl:value-of><xsl:text>, </xsl:text>
           <xsl:value-of select="given-names"></xsl:value-of>
<xsl:text> 
</xsl:text>
           </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>