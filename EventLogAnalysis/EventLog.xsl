<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:ev='http://schemas.microsoft.com/win/2004/08/events/event' >
  <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
	<xsl:output method="html"/>
	<xsl:template match="/Events">
		<html>
		<head>
			<title>TestXLST</title>
		</head>
		<body>
			<table border="1">
				<tr>
					<th>GMTDateTime</th>
					<!-- <th>Date</th> -->
					<!-- <th>Time</th> -->
					<th>Computer</th>
					<th>Level</th>
					<th>Channel</th>
					<th>Provider</th>
					<th>EventID</th>
					<th>EventData</th>
					<th>UserData</th>
				</tr>
				<xsl:for-each select="ev:Event" >
					<xsl:sort select="ev:System/ev:TimeCreated/@SystemTime"/>
					<!-- <xsl:if test="substring(ev:System/ev:TimeCreated/@SystemTime,0,5) &gt; 2013"> -->
					<!-- <xsl:if test="ev:System/ev:Level=1 or ev:System/ev:Level=2 or ev:System/ev:Level=3"> -->
					<!-- <xsl:if test="ev:System/ev:Level=0 or ev:System/ev:Level=4"> -->
					<tr>
						<td><xsl:value-of select="concat(substring(ev:System/ev:TimeCreated/@SystemTime,0,11),' ',substring(ev:System/ev:TimeCreated/@SystemTime,12,18))"/></td>
						<!-- <td><xsl:value-of select="ev:System/ev:TimeCreated/@SystemTime"/></td>  -->
						<!-- <td><xsl:value-of select="ev:System/ev:TimeCreated/@SystemTime"/></td> -->
						<!-- <td><xsl:value-of select="substring(ev:System/ev:TimeCreated/@SystemTime,0,11)"/></td> -->
						<!-- <td><xsl:value-of select="substring(ev:System/ev:TimeCreated/@SystemTime,12,18)"/></td> -->
						<td><xsl:value-of select="translate(substring-before(ev:System/ev:Computer,'.dragnetsolutions.com'), $uppercase, $smallcase)"/></td>
						<td><xsl:value-of select="ev:System/ev:Level"/></td>
						<td><xsl:value-of select="ev:System/ev:Channel"/></td>
						<td><xsl:value-of select="ev:System/ev:Provider/@Name"/></td>
						<td><xsl:value-of select="ev:System/ev:EventID"/></td>
						<td><EventData><xsl:copy-of select="ev:EventData/node()"/></EventData></td>
						<td><UserData><xsl:copy-of select="ev:UserData/node()"/></UserData></td>
					</tr>
					<!-- </xsl:if> -->
					<!-- </xsl:if> -->
				</xsl:for-each>
			</table>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>