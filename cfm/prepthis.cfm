<html>
<head>

<title>Menu</title>
</head>
<CFQUERY NAME="thisprep" DATASOURCE="gather">
SELECT      prep.prepname, type.category, cookbook.Title, program.PDate, prep.prepid, prep.prognum
FROM         cookbook, prep, program, type 
WHERE       type.ID = prep.type AND
                   cookbook.bookID = prep.source AND
                   program.progID = prep.prognum
ORDER BY  prep.prognum
</CFQUERY>
<body bgcolor="ffcc99" text="330099" link="330099" vlink="330099" alink="330099">

<cfoutput>

	<div align="center"> 
  <p><b><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3">Prasadam 
    Feast for <br>#dateformat(thisprep.PDate,"mmmm d,yyyy")#</font></b></div>
</cfoutput>
<table width="95%"
       border="0"
       cellspacing="3"
       cellpadding="1"
       align="center">
  <tr> 
    <td align="center" width="5%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Type</b></font></td>
    <td align="center" width="50%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Description</b></font></td>
    <td align="center" width="45%"><font face="Comic Sans MS, Arial, Helvetica, sans-serif" size="3"><b>Source</b></font></td>
  </tr>

<cfoutput query="thisprep"> 
 <tr> 
    <td align="left" width="5%">#thisprep.category#</td>
    <td align="left" width="50%">#thisprep.prepname#</td>
    <td align="left" width="45%">#thisprep.Title#</td>
  </tr>
</cfoutput> 
</table>
<p><p>


</body>
</html>
