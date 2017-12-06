<html>
<head>
<title>Menu</title>
<cfquery name="alldates" datasource="gather">
SELECT      PDate, progID
FROM         program
ORDER BY PDate ASC
</cfquery>
<cfquery name="currdate" datasource="gather">
SELECT      PDate, progID
FROM        program
WHERE		program.progID = #url.progid#
</cfquery>
<cfquery name="preps" datasource="gather">
SELECT      prep.*, type.*, cookbook.*, program.PDate, program.progID
FROM         cookbook, prep, program, type 
WHERE       program.progID = prep.prognum AND
                   cookbook.bookID = prep.source AND
                   type.ID = prep.type AND
                   prep.prepid = #url.prepid#
ORDER BY prep.type
</cfquery>
<cfset thisdate=#currdate.PDate#>
<cfset thisprog=#url.progid#>
<cfoutput>
	<script language="JavaScript" type="text/javascript">
	<!--
		var thisdate, progid
		progid	= #thisprog#;
		function loadside() {
			parent.sidebar.location.href="sidebar.cfm?progid=" + progid;
		}
		
		function noside() {
			parent.sidebar.location.href="sidebar.cfm";
		}
	//-->
	</script>
</cfoutput>
<cfquery name="cookbooks" datasource="gather">
SELECT      *
FROM        cookbook
ORDER BY	Title
</cfquery>
<cfquery name="category" datasource="gather">
SELECT	*
FROM	type
ORDER BY ID
</cfquery>

</head>


<body bgcolor="ffcc99" text="330099" link="330099" vlink="330099" alink="330099" onLoad="loadside()" onUnload="noside()">
<cfoutput>This date = #DateFormat(currdate.pdate,"m/d/yy")#</cfoutput>
<br>
 <table width="75%" border="0" cellspacing="2" cellpadding="2" align="center">
    <tr align="center" valign="middle"> 
      <td><font face="Comic Sans MS" size="2"><cfoutput query="alldates"><a href="menulist.cfm?progid=#alldates.progID#">#DateFormat(alldates.PDate,'m/d/yy')#</a> &nbsp;|&nbsp;</cfoutput></font></td>
    </tr>
  </table>
<div align="center"> 
  <p><b><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3">Prasadam 
    Feast for <br>
    <cfoutput query="currdate"><cfif currdate.progID EQ url.progid>#dateformat(currdate.PDate,"mmmm d,yyyy")#</cfif></cfoutput></font></b></div>

<cfform action="menusubmit.cfm?progid=#preps.progID#" method="POST">
<cfoutput><input type="Hidden" value="#preps.progID#"></cfoutput>
  <table width="85%" border="0" cellspacing="3" cellpadding="2" align="center">
    <tr>
		<td align="center" width="20%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Type</b></font></td>
		<td align="center" width="60%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Description</b></font></td>
		<td align="center" width="20%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Source</b></font></td>
	</tr>
<cfoutput query="preps">
<cfset prepselect = #preps.category#&#preps.prepid#>
<cfset bookselect = #preps.source#&#preps.prepid#>
	<tr valign="top">
		<td align="center"></td>
		<td align="left"><input type="text" name="#preps.prepid#" value="#preps.prepname#" size="55" maxlength="108"></td>
		<td align="right"><cf_books bookid=#preps.bookID# bookfld=#bookselect#> Page##&nbsp;<input type="Text" name="#preps.pageno#" value="#preps.pageno#" align="LEFT" size="6" maxlength="25"></td>
	</tr>
</cfoutput>
    <tr> 
      <td align="right" width="20%">&nbsp; </td>
      <td width="60%">&nbsp;</td>
      <td width="20%">&nbsp;</td>
    </tr>
    <tr>
		<td colspan="3" align="center" width="20%"><input type="submit" name="MakeChange" value="Submit Changes"> &nbsp; &nbsp; <input type="reset" name="ClearForm" value="Clear Form" onClick="return allclear()"></td></tr>
  </table>
</cfform>
</body>
</html>