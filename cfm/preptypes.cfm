<html>
<head>
<title>Add Prep</title>
<cfquery name="types" datasource="gather">
SELECT * 
FROM type
ORDER BY ID
</cfquery>

<cfoutput>
	<cfif isdefined("url.progid")>
		<cfset progid = #url.progid#>
	<cfelseif isdefined("form.progid")>
		<cfset progid = #form.progid#>
	</cfif>
</cfoutput>


<cfif isdefined("form.editsave")>
	<cfquery name="save" datasource="gather">
	UPDATE type SET category = '#form.preptype#'
	WHERE type.ID = #form.typeid#
	</cfquery>
	<cfoutput><cflocation url="prepitem.cfm?progid=#progid#"></cfoutput>
</cfif>

<cfif isdefined("url.typeid")>
	<cfquery name="editType" datasource="gather">
		SELECT * FROM type
		WHERE type.ID = #url.typeid#
	</cfquery>
</cfif>

	<cfif isDefined("form.savenew")>
		<cfquery name="addtype" datasource="gather">
			INSERT INTO type (category) VALUES ('#form.preptype#');
		</cfquery>
<cfoutput><cflocation url="prepitem.cfm?progid=#progid#"></cfoutput>

<!---
	<cfoutput>
		<script language="JavaScript" type="text/javascript">
	    <!--
		var urlStr = "prepitem.cfm?progid=" + #form.progid#;
		opener.document.location.href = urlStr;
    	window.close();
	    //-->
    	</script>
	</cfoutput>
--->
<cfelseif isDefined("form.cancel")>
	<cfoutput><cflocation url="prepitem.cfm?progid=#progid#"></cfoutput>
</cfif>


<cfoutput>
<script language="JavaScript" type="text/javascript">
<!--

function chkfld() {
	if (document.addType.preptype.value == "Enter new category type.") {
		alert("Please enter a name for the new category.");
		return false;
	} else {return true;}
}

var thisprog = #progid#
function delme(typeid) {
	if (confirm("Are you sure you want to delete this category?")) {
		document.location.href = "prepdel.cfm?typeid=" + typeid + "&progid=" + thisprog;
		return true;
		} 
	else {
//		document.location.href = "menulist.cfm?progid=" + thisprog;
//		return false;
		}
}

//-->
</script>
</cfoutput>
</head>
<body bgcolor="ffcc99" text="330099" link="330099" vlink="330099" alink="330099">

<div align="center"><b><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3">Listing of Prep Types</font></b></div>
 <p>&nbsp;</p>


<cfform action="preptypes.cfm" name="addType" method="POST" onSubmit="return chkfld()"> 
<cfoutput><input type="Hidden" name="progid" value="#progid#"></cfoutput>
  <table width="45%" border="0" cellspacing="2" cellpadding="4" align="center">
	<cfif isdefined("url.typeid")>
	<cfoutput>
		<input type="Hidden" name="typeid" value="#url.typeid#">
	</cfoutput>
    <tr valign="top"> 
		<td align="left" valign="top">
			<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
				<cfoutput><input type="text" name="preptype" value="#editType.category#"></cfoutput>
			</font>
		</td>
	</tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>
	  	<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
	  		<input type="Submit" name="editsave" value="Save">
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
			<input type="Reset" name="cancel" value="Cancel" onClick="history.back()">
		</font>
	  </td>
    </tr>
	<cfelseif isdefined("url.add")>
			<cfoutput>
			    <tr valign="top"> 
				<td align="left" valign="top">
				<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
					<input type="text" name="preptype" value="Enter new category type.">
				</font>
				</td>
				</tr>
			</cfoutput>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"><input type="Submit" name="savenew" value="Save">
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="Reset" name="cancel" value="Cancel" onClick="history.back()"></td>
    </tr>
		<cfelse>
		<cfoutput query="types">
	    <tr>
			<td width="75%"
    align="left"
    valign="top">
<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
			<a href="preptypes.cfm?progid=#progid#&typeid=#types.ID#">#types.category#</a></font>
</td>
			<td align="left" width="25%"
    align="right"><a href="javascript:delme(#types.ID#)"><font color="red" size="1">Del</font></a></td> 

			</tr>
 		</cfoutput>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>
	  <cfoutput>
	  	<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"><a href="preptypes.cfm?add=yes&progid=#progid#">Add New Category</a>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="menulist.cfm?progid=#progid#">Done</a></font>
		</cfoutput>
		</td>
    </tr>
	</cfif>
 </table>
</cfform>

</body>
</html>