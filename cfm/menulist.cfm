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
                   program.progID = #url.progid#
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

function delme(thisprep) {
	if (confirm("Are you sure you want to delete this prep?")) {
		document.location.href = "prepdel.cfm?prepid=" + thisprep + "&progid=" + #thisprog#;
		return true;
		} 
	else {
		document.location.href = "menulist.cfm?prepid=" + thisprep + "&progid=" + #thisprog#;
		return false;
		}
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
 <table width="75%" border="0" cellspacing="2" cellpadding="2" align="center">
    <tr align="center" valign="middle"> 
      <td><font face="Comic Sans MS" size="2"><cfoutput query="alldates">|&nbsp;<a href="menulist.cfm?progid=#alldates.progID#">#DateFormat(alldates.PDate,'m/d/yy')#</a>&nbsp;</cfoutput></font></td>
    </tr>
  </table>
<div align="center"> 
  <p><b><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3">Prasadam 
    Feast for <br>
    <cfoutput query="currdate"><cfif currdate.progID EQ url.progid>#dateformat(currdate.PDate,"mmmm d,yyyy")#</cfif></cfoutput></font></b></div>

<cfform action="prepitem.cfm?progid=#preps.progID#" method="POST">
<cfoutput><input type="Hidden" value="#preps.progID#"></cfoutput>
  <table width="95%" border="0" cellspacing="3" cellpadding="1" height="133" align="center">
    <tr> 
      <td align="center" width="5%"><font face="Arial, Helvetica, sans-serif" size="1">Del</font></td>
      <td align="center" width="15%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Type</b></font></td>
      <td align="center" width="40%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Description</b></font></td>
      <td align="center" width="35%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Source</b></font></td>
    </tr>
    <cfoutput query="preps">
	<tr valign="top">
		<td align="center" width="5%" height="31"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" color="red" size="2"><b><a href="javascript:delme(#preps.prepid#)">x</a></b></font></td><td align="center" width="15%" height="31"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"><b>#preps.category#</b></font></td><td align="left" width="40%" height="31"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"><b><a href="prepitem.cfm?prepid=#preps.prepid#&progid=#preps.progid#&aemode=edit">#preps.prepname#</a></b></font></td><td align="left" width="35%" height="31"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">#preps.Title#<cfif NOT preps.pageno IS 0>, pg.##&nbsp;#preps.pageno#</cfif></font></td></tr>
</cfoutput> 
    <tr> 
      <td colspan="4" width="5%"> 
        <div align="center"><font size="1" face="Comic Sans MS, Arial, Helvetica, sans-serif"><cfoutput><a href="prepitem.cfm?aemode=add&progid=#progid#">Add Prep</a></cfoutput></font></div>
      </td>
    </tr>
  </table>
</cfform>
</body>
</html>