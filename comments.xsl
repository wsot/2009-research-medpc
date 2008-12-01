<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Server side transformation control -->
	<xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" standalone="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />

	<xsl:template match="/">
		<xsl:call-template name="addCSSLink">
			<xsl:with-param name="cssFilename"  select="'comments.css'" />
		</xsl:call-template>
		<h1>Program details for <xsl:value-of select="/program/title" /></h1>
		<xsl:call-template name="outputIO" />
		<xsl:call-template name="outputConstants" />
		<xsl:call-template name="outputVariables" />
		<xsl:call-template name="outputArrays" />
	</xsl:template>


	<xsl:template name="outputIO">
		<table summary="Details of input used in the program">
			<caption>Inputs</caption>
			<tr>
				<th>Name</th>
				<th>Summary</th>
				<th>Number</th>
			</tr>
		<xsl:for-each select="/program/input">
			<tr>
				<td class="name">^<xsl:value-of select="@name" /></td>
				<td><xsl:value-of select="@summary" /></td>
				<td><xsl:value-of select="position()" /></td>
			</tr>
		</xsl:for-each>
		</table>
		<table summary="Details of outputs used in the program">
			<caption>Outputs</caption>
			<tr>
				<th>Name</th>
				<th>Summary</th>
				<th>Number</th>
			</tr>
		<xsl:for-each select="/program/output">
			<tr>
				<td class="name">^<xsl:value-of select="@name" /></td>
				<td><xsl:value-of select="@summary" /></td>
				<td><xsl:value-of select="position()" /></td>
			</tr>
		</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template name="outputConstants">
		<table summary="Details of all constants used in the program">
			<caption>Constants</caption>
			<tr>
				<th>Name</th>
				<th>Summary</th>
				<th>Value</th>
			</tr>
		<xsl:for-each select="/program/constant">
			<tr>
				<td class="name">^<xsl:value-of select="@name" /></td>
				<td><xsl:value-of select="@summary" /></td>
				<td><xsl:value-of select="@value" /></td>
			</tr>
		</xsl:for-each>
		</table>
	</xsl:template>

	<!--Output variable lists. Aliased then unaliased-->	
	<xsl:template name="outputVariables">

		<!--output variables with aliases-->
		<xsl:if test="/program/variable[@alias != '']">
			<table summary="Details of all aliased variables used in the program">
				<caption>Aliased variables</caption>
				<tr>
					<th>Alias</th>
					<th>Name</th>
					<th>Summary</th>
					<th>Value</th>
				</tr>
			<xsl:for-each select="/program/variable[@alias != '']">
				<tr>
					<td class="alias"><xsl:value-of select="@alias" /></td>
					<td class="name"><xsl:value-of select="@name" /></td>
					<td><xsl:value-of select="@summary" /></td>
					<td><xsl:value-of select="@value" /></td>
				</tr>
			</xsl:for-each>
			</table>
		</xsl:if>

		<!--output variables without aliases-->
		<xsl:if test="/program/variable[not(@alias != '')]">
			<table summary="Details of all unaliased variables used in the program">
				<caption>Unaliased variables</caption>
				<tr>
					<th>Name</th>
					<th>Summary</th>
					<th>Value</th>
				</tr>
			<xsl:for-each select="/program/variable[not(@alias != '')]">
				<tr>
					<td class="name"><xsl:value-of select="@name" /></td>
					<td><xsl:value-of select="@summary" /></td>
					<td><xsl:value-of select="@value" /></td>
				</tr>
			</xsl:for-each>
			</table>
		</xsl:if>

	</xsl:template>


	<xsl:template name="outputArrays">
		<xsl:if test="/program/array">
			<table summary="List of arrays used in the program">
				<caption>Arrays</caption>
				<tr>
					<th>Name</th>
				</tr>
			<xsl:for-each select="/program/array">
				<tr>
					<td class="name"><a><xsl:attribute name="href">#<xsl:value-of select="@name" /></xsl:attribute><xsl:value-of select="@name" /></a></td>
				</tr>
			</xsl:for-each>
			</table>

			<xsl:for-each select="/program/array">
				<table summary="Array columns">
					<caption><a><xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>Columns for array <xsl:value-of select="@name" /></a></caption>
					<tr>
						<th>Number</th>
						<th>Name</th>
						<th>Summary</th>
					</tr>
				<xsl:for-each select="column">
					<tr>
						<td><xsl:value-of select="position() - 1" /></td>
						<td class="name"><xsl:value-of select="@name" /></td>
						<td><xsl:value-of select="@summary" /></td>
					</tr>
				</xsl:for-each>
				</table>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template name="addCSSLink">
		<xsl:param name="cssFilename"/>
		<link xmlns="http://www.w3.org/1999/xhtml" rel="stylesheet" type="text/css" href="{$cssFilename}"/>
	</xsl:template>


</xsl:stylesheet>
