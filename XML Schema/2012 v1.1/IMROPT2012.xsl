<?xml version="1.0" encoding="UTF-8"?>

<!-- 
// XSL StyleSheet IMROPT2012 versie t.b.v. RFC0002
-->
<!-- =================================================================================	-->
<!-- XSL StyleSheet versie 2.0.1							-->
<!-- lokale versie        						 		-->
<!-- behorende bij IMROPT2012 versie 1.1.         					-->
<!-- onderdeel van RO Standaarden 2012		                            		-->
<!-- geimplementeerd in Ruimtelijkeplannen.nl vanaf de release van juli 2015		-->
<!-- met aansluitende patch voor niet werkende verwijzing naar bijlagen 		-->
<!-- =================================================================================	-->
<!-- Geonovum, Beheerorganisatie RO Standaarden. http://ro-standaarden.geonovum.nl 	-->
<!-- =================================================================================	-->
<!-- In deze versie zijn de volgende gecombineerde issues uit Mantis 4209 en 		-->
<!-- 4598 opgelost:									-->
<!-- - betere navigatie met knoppen vorige-volgende artikel				-->
<!-- - betere inhoudsopgave plus menu							-->
<!-- - betere metadata bovenaan								-->
<!-- - betere printbaarheid								-->
<!-- - betere beschrijving XSL/CSS in RO Standaarden					-->
<!-- - keuze voor opmaak in STYLE of CLASS attributen					-->
<!-- - aanmaken link naar externe bestanden als er geen naam voorkomt in de titelinfo	-->
<!-- - patch: reparatie transformatie van links voor bijlagen				-->
<!-- =================================================================================	-->

<xsl:stylesheet version="2.0" xmlns:xhtml="http://www.w3.org/1999/xhtml" 
                              xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:xl="http://www.w3.org/1999/xlink"
                              xmlns:imropt="http://www.geonovum.nl/imro/pt/2012/1.0">

   <xsl:output method="html" version="4.0" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>

   <xsl:variable name="planidn"><xsl:value-of select="//imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:verwijzingNaarPlangebied" /></xsl:variable>
   
   <xsl:template match="/">
      <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
         <head>
            <title><xsl:value-of select="//imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:naam" /></title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
            <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
            <link rel="stylesheet" type="text/css" href="IMROPT2012.css" />
            <link rel="stylesheet" type="text/css" href="IMROPT2012print.css" media="print" />
            <script type="text/javascript" defer="defer">
            <xsl:text disable-output-escaping="yes">
               <![CDATA[ 
                  function popUp(elementId) 
                     {                 
                     cancelPopup();
                        
                     var popupIE = document.createElementNS('http://www.w3.org/1999/xhtml','div');
                     popupIE.setAttribute('class', 'popupIE');
                     popupIE.setAttribute('id', 'popupIE');
                     
                     var popup = document.createElementNS('http://www.w3.org/1999/xhtml','div');
                     popup.setAttribute('class', 'popup');
                     popupIE.appendChild(popup);
                     
                     var popupTop = document.createElementNS('http://www.w3.org/1999/xhtml','div');
                     popupTop.setAttribute('class', 'popupTop');
                     popup.appendChild(popupTop);
                     
                     var cancel = document.createElementNS('http://www.w3.org/1999/xhtml','div');
                     cancel.setAttribute('class', 'cancelButton');
                     cancel.textContent = "X";
                     cancel.setAttribute('onclick', 'cancelPopup();');
                     cancel.setAttribute('href', 'javascript:void(0);');
                     cancel.addEventListener('click', cancelPopup, false);

                     popupTop.appendChild(cancel);
                     
                     var print = document.createElementNS('http://www.w3.org/1999/xhtml','div');
                     print.setAttribute('class', 'printButton');
                     print.textContent = "\u00A0\u00A0\u00A0\u00A0 Afdrukken";
                     print.setAttribute('onclick', 'printPopup();');
                     print.setAttribute('href', 'javascript:void(0);');
                     print.addEventListener('click', printPopup, false);

                     popupTop.appendChild(print);
                     
                     var popupTekst = document.createElementNS('http://www.w3.org/1999/xhtml','div');
                     popupTekst.setAttribute('class', 'popupTekst');
                     popup.appendChild(popupTekst);
                     
                     popupTekst.appendChild(document.getElementById(elementId).cloneNode(true));
           
                     var elements = document.getElementsByTagName('body')
                     elements[0].appendChild(popupIE);
                     }
                 
                  function cancelPopup () 
                     { 
                     var toDestroy = document.getElementById('popupIE');
                     if (toDestroy != null)
                        {
                        toDestroy.parentNode.removeChild(toDestroy);
                        }
                     }
                     
                  function printPopup() 
                     {
                     window.print();
                     }
               ]]> 
            </xsl:text>
            </script>
         </head>
         <body>
            
            <div id="container" class="container" xmlns="http://www.w3.org/1999/xhtml">
               <!-- Begin -->
               <div id="begin" class="begin"></div>
               
               <!-- Koptekst -->
               <div id="koptekst" class="koptekst">
                  <div class="titel">
                     <a>
                        <xsl:attribute name="title" ><xsl:value-of select="//imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:naam"/></xsl:attribute>
                        <xsl:value-of select="//imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:naam" />
                     </a>
                  </div>
                  
                  <!-- Planeigenschappen (metadata) -->
                  <div id="plangegevens" class="plangegevens" xmlns="http://www.w3.org/1999/xhtml">
                     <table class="metadata">
                        <tr><td><strong>Plantype:</strong></td><td><a title="Het type instrument (plan, visie, of besluit) waarop deze tekst van toepassing is"><xsl:value-of select="imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:typePlan" /></a></td></tr>
                        <tr><td><strong>Overheid:</strong></td><td><a title="De beleidsmatig verantwoordelijke overheid voor dit instrument"><xsl:value-of select="imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:beleidsmatigVerantwoordelijkeOverheid" />: <xsl:value-of select="imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:naamOverheid" /></a></td></tr>
                        <tr><td><strong>Plan:</strong></td><td><a title="De identificatie van dit instrument"><xsl:value-of select="imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:verwijzingNaarPlangebied" /></a></td></tr>
                     </table>
                  </div>
                  
                  <div id="hoofdmenu" class="navigatie" xmlns="http://www.w3.org/1999/xhtml">
                     <ul>
                        <xsl:apply-templates select="/" mode="menubalk" />
                        <li>
                           <a class="menubalkKaart" href="http://www.ruimtelijkeplannen.nl/web-roo/?planidn={//imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:verwijzingNaarPlangebied}">Kaart</a>
                        </li>
                        <li>
                           <xsl:variable name="apos">'</xsl:variable>
                           <a class="menubalkAfdrukken" href="javascript:void(0)" >
                              <xsl:attribute name="onclick"><xsl:value-of select="concat('popUp(',$apos,//imropt:FeatureCollectionIMROPT/imropt:TekstObject[1]/@identificatie,$apos,');')" /></xsl:attribute>
                              <xsl:text>Afdrukken</xsl:text>
                           </a>
                        </li>
                     </ul>
                  </div>

                  <div id="topmenu" class="topnavigatie" xmlns="http://www.w3.org/1999/xhtml">
                     <ul>
                        <li>
                           <a class="topindexButton">
                                <xsl:attribute name="href">#inhoud<xsl:value-of select="//imropt:TekstObject[imropt:volgnummer = 2]/@identificatie" /></xsl:attribute>
                                <xsl:attribute name="title">Scroll naar top van inhoudsopgave</xsl:attribute>
                                <xsl:text>Top</xsl:text>
                           </a>             
                        </li>
                        <li>
                           <a class="toptekstButton">
                                <xsl:attribute name="href">#<xsl:value-of select="//imropt:TekstObject[imropt:niveau = 0]/@identificatie" /></xsl:attribute>
                                <xsl:attribute name="title">Scroll naar top van tekst</xsl:attribute>
                                <xsl:text>Top</xsl:text>
                           </a>
                        </li>
                     </ul>
                  </div>
                  
               </div>
                  
               <div id="tekst" class="tekst" xmlns="http://www.w3.org/1999/xhtml">
                  <!-- Inhoudsopgave -->
                  <div id="inhoudsopgave" class="inhoudsopgave2">
                     <ul>
                        <xsl:for-each select="//imropt:TekstObject">
                           <xsl:sort select="imropt:volgnummer" data-type="number"/>
                           <xsl:call-template name="inhoudsopgaveMaken" />
                        </xsl:for-each>
                     </ul>
                  </div>
                  
                  <!-- Alle inhoud -->
                  <div id="inhoud" class="inhoud" xmlns="http://www.w3.org/1999/xhtml">
              
                     <!--  EERSTE FASE: maak de TekstObjecten genest in plaats van plat. Dit is nodig om een geheel 
                           hoofdstuk/artikel/paragraaf te kunnen selecteren (voor bijvoorbeeld het printen hiervan) -->
                     <xsl:variable name="eersteFase">
                        <xsl:apply-templates select="//imropt:TekstObject[imropt:niveau = 0]" mode="maak" />
                     </xsl:variable>

                     <!--  TWEEDE FASE: export naar HTML -->
                     <xsl:apply-templates select="$eersteFase" mode="uitvoer" />
                  </div>
               </div>

               <!-- Eind -->
               <div id="eind" class="eind" xmlns="http://www.w3.org/1999/xhtml"></div>
            </div>
         </body>
      </html>
   </xsl:template>

   <!-- Tijdens 'menubalk': maak de knoppen voor de navigatie -->
   <xsl:template match="imropt:TekstObject" mode="menubalk">
      <xsl:choose>
        <xsl:when test="imropt:niveau = 1">
           <li xmlns="http://www.w3.org/1999/xhtml">
              <a class="menubalk" xmlns="http://www.w3.org/1999/xhtml">
                 <xsl:attribute name="onclick" >window.open('#inhoud<xsl:value-of select="@identificatie"/>', '_self'); window.open('#<xsl:value-of select="@identificatie"/>', '_self');</xsl:attribute>
                  <xsl:choose> 
                     <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                        <xsl:value-of select='normalize-space(concat (translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:naam, 1, 1), 
                                                                                "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                                                                      translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:naam, 2), 
                                                                                "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")))' />
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select='normalize-space(concat (translate(substring(imropt:type, 1, 1), "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                                                                      translate(substring(imropt:type, 2), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")))' />
                     </xsl:otherwise>
                  </xsl:choose>
              </a>
           </li>
        </xsl:when>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="text()|@*" mode="menubalk">
   </xsl:template>

   <!-- Tijdens 'maak': copy contents (attributes en text) -->
   <xsl:template match="*|/" mode="maak">
      <xsl:copy-of select="."/>
   </xsl:template>

   <xsl:template match="text()|@*" mode="maak">
      <xsl:copy-of select="."/>
   </xsl:template>

   <!-- Tijdens 'zoek': copy contents (attributes en text) -->
   <xsl:template match="*|/" mode="zoek">
      <xsl:copy-of select="."/>
   </xsl:template>

   <xsl:template match="text()|@*" mode="zoek">
      <xsl:copy-of select="."/>
   </xsl:template>

   <!-- Eerste fase (opbouwen): herschikken van de lijst van TekstObjecten naar geneste TekstObjecten -->
   <xsl:template match="imropt:TekstObject" mode="maak">
      <xsl:param name="niveaus" select="'|'"/>
      
      <xsl:variable name="volgnummer" select="imropt:volgnummer"/>
      <xsl:variable name="huidigeNiveau" select="imropt:niveau"/>
      
      <xsl:if test="not(contains($niveaus,concat('|',$huidigeNiveau,'|')))">
         <xsl:variable name="vNext" select="//imropt:TekstObject[imropt:volgnummer = $volgnummer+1]"/>
         <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="maak"/>
            <xsl:apply-templates select="$vNext" mode="maak">
               <xsl:with-param name="niveaus" select="concat($niveaus, $huidigeNiveau,'|')" />
            </xsl:apply-templates>
         </xsl:copy>
         
         <xsl:apply-templates select="$vNext" mode="zoek">
            <xsl:with-param name="niveaus" select="$niveaus"/>
            <xsl:with-param name="zoekNiveau" select="imropt:niveau"/>
         </xsl:apply-templates>
      </xsl:if>
   </xsl:template>

   <!-- Eerste fase (zoeken): herschikken van de lijst van TekstObjecten naar geneste TekstObjecten -->
   <xsl:template match="imropt:TekstObject" mode="zoek">
      <xsl:param name="niveaus"/>
      <xsl:param name="zoekNiveau"/>
        
      <xsl:variable name="volgnummer" select="imropt:volgnummer"/>
      <xsl:variable name="huidigeNiveau" select="imropt:niveau"/>
      
      <xsl:if test="not(contains($niveaus,concat('|',$huidigeNiveau,'|')))">
         <xsl:choose> 
            <xsl:when test="$huidigeNiveau = $zoekNiveau">
               <xsl:apply-templates select="." mode="maak">
                  <xsl:with-param name="niveaus" select="$niveaus"/>
               </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates select="//imropt:TekstObject[imropt:volgnummer = $volgnummer+1]" mode="zoek">
                  <xsl:with-param name="niveaus" select="$niveaus"/>
                  <xsl:with-param name="zoekNiveau" select="$zoekNiveau"/>
               </xsl:apply-templates>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

   <!-- Tweede fase: vertalen naar HTML -->
   <xsl:template match="imropt:TekstObject" mode="uitvoer">
      <div xmlns="http://www.w3.org/1999/xhtml">
         <!-- Koppelen van de id aan deze div -->
         <xsl:attribute name="id" >
            <xsl:value-of select="@identificatie"/>
         </xsl:attribute>

         <!-- Uitvoeren van titel -->
         <xsl:call-template name="titelMaken" />

         <!-- Uitvoeren van tekst zelve -->
         <xsl:apply-templates select="xhtml:tekst" />

         <!-- Uitvoeren van de inmiddels geneste TekstObject-en -->
         <xsl:apply-templates select="imropt:TekstObject" mode="uitvoer" />
      </div>
   </xsl:template>  
   
   <xsl:template name="titelMaken">
      <!-- Speciale classes -->
      <xsl:if test="imropt:objectType='begripsbepaling'">
         <xsl:attribute name="class">begripsbepaling</xsl:attribute>
      </xsl:if>
     
      <xsl:variable name="titelLabelEnNummer" 
                    select='normalize-space(concat (translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:label, 1, 1), "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                                                    translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:label, 2), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), " ",
                                                    imropt:titelInfo/imropt:TitelInfo/imropt:nummer, "  "))' />
      
      <xsl:variable name="titelNaam" select='imropt:titelInfo/imropt:TitelInfo/imropt:naam' />

      <xsl:variable name="tekstNaam" select='concat(
               translate(substring(//imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:naam, 1, 1), "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
               translate(substring(//imropt:FeatureCollectionIMROPT/imropt:TekstMetadata/imropt:naam, 2), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"))' />
      
      <!-- Afhankelijk van het objectniveau wordt de titel gegenereerd -->
      <!-- Soms is er een externeVerwijzing, als deze er is, dan kan op de titel worden doorgeklikt -->
      
      <xsl:choose>
        <xsl:when test="imropt:niveau = 0">
           <xsl:variable name="apos">'</xsl:variable>
           <div class="titelInTekst" xmlns="http://www.w3.org/1999/xhtml"><xsl:value-of select='normalize-space($titelNaam)' />&#160;
              <a href="javascript:void(0)" class="popupButton">
                   <xsl:attribute name="onclick"><xsl:value-of select="concat('popUp(',$apos,@identificatie,$apos,');')" /></xsl:attribute>
                   <xsl:attribute name="title">Afdrukken van &quot;<xsl:value-of select="$titelNaam"/>&quot;</xsl:attribute>
                   <xsl:text>&#160;&#160;</xsl:text>
              </a>
           </div>
        </xsl:when>
        <xsl:when test="imropt:niveau = 1">
           <xsl:if test='normalize-space($titelNaam) != ""'>
              <!--hr xmlns="http://www.w3.org/1999/xhtml" /-->
           </xsl:if>
           <xsl:choose>
              <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:label) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:nummer) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                 <h1 xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h1>
              </xsl:when>
              <xsl:otherwise>
                 <h1 class="zonderTitel" xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h1>
              </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:when test="imropt:niveau = 2">
           <xsl:if test="imropt:typeTekst = 'document'">
              <!--hr xmlns="http://www.w3.org/1999/xhtml" /-->
           </xsl:if>
           <xsl:choose>
              <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:label) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:nummer) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                 <h2 xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h2>
              </xsl:when>
              <xsl:otherwise>
                 <h2 class="zonderTitel" xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h2>
              </xsl:otherwise>
           </xsl:choose>
        </xsl:when>
        <xsl:when test="imropt:niveau = 3">
           <xsl:choose>
              <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:label) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:nummer) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                 <h3 xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h3>
              </xsl:when>
              <xsl:otherwise>
                 <h3 class="zonderTitel" xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h3>
              </xsl:otherwise>
           </xsl:choose>
        </xsl:when>
        <xsl:when test="imropt:niveau = 4">
           <xsl:choose>
              <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:label) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:nummer) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                 <h4 xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h4>
              </xsl:when>
              <xsl:otherwise>
                 <h4 class="zonderTitel" xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h4>
              </xsl:otherwise>
           </xsl:choose>
        </xsl:when>
        <xsl:when test="imropt:niveau = 5">
           <xsl:choose>
              <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:label) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:nummer) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                 <h5 xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h5>
              </xsl:when>
              <xsl:otherwise>
                 <h5 class="zonderTitel" xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h5>
              </xsl:otherwise>
           </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
           <xsl:choose>
              <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:label) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:nummer) &gt; 0 or 
                              string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                 <h6 xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h6>
              </xsl:when>
              <xsl:otherwise>
                 <h6 class="zonderTitel" xmlns="http://www.w3.org/1999/xhtml"><xsl:call-template name="titelInTekstWeergeven" /></h6>
              </xsl:otherwise>
           </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="inhoudsopgaveMaken">
      <xsl:choose>
        <xsl:when test="imropt:niveau = 0">
        </xsl:when>
        <xsl:when test="imropt:niveau = 1">
          <!--hr  xmlns="http://www.w3.org/1999/xhtml"/-->
          <xsl:call-template name="titelInInhoudsopgaveMaken" />
        </xsl:when>
         <xsl:otherwise>
            <xsl:call-template name="titelInInhoudsopgaveMaken" />
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="titelInInhoudsopgaveMaken">
                                              
      <xsl:choose>
         <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:label) &gt; 0 or 
                         string-length(imropt:titelInfo/imropt:TitelInfo/imropt:nummer) &gt; 0 or 
                         string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                         
            <xsl:variable name="titelLabelEnNummer" 
                          select='concat (translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:label, 1, 1), "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                                          translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:label, 2), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), " ",
                                          imropt:titelInfo/imropt:TitelInfo/imropt:nummer, "  ")' />
                               
            <xsl:variable name="titelNaam" 
                          select='concat (translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:naam, 1, 1), "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                                                    substring(imropt:titelInfo/imropt:TitelInfo/imropt:naam, 2))' />
                         
            <li xmlns="http://www.w3.org/1999/xhtml">
               <xsl:attribute name="class"><xsl:value-of select='concat("inhoudsopgave-h",imropt:niveau)'/></xsl:attribute>
               <xsl:attribute name="id">inhoud<xsl:value-of select='@identificatie'/></xsl:attribute>
               <a>
                     <xsl:attribute name="href">#<xsl:value-of select="@identificatie"/></xsl:attribute>
                     <xsl:attribute name="title"><xsl:value-of select="$titelNaam"/></xsl:attribute>
                 <xsl:value-of select='$titelLabelEnNummer' />
                 <xsl:value-of select='$titelNaam' />
               </a>
            </li>
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="imropt:externeVerwijzing">
                  <li class="inhoudsopgave2-doc" xmlns="http://www.w3.org/1999/xhtml">
                     <xsl:attribute name="class"><xsl:value-of select='concat("inhoudsopgave-h",imropt:niveau)'/></xsl:attribute>
                     <xsl:attribute name="id">#inhoud<xsl:value-of select='@identificatie'/></xsl:attribute>
                     <a>
                           <xsl:attribute name="href">#<xsl:value-of select="@identificatie"/></xsl:attribute>
                           <xsl:attribute name="title"><xsl:value-of select="imropt:externeVerwijzing"/></xsl:attribute>
                        <!--hr /-->
                        <xsl:value-of select='imropt:externeVerwijzing' />
                     </a>
                  </li>
               </xsl:when>
               <xsl:otherwise>
                  <li xmlns="http://www.w3.org/1999/xhtml">
                     <xsl:attribute name="class"><xsl:value-of select='concat("inhoudsopgave-h",imropt:niveau, " zonderTitel")'/></xsl:attribute>
                     <xsl:attribute name="id">inhoud<xsl:value-of select='@identificatie'/></xsl:attribute>
                     <a xmlns="http://www.w3.org/1999/xhtml">
                           <xsl:attribute name="href">#<xsl:value-of select="@identificatie"/></xsl:attribute>
                       <xsl:text>Zonder titel</xsl:text>
                     </a>
                  </li>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="titelInTekstWeergeven">
      
      <xsl:choose>
         <xsl:when test="string-length(imropt:titelInfo/imropt:TitelInfo/imropt:label) &gt; 0 or 
                         string-length(imropt:titelInfo/imropt:TitelInfo/imropt:nummer) &gt; 0 or 
                         string-length(imropt:titelInfo/imropt:TitelInfo/imropt:naam) &gt; 0">
                         
            <xsl:variable name="titelLabelEnNummer" select='concat (translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:label, 1, 1), "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"), 
                                                                    translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:label, 2), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), " ", 
                                                                    imropt:titelInfo/imropt:TitelInfo/imropt:nummer, "  ")' />

            <xsl:variable name="titelNaam" select='concat (translate(substring(imropt:titelInfo/imropt:TitelInfo/imropt:naam, 1, 1), "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                                                           substring(imropt:titelInfo/imropt:TitelInfo/imropt:naam, 2))' />
            <xsl:choose>
                       
               <xsl:when test="imropt:externeVerwijzing">
                     <!-- XREF FIX 14 juli 2015 -->
                     <a class="externeVerwijzing" xmlns="http://www.w3.org/1999/xhtml">
                              <xsl:attribute name="href">http://www.ruimtelijkeplannen.nl/documents/<xsl:value-of select="$planidn" />/<xsl:value-of select="imropt:externeVerwijzing"/></xsl:attribute>
                              <xsl:attribute name="title"><xsl:value-of select="$titelNaam"/></xsl:attribute>
                        <!--hr /-->
                        <xsl:value-of select='$titelLabelEnNummer' />
                        <xsl:value-of select='$titelNaam' />
                     </a>
                  </xsl:when>
                <xsl:otherwise>
                   <xsl:variable name="apos">'</xsl:variable>
                   <xsl:value-of select='$titelLabelEnNummer' />
                   <xsl:value-of select='$titelNaam' />
                   &#160;
                   <a xmlns="http://www.w3.org/1999/xhtml">
                      <xsl:attribute name="href"><xsl:text>javascript:void(0);</xsl:text></xsl:attribute>
                      <xsl:attribute name="onclick"><xsl:value-of select="concat('popUp(',$apos,@identificatie,$apos,');')" /></xsl:attribute>
                      <xsl:attribute name="title">Afdrukken van &quot;<xsl:value-of select="$titelNaam"/>&quot;</xsl:attribute>
                      <xsl:attribute name="class">popupButton</xsl:attribute>
                      <xsl:text>&#160;&#160;</xsl:text>
                   </a>
                </xsl:otherwise>
             </xsl:choose>
         </xsl:when>
         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="imropt:externeVerwijzing">
                     <!-- XREF FIX 14 juli 2015 -->
                     <a class="externeVerwijzing" xmlns="http://www.w3.org/1999/xhtml">
                              <xsl:attribute name="href">http://www.ruimtelijkeplannen.nl/documents/<xsl:value-of select="$planidn" />/<xsl:value-of select="imropt:externeVerwijzing"/></xsl:attribute>
                              <xsl:attribute name="title"><xsl:value-of select="imropt:externeVerwijzing"/></xsl:attribute>
                        <!--hr /-->
                        <xsl:value-of select='imropt:externeVerwijzing' />
                     </a>
                  </xsl:when>
                <xsl:otherwise>
                   <xsl:variable name="apos">'</xsl:variable>
                   Zonder titel&#160;
                   <a xmlns="http://www.w3.org/1999/xhtml">
                      <xsl:attribute name="href"><xsl:text>javascript:void(0);</xsl:text></xsl:attribute>
                      <xsl:attribute name="onclick"><xsl:value-of select="concat('popUp(',$apos,@identificatie,$apos,');')" /></xsl:attribute>
                      <xsl:attribute name="title">Afdrukken van onderstaande tekst</xsl:attribute>
                      <xsl:attribute name="class">popupButton</xsl:attribute>
                      <xsl:text>&#160;&#160;</xsl:text>
                   </a>
                </xsl:otherwise>
             </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template match="imropt:tekst">
      <xsl:apply-templates />
   </xsl:template>
   
   <xsl:template match="xhtml:tekst">
      <xsl:apply-templates />
   </xsl:template>

   <xsl:template match="imropt:verwijzingNorm">
      <xsl:value-of select="." />&#160;
   </xsl:template>

   <xsl:template match="imropt:verwijzingNaarPlangebied">
      <p><xsl:value-of select="@xl:href" /></p>
   </xsl:template>
   
   <xsl:template match="imropt:toegevoegd">
       <ins xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates select="@*"/><xsl:apply-templates /></ins>
   </xsl:template>
   
   <xsl:template match="imropt:verwijderd">
       <del xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates select="@*"/><xsl:apply-templates /></del>
   </xsl:template>
   
   <xsl:template match="imropt:interneVerwijzing">
       <a class="interneVerwijzing" xmlns="http://www.w3.org/1999/xhtml">
         <!-- XREF FIX 14 juli 2015 -->
         <xsl:choose> 
            <xsl:when test="substring(@xl:href, 1, 1) = '#'">
               <xsl:attribute name="href"><xsl:value-of select="@xl:href"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
               <xsl:attribute name="href">http://www.ruimtelijkeplannen.nl/documents/<xsl:value-of select="$planidn" />/<xsl:value-of select="@xl:href"/></xsl:attribute>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="@*[not(name()='xl:href')]"/><xsl:apply-templates />
       </a>
   </xsl:template>

   <xsl:template match="imropt:externeVerwijzing">
       <a class="externeVerwijzing" xmlns="http://www.w3.org/1999/xhtml">
         <!-- XREF FIX 14 juli 2015 -->
         <xsl:choose> 
            <xsl:when test="substring(@xl:href, 1, 4) = 'http'">
               <xsl:attribute name="href"><xsl:value-of select="@xl:href"/></xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
               <xsl:attribute name="href">http://www.ruimtelijkeplannen.nl/documents/<xsl:value-of select="$planidn" />/<xsl:value-of select="@xl:href"/></xsl:attribute>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates select="@*[not(name()='xl:href')]"/><xsl:apply-templates />
       </a>
   </xsl:template>
   
   <xsl:template match="imropt:voetnoot">
      <span xmlns="http://www.w3.org/1999/xhtml" class="voetnoot">
          <a href="#ie-void">
            <sup>voetnoot<span>: <xsl:apply-templates /></span></sup>
          </a>
       </span>
   </xsl:template>
   
   <!--   
   <xsl:template match="@imropt:identificatie">
         <p xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
              <xsl:value-of select="."/>
            </xsl:attribute>
         </p>
   </xsl:template>
   -->
   
   <xsl:template match="@xl:href">
      <xsl:attribute name="href">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   
   <xsl:template match="@xl:type">
      <xsl:attribute name="type">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>

   <xsl:template match="xhtml:p">
       <p xmlns="http://www.w3.org/1999/xhtml">
         <xsl:copy-of select="@*" />
         <xsl:apply-templates />
       </p>
   </xsl:template>

   <xsl:template match="xhtml:br">
       <br xmlns="http://www.w3.org/1999/xhtml" />
   </xsl:template>

   <xsl:template match="xhtml:em">
      <xsl:choose>
         <xsl:when test="normalize-space()=''">
         </xsl:when>
         <xsl:otherwise>
            <em xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates /></em>
         </xsl:otherwise>     
      </xsl:choose>
   </xsl:template>

   <xsl:template match="xhtml:strong">
      <xsl:choose>
         <xsl:when test="normalize-space()=''">
         </xsl:when>
         <xsl:otherwise>
            <strong xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates /></strong>
         </xsl:otherwise>     
      </xsl:choose>
   </xsl:template>

   <xsl:template match="xhtml:sub">
       <sub xmlns="http://www.w3.org/1999/xhtml">
         <xsl:apply-templates />
      </sub>
   </xsl:template>

   <xsl:template match="xhtml:sup">
       <sup xmlns="http://www.w3.org/1999/xhtml">
         <xsl:apply-templates />
       </sup>
   </xsl:template>

   <xsl:template match="xhtml:ul">
       <ul xmlns="http://www.w3.org/1999/xhtml">
         <!-- list-style-type en type zijn niet toegestaan => vertaal naar class -->
         <xsl:choose>
            <xsl:when test="@class">
               <xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
            </xsl:when>
            <xsl:when test="@list-style-type">
               <xsl:attribute name="class"><xsl:value-of select="@list-style-type"/></xsl:attribute>
            </xsl:when>
            <xsl:when test="@type">
               <xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*" />
         <xsl:apply-templates />
       </ul>
   </xsl:template>

   <xsl:template match="xhtml:ol">
       <ol xmlns="http://www.w3.org/1999/xhtml">

         <!-- list-style-type en type zijn niet toegestaan => vertaal naar class -->
         <xsl:choose>
            <xsl:when test="@class">
               <xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
            </xsl:when>
            <xsl:when test="@list-style-type">
               <xsl:attribute name="class"><xsl:value-of select="@list-style-type"/></xsl:attribute>
            </xsl:when>
            <xsl:when test="@type">
               <xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
            </xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="@*" />
         <xsl:apply-templates />
       </ol>
   </xsl:template>

   <xsl:template match="xhtml:li">
       <li xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates select="@*" />
         <xsl:apply-templates />
       </li>
   </xsl:template>

   <xsl:template match="xhtml:table">
       <table xmlns="http://www.w3.org/1999/xhtml">
         <xsl:copy-of select="@*" />
         <xsl:apply-templates />
       </table>
   </xsl:template>
   
   <xsl:template match="xhtml:td">
       <td xmlns="http://www.w3.org/1999/xhtml">
         <xsl:copy-of select="@*" />
         <xsl:apply-templates />
       </td>
   </xsl:template>

   <xsl:template match="xhtml:tr">
       <tr xmlns="http://www.w3.org/1999/xhtml"><xsl:apply-templates /></tr>
   </xsl:template>

   <xsl:template match="xhtml:img">
      <img xmlns="http://www.w3.org/1999/xhtml">
         <xsl:copy-of select="@*" />
         <xsl:apply-templates select="@*"/>
      </img>
   </xsl:template>

   <xsl:template match="@value">
      <xsl:attribute name="value">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>

   <xsl:template match="@type">
      <xsl:attribute name="type">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>

   <xsl:template match="@list-style-type">
      <!-- ignore -->
   </xsl:template>

   <xsl:template match="@width">
      <xsl:attribute name="width">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>

   <xsl:template match="@height">
      <xsl:attribute name="height">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>

   <xsl:template match="@alt">
      <xsl:attribute name="alt">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>

   <xsl:template match="@src">
      <!-- XREF FIX 14 juli 2015 -->
      <xsl:attribute name="src">http://www.ruimtelijkeplannen.nl/documents/<xsl:value-of select="$planidn" />/<xsl:value-of select="."/></xsl:attribute>
   </xsl:template>   

   <xsl:template match="@class">
      <xsl:attribute name="class">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>   

   <xsl:template match="@id">
      <xsl:attribute name="id">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>   

   <!-- onderstaande geeft: Attribuut- en naamruimteknooppunten kunnen niet worden toegevoegd aan het bovenliggende element nadat al een tekst-, opmerkings-, pi- of subelementknooppunt is toegevoegd.
   <xsl:template match="@style">
      <xsl:attribute name="style">
        <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>   -->
   
   <!-- Eet alle overige attributen op -->
   <xsl:template match="@*">
   </xsl:template>

</xsl:stylesheet>
