<html>
<head>
<title>Add Prep</title>
<cfquery name="books" datasource="gather">
SELECT * 
FROM cookbook
ORDER BY Title
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
	UPDATE cookbook SET Title = '#form.bookname#'
	WHERE cookbook.bookID = #form.bookid#
	</cfquery>
	<cfoutput><cflocation url="recipes.cfm?progid=#progid#"></cfoutput>
</cfif>

<cfif isdefined("url.bookid")>
	<cfquery name="editbook" datasource="gather">
		SELECT * FROM cookbook
		WHERE cookbook.bookID = #url.bookid#
	</cfquery>
</cfif>

	<cfif isDefined("form.savenew")>
		<cfquery name="addtype" datasource="gather">
			INSERT INTO cookbook (Title) VALUES ('#form.recipename#');
		</cfquery>
<cfoutput><cflocation url="recipes.cfm?progid=#progid#"></cfoutput>

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
	<cfoutput><cflocation url="menulist.cfm?progid=#progid#"></cfoutput>
</cfif>


<cfoutput>
<script language="JavaScript" type="text/javascript">
<!--
function savetype() {
	chkfld();
	document.addType.submit();
	return true;
}

function chkfld() {
	if (document.addType.recipename.value == "Enter new recipe source.") {
		alert("Please enter the name of the cookbook.");
		return false;
	} else {return true;}
}

var thisprog = #progid#
function delme(bookid) {
	if (confirm("Are you sure you want to delete this cookbook?")) {
		document.location.href = "bookdel.cfm?bookid=" + bookid + "&progid=" + thisprog;
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


<cfform action="recipes.cfm?progid=#progid#" name="addType" method="POST" onSubmit="return chkfld()"> 
<cfoutput><input type="Hidden" name="progid" value="#progid#"></cfoutput>
  <table width="45%" border="0" cellspacing="2" cellpadding="4" align="center">
	<cfif isdefined("url.bookid")>
	<cfoutput>
		<input type="Hidden" name="bookid" value="#url.bookid#">
	</cfoutput>
    <tr valign="top"> 
		<td align="left" valign="top">
			<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
				<cfoutput><input type="text" name="bookname" value="#editbook.Title#"></cfoutput>
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
					<input type="text" name="recipename" value="Enter new recipe source.">
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
		<cfoutput query="books">
	    <tr>
			<td width="75%"
    align="left"
    valign="top">
<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
			<a href="recipes.cfm?progid=#progid#&bookid=#books.bookID#">#books.Title#</a></font>
</td>
			<td align="left" width="25%"
    align="right"><a href="javascript:delme(#books.bookID#)"><font color="red" size="1">Del</font></a></td> 

			</tr>
 		</cfoutput>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>
	  <cfoutput>
	  	<font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"><a href="recipes.cfm?add=yes&progid=#progid#">Add New Category</a>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="menulist.cfm?progid=#progid#">Done</a></font>
		</cfoutput>
		</td>
    </tr>
	</cfif>
 </table>
</cfform>

</body>
</html>