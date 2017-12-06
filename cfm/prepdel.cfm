<cfif isdefined("url.prepid")>
	<CFQUERY NAME="prepdelete" DATASOURCE="gather">
	DELETE FROM prep WHERE prep.prepid = #url.prepid#
	</CFQUERY>
	<cfoutput><cflocation url="menulist.cfm?progid=#url.progid#"></cfoutput>
</cfif>

<cfif isdefined("url.typeid")>
	<CFQUERY NAME="typedelete" DATASOURCE="gather">
	DELETE FROM type WHERE type.ID = #url.typeid#
	</CFQUERY>

	<cfoutput><cflocation url="preptypes.cfm?progid=#url.progid#"></cfoutput>

</cfif>