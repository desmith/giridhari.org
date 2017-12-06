<html>
<head>
<title>Menu</title>

<CFQUERY NAME="alldates" DATASOURCE="gather">
SELECT      PDate, progID
FROM         program
</CFQUERY>

<CFQUERY NAME="currdate" DATASOURCE="gather">
SELECT      PDate, progID
FROM        program
WHERE		(program.progID = #url.progid#)
</CFQUERY>

<CFQUERY NAME="preps" DATASOURCE="gather">
SELECT      prep.*, type.*, cookbook.*, program.PDate, program.progID
FROM         cookbook, prep, program, type 
WHERE       program.progID = prep.prognum AND
                   cookbook.bookID = prep.source AND
                   type.ID = prep.type AND
                   (program.progID = #url.progid#)
</CFQUERY>

<cfset thisdate=#currdate.PDate#>



<cfquery name="cookbooks" datasource="gather">
SELECT      *
FROM         cookbook
</cfquery>
<cfquery name="category" datasource="gather">
SELECT      *
FROM         type
</cfquery>

</head>

<body bgcolor="ffcc99" text="330099" link="330099" vlink="330099" alink="330099">
 <cfoutput>This date = #DateFormat(currdate.pdate,"m/d/yy")#</cfoutput><br>
 <table width="75%" border="0" cellspacing="2" cellpadding="2" align="center">
    <tr align="center" valign="middle"> 
      <td><font face="Comic Sans MS" size="2">
	<cfoutput query="alldates">
		<a href="menu.cfm?progid=#alldates.progID#">#DateFormat(alldates.PDate,'m/d/yy')#</a> &nbsp;|&nbsp;
	</cfoutput>
</font></td>
    </tr>
  </table>
<div align="center"> 
  <p><b><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3">Prasadam 
    Feast for <br>
    <cfoutput query="currdate"><cfif currdate.progID EQ url.progid>#dateformat(currdate.PDate,"mmmm d,yyyy")#</cfif></cfoutput></font></b></p>
</div>

<cfform action="menusubmit.cfm?progid=#preps.progID#?pdate=#thisdate#"
        method="POST"
        enablecab="Yes">
  <table width="85%" border="0" cellspacing="3" cellpadding="2" align="center">
    <tr> 
      <td align="right" nowrap>&nbsp;</td>
      <td nowrap align="center"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Description:</b></font></td>
      <td nowrap align="center"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Source</b></font></td>
    </tr>
<cfoutput query="preps">
    <tr valign="bottom"> 
      <td align="right" nowrap><b><select name="#preps.category#"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
		<option>Source of Recipe</option>
		<option value="#preps.type#" <cfif preps.type IS category.ID> selected></cfif>#preps.category#</option>
	  </select></b></td>
      <td align="left">
        <input type="text" name="#preps.prepid#" value="#preps.prepname#" size="65" maxlength="108">
      </td>
      <td align="right"><select name="#preps.source#">
			<option>Source of Recipe</option>
			<option value="#preps.source#">#preps.Title#</option>
	  </select>
	  	Page No.&nbsp;<input type="Text"
       name="#preps.pageno#"
       value="#preps.pageno#"
       align="LEFT"
       size="6"
       maxlength="25"></font></td>
    </tr></cfoutput>
    </tr>
    <tr> 
      <td align="right" nowrap>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="3" align="center" width="0" nowrap> 
        <input type="submit" name="MakeChange" value="Submit Changes">
        &nbsp; &nbsp; 
        <input type="reset" name="ClearForm" value="Clear Form" onClick="return allclear()">
      </td>
    </tr>
  </table>
</cfform>
<p>
</body>
</html>

