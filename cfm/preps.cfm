<cfquery name="category" datasource="gather">
	SELECT	*
	FROM	type
	ORDER BY ID
</cfquery>
<!--- Build list of prep types --->
<!--- set up a temporary variable --->
<CFSET catList = "">
<!--- populate the list by looping through the query --->
<CFOUTPUT QUERY="category">
<CFSET catList = catList & "<option "><cfif attributes.preptype IS category.ID>
<CFSET catList = catList & "selected "></cfif>
<CFSET catList = catList & "value='#category.ID#'>#category.category#</option>,">
</CFOUTPUT>
<!--- loop through the resulting list --->
<cfoutput><select name="#attributes.prepfld#">
<CFLOOP INDEX="ListElement" LIST="#catList#" DELIMITERS=",">#ListElement#<BR></CFLOOP>
</select>
</CFOUTPUT>