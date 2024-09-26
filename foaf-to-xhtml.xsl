<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/">

    <!-- Transformation de RDF vers XHTML -->
    <xsl:output method="html" indent="yes" />

    <!-- Modèle racine -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Profil FOAF de <xsl:value-of select="//foaf:Person/foaf:name"/></title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <h1>Profil FOAF</h1>
                <p><strong>Nom :</strong> <xsl:value-of select="//foaf:Person/foaf:familyName"/></p>
                <p><strong>Prénom :</strong> <xsl:value-of select="//foaf:Person/foaf:givenName"/></p>
                <p><strong>Date de naissance :</strong> <xsl:value-of select="//foaf:Person/foaf:birthday"/></p>
                <p><strong>Email :</strong> <xsl:value-of select="//foaf:Person/foaf:mbox"/></p>
                <p><strong>Organisation :</strong> <xsl:value-of select="//foaf:Person/foaf:organization/foaf:name"/></p>

                <h2>Connaissances</h2>
                <ul>
                    <xsl:for-each select="//foaf:Person/foaf:knows">
                        <li>
                            <xsl:value-of select="foaf:Person/foaf:name"/> 
                            (<a href="{foaf:Person/foaf:homepage/@rdf:resource}">
                                Page personnelle
                            </a>)
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
