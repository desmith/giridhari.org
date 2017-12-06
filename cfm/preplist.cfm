<html>
<head>
<title>Prep List</title>
</head>
<CFQUERY NAME="preplist" DATASOURCE="gather">
SELECT      prep.prepname, type.category, cookbook.Title, prep.prepid
FROM         cookbook, prep, type 
WHERE       type.ID = prep.type AND
                   cookbook.bookID = prep.source
</CFQUERY>
<body bgcolor="ffcc99" text="330099" link="330099" vlink="330099" alink="330099">

<div align="center"><b><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3">Prep List</font></b></div>
 <p>&nbsp;</p>


  <table width="95%" border="0" cellspacing="2" cellpadding="4" align="center">
	<cfoutput query="preplist">
		<input type="Hidden" name="prepid" value="#preplist.prepid#">

    <tr valign="top"> 
		<td align="left" valign="top">
			<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
				#preplist.category#
			</font>
		</td>
      <td>
	  	<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
		<a href="prepthis.cfm?prepid=#preplist.prepid#">#preplist.prepname#</a>
		</font>
	  </td>
	  <td align="left" valign="top">
	  	<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
			#preplist.Title#		
		</font>
	  </td>
	</tr>
			</cfoutput>
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
 </table>

</body>
</html>