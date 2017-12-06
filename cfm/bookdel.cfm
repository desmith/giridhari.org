<cfif isdefined("url.prepid")>
	<CFQUERY NAME="prepdelete" DATASOURCE="gather">
	DELETE FROM prep WHERE prep.prepid = #url.prepid#
	</CFQUERY>
	<cfoutput><cflocation url="menulist.cfm?progid=#url.progid#"></cfoutput>
</cfif>

<cfif isdefined("url.bookid")>
	<CFQUERY NAME="bookdelete" DATASOURCE="gather">
	DELETE FROM cookbook WHERE cookbook.bookID = #url.bookid#
	</CFQUERY>

	<cfoutput><cflocation url="recipes.cfm?progid=#url.progid#"></cfoutput>

</cfif>