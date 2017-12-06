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
    <tr valign="top"> 
      <td align="right" nowrap><b><select name="entre1Cat">
		  	<cfif category.category IS preps.category>
				<cfoutput><option value="#preps.type#">#preps.category#</cfoutput>
			<cfelse>
				<option>Select Type of Prep</option>
					<cfoutput query="category">
						<option value="#category.ID#">#category.category#
					</cfoutput>
			</cfif>
	  </select></b></td>
      <td align="left">
        <input type="text" name="entre1" <cfif preps.category contains "entre1"><cfoutput>value="#preps.prepname#"</cfoutput></cfif> size="65" maxlength="108">
      </td>
      <td align="right"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"><select name="entre1Source">
<option>Source of Recipe</option>
		<cfoutput query="cookbooks">
			<option value="#cookbooks.bookID#">#cookbooks.Title#
		</cfoutput>
	  </select>
	  	Page#&nbsp;<cfoutput><input type="Text"
       name="entre1PageNum"
       <cfif preps.category is "entre1">value="#preps.pageno#"</cfif>
       align="LEFT"
       size="6"
       maxlength="25"></cfoutput></font></td>
    </tr>
    <tr valign="top"> 
      <td align="right" nowrap><b>
	  <select name="entre2Cat">
	  	<option>Select Type of Prep</option>
			<cfoutput query="category">
				<option value="#category.ID#" <cfif preps.category IS "entre2"> selected</cfif>>#category.category#</option>
			</cfoutput>
	  </select></b></td>
      <td align="left"><cfoutput><input type="Text"
       name="entre2"
       <cfif preps.category is "entre2">value="#preps.prepname#"</cfif>
       align="LEFT"
       size="65"
       maxlength="108"></cfoutput></td>
      <td align="right"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"><select name="entre2Source">
<option>Source of Recipe</option>
		<cfoutput query="cookbooks">
			<option value="#cookbooks.bookID#">#cookbooks.Title#
		</cfoutput>
	  </select>
	   Page#&nbsp;<cfoutput><input type="Text"
       name="entre2PageNum"
       <cfif preps.category is "entre2">value="#preps.pageno#"</cfif>
       align="LEFT"
       size="6"
       maxlength="25"></cfoutput></font></td>
    </tr>
    <tr valign="top"> 
      <td align="right" nowrap><b>
	  <select name="savoryCat">
	  	<option>Select Type of Prep</option>
			<cfoutput query="category">
				<option value="#category.ID#">#category.category#
			</cfoutput>
	  </select></b></td>
      <td align="left">
        <input type="Text"
       name="savory"
       <cfif preps.category is "savory"><cfoutput>value="#preps.prepname#"</cfoutput></cfif>
       align="LEFT"
       size="65"
       maxlength="108">
      </td>
      <td align="right"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
        <select name="savorySource">
<option>Source of Recipe</option>
		<cfoutput query="cookbooks">
			<option value="#cookbooks.bookID#">#cookbooks.Title#
		</cfoutput>
	  </select>
	   Page#&nbsp;<cfinput type="Text"
       name="savoryPageNum"
       value="#preps.pageno#"
       message="Please enter a valid number for the Savory recipe"
       validate="integer"
       required="No"
       size="6"
       maxlength="25"></font></td>
    </tr>
    <tr valign="top"> 
      <td align="right" nowrap><b>
	  <select name="saladCat">
	  	<option>Select Type of Prep</option>
			<cfoutput query="category">
				<option value="#category.ID#">#category.category#
			</cfoutput>
	  </select></b></td>
      <td align="left">
        <input type="Text"
	   name="salad" <cfif preps.category is "salad"><cfoutput>value="#preps.prepname#"</cfoutput></cfif>
       align="LEFT"
       size="65"
       maxlength="108">
      </td>
      <td align="right"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"> 
        <select name="saladSource">
<option>Source of Recipe</option>
		<cfoutput query="cookbooks">
			<option value="#cookbooks.bookID#">#cookbooks.Title#
		</cfoutput>
	  </select>
	   Page#&nbsp;<cfinput type="Text"
       name="saladPageNum"
       value="#preps.pageno#"
       align="LEFT"
       required="No"
       size="6"
       maxlength="25"></font></td>
    </tr>
    <tr valign="top"> 
      <td align="right" nowrap><b>
	  <select name="drinkCat">
	  	<option>Select Type of Prep</option>
			<cfoutput query="category">
				<option value="#category.ID#">#category.category#
			</cfoutput>
	  </select></b></td>
      <td align="left">
			<input type="Text" name="drink" align="LEFT" size="65" 
				<cfif preps.category is "drink">
					<cfoutput>value="#preps.prepname#"</cfoutput>
				</cfif> maxlength="108">
      </td>
      <td align="right"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2">
	  <select name="drinkSource">
		<option>Source of Recipe</option>
		<cfoutput query="cookbooks">
			<option value="#cookbooks.bookID#">#cookbooks.Title#
		</cfoutput>
	  </select>
	  	Page#&nbsp;<input type="Text"
       name="drinkPageNum"
       <cfif preps.category IS "drink"><cfoutput>value="#preps.pageno#"</cfoutput></cfif>
       align="LEFT"
       required="No"
       size="6"
       maxlength="25"></font></td>
    </tr>
    <tr valign="top"> 
      <td align="right" nowrap><b>
	  <select name="sweetCat">
	  	<option>Select Type of Prep</option>
			<cfoutput query="category">
				<option value="#category.ID#">#category.category#
			</cfoutput>
	  </select></b></td>
      <td align="left">
        <input type="Text"
       name="sweet" <cfif preps.category is "sweet"><cfoutput>value="#preps.prepname#"</cfoutput></cfif>
       align="LEFT"
       size="65"
       maxlength="108">
      </td>
      <td align="right"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="2"><select name="sweetSource">
<option>Source of Recipe</option>
		<cfoutput query="cookbooks">
			<option value="#cookbooks.bookID#">#cookbooks.Title#
		</cfoutput>
	  </select>
	   Page#&nbsp;<input type="Text"
       name="sweetPageNum"
       <cfif preps.category is "sweet"><cfoutput>value="#preps.pageno#"</cfoutput></cfif>
       align="LEFT"
       size="6"
       maxlength="25"></font></td>
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

