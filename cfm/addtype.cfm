<html>
<head>
<title>Add Prep</title>

<cfif isDefined("form.Add")>
	<cfquery name="addtype" datasource="gather">
		INSERT INTO type (category) VALUES ('#form.newtype#');
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
	if (document.addType.newtype.value == "Type of Prep") {
		alert("Please enter a name for the new category.");
		return false;
	} else {return true;}
}

//-->
</SCRIPT>
</head>
<body bgcolor="ffcc99" text="330099" link="330099" vlink="330099" alink="330099" onload="document.addType.newtype.focus()">

<div align="center">
  <p><b><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3">New 
    Type of Prep</font></b>
</div>

<cfform action="addtype.cfm" name="addType" method="POST">
<cfoutput><input type="Hidden" name="progid" value="#url.progid#"></cfoutput>

  <p>&nbsp;</p>
  <table width="65%" border="0" cellspacing="4" cellpadding="3" align="center">
    <tr valign="top"> 
      <td align="left" valign="top"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
        <input type="text"
       name="newtype"
       value="Type of Prep"
       size="65"
       maxlength="55"
       onChange="document.addType.Add.focus()">
        </font></td>
    </tr>
    <tr> 
      <td align="center" width="40%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
        <input type="submit" name="Add" value="Add" onclick="return chkfld()">
        &nbsp; &nbsp; 
        <input type="reset" name="Cancel" value="Cancel" onclick="window.close();"></font></td>
    </tr>
  </table>
</cfform>


</body>
</html>