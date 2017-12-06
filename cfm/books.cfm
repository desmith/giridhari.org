<cfquery name="cookbooks" datasource="gather">
	SELECT      *
	FROM        cookbook
	ORDER BY	Title
</cfquery>
<!--- Build list of Cookbooks --->
<!--- set up a temporary variable --->
<CFSET ckbkList = "">
<cfset thisone = "selected">
<!--- populate the list by looping through the query --->
<cfoutput QUERY="cookbooks">
<CFSET ckbkList = ckbkList & "<option ">
<cfif #attributes.bookid# IS bookID><CFSET ckbkList = ckbkList & #thisone#></cfif>
<CFSET ckbkList = ckbkList & " value='#cookbooks.bookID#'>#cookbooks.Title#</option>,">
</cfoutput>
<!--- loop through the resulting list --->
<cfoutput><select name="#attributes.bookfld#">
<CFLOOP INDEX="ListElement" LIST="#ckbkList#" DELIMITERS=",">#ListElement#<BR></CFLOOP>
</select>
</cfoutput>
