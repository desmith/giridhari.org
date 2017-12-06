<html>
<head>
<title>Add Prep</title>

<cfif isdefined ("url.aemode")>
	<cfset aemode = #url.aemode#>
<cfelseif isdefined ("form.aemode")>
	<cfset aemode = #form.aemode#>
</cfif>

<cfif isdefined ("url.prepid")>
	<cfset prepid = #url.prepid#>
<cfelseif isdefined ("form.prepid")>
	<cfset prepid = #form.prepid#>
</cfif>

<cfquery name="preplist" datasource="gather">
SELECT * FROM prep
WHERE prep.prepid = #prepid#
ORDER BY prep.prepid
</cfquery>

<cfquery name="prepsource" datasource="gather">
SELECT * 
FROM cookbook
ORDER BY Title
</cfquery>

<cfquery name="preptype" datasource="gather">
SELECT * 
FROM type
ORDER BY ID
</cfquery>

<script language="JavaScript" type="text/javascript">
<!--
function chkform() {
	if (document.prepadd.preptype.value == "") {
		alert("Haribol! You forgot to enter the type of Prep!");
		return false;
		}
	if (document.prepadd.prepname.value == "Type name of prep here") {
		alert("Hari Hari!! This prep needs a name!");
		return false;
	}
	if (document.prepadd.prepsource.value == "") {
		alert("Hari Krsna!! You need to tell us where you got this delicious recipe!");
		return false;
	}
//	if (document.prepadd.pageno.value == "") {
//		alert("Did you forget to enter the page#? (Enter 0 for none)");
//		return false;
//	}
	else {return true;}
}

function ifnew(nam) {
	if (document.prepadd.prepsource.value == "new" || document.prepadd.preptype.value == "new") {
		window.open(nam,"",'width=525,height=300,resizable');
		return true;
	} else {return false;}
}

//-->
</script>
</head>
<body bgcolor="ffcc99" text="330099" link="330099" vlink="330099" alink="330099" onLoad="loadside()" onUnload="noside()">

<cfform action="prepedit.cfm?aemode=#aemode#" name="prepedit" method="POST" onSubmit="return chkform();">
<cfoutput><input type="hidden" name="prepid" value="#prepid#"></cfif></cfoutput>
  <p>&nbsp;</p><table width="65%" border="0" cellspacing="4" cellpadding="3" align="center">
    <tr> 
      <td align="left" width="60%" valign="top"> <font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
        <select name="preptype" size="1" onChange="ifnew('addtype.cfm?progid=<cfoutput>#url.progid#</cfoutput>')">
		  <cfif NOT isdefined("url.prepid")><option>Select Type of Prep</option></cfif>
          <cfoutput query="preptype">
          <option <cfif isdefined("url.prepid") AND preptype.ID IS #thisprep.type#> selected </cfif> value="#preptype.ID#">#preptype.category#</option></cfoutput> 
		  <option value="new">New Type!</option>
        </select>
        </font></td>
    </tr>
    <tr valign="top"> 
      <td align="left" valign="top"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
        <cfoutput>
			<cfif isdefined("url.prepid")>
				<input type="text" name="prepname" size="65" maxlength="108" value="#thisprep.prepname#">
			<cfelseif NOT isdefined("url.prepid")>
				<input type="text" name="prepname" size="65" maxlength="108" value="Type name of prep here">
			</cfif>
		</cfoutput>
        </font></td>
    </tr>
    <tr> 
      <td width="60%" align="left" valign="top" height="66"> <font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
<cfoutput><select name="prepsource" size="1" onChange="ifnew('addsource.cfm?progid=#url.progid#')"></cfoutput>
          <cfif NOT isdefined("url.prepid")><option>Source of Recipe</option></cfif>
		  <cfoutput query="prepsource">
          <option <cfif isdefined("url.prepid") AND prepsource.bookID IS #thisprep.source#> selected </cfif>value="#prepsource.bookID#">#prepsource.Title#</option></cfoutput>
		  <option value="new">New Recipe!</option>
        </select>
        &nbsp; &nbsp;Page# &nbsp; 
        <cfoutput><input type="Text" name="pageno" align="LEFT" size="6" maxlength="25" <cfif isdefined("url.prepid") AND NOT thisprep.pageno IS ""> value="#thisprep.pageno#"<cfelse> value="0"</cfif> ></cfoutput>
        </font></td>
    </tr>
    <tr> 
      <td align="center" width="40%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
<cfoutput>
<cfif url.add IS "edit">
	<input type="submit" name="MakeChange" value="Update Prep">
<cfelseif url.add IS "add">
	<input type="submit" name="AddNew" value="Add Prep">
</cfif>        &nbsp; &nbsp; 
<input type="reset" name="Ret2Menu" value="Return to Menu" onClick="document.location.href='menulist.cfm?progid=#currprog#'">
</cfoutput>
        </font></td>
    </tr>
  </table>
</cfform>


</body>
</html>