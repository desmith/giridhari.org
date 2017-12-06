<html>
<head>
<title>Add Prep</title>

<cfif isDefined("form.Add")>
	<cfquery name="addprep" datasource="gather">
			INSERT INTO cookbook (Title) VALUES ('#form.newsource#');
	</cfquery>

	<cfoutput>
		<script language="JavaScript" type="text/javascript">
	    <!--
		var urlStr = "prepitem.cfm?progid=" + #form.progid#;
		opener.document.location.href = urlStr;
    	window.close();
	    //-->
    	</script>
	</cfoutput>
</cfif>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<!--
function chkfld() {
	if (document.addSource.newsource.value == "Name of Cookbook or Recipe Source") {
		alert("Please enter the new recipe source.");
		return false;
	} else {return true;}
}

//-->
</SCRIPT>

</head>
<body bgcolor="ffcc99" text="330099" link="330099" vlink="330099" alink="330099" onload="document.addSource.newsource.focus()">

<div align="center">
  <p><b><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3">New Recipe Source</font></b></div>

<cfform action="addsource.cfm" name="addSource" method="POST">
<cfoutput><input type="Hidden" name="progid" value="#url.progid#"></cfoutput>
  <p>&nbsp;</p>
  <table width="65%" border="0" cellspacing="4" cellpadding="3" align="center">
    <tr valign="top"> 
      <td align="left" valign="top"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text"
       name="newsource"
       value="Name of Cookbook or Recipe Source"
       size="65"
       maxlength="55"
       onChange="document.addSource.Add.focus()">
        </font></td>
    </tr>
    <tr> 
      <td align="center" width="40%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
        <input type="submit" name="Add" value="Add Source" onclick="return chkfld()">
        &nbsp; &nbsp; 
        <input type="reset" name="Cancel" value="Cancel" onclick="window.close();"></font></td>
    </tr>
  </table>
</cfform>


</body>
</html>