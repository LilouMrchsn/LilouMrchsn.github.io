<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/">

    <!-- Transformation from RDF to XHTML -->
    <xsl:output method="html" indent="yes" />

    <!-- Root template -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>FOAF Profile of <xsl:value-of select="//foaf:Person/foaf:name"/></title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <h1>FOAF Profile</h1>
                
                <!-- Displaying the person's details -->
                <p><strong>Name:</strong> <xsl:value-of select="//foaf:Person/foaf:familyName"/></p>
                <p><strong>First Name:</strong> <xsl:value-of select="//foaf:Person/foaf:givenName"/></p>
                <p><strong>Date of Birth:</strong> <xsl:value-of select="//foaf:Person/foaf:birthday"/></p>

                <!-- Email retrieved from rdf:resource attribute -->
                <p><strong>Email:</strong> 
                    <a href="{//foaf:Person/foaf:mbox/@rdf:resource}">
                        <xsl:value-of select="//foaf:Person/foaf:mbox/@rdf:resource"/>
                    </a>
                </p>

                <!-- Organization name extracted from nested foaf:Organization -->
                <p><strong>Organization:</strong> 
                    <xsl:value-of select="//foaf:Person/foaf:organization/foaf:Organization/foaf:name"/>
                </p>

                <!-- Displaying known persons (connections) -->
                <h2>Known People</h2>
                <ul>
                    <xsl:for-each select="//foaf:Person/foaf:knows">
                        <li>
                            <xsl:value-of select="foaf:Person/foaf:name"/> 
                            (<a href="{foaf:Person/foaf:homepage/@rdf:resource}">
                                Personal page
                            </a>)
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
