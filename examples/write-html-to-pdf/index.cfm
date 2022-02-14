
<cftry>
    <cfset pdfUtil = new components.WriteHTMLToPDF()>
    <cfset html = fileRead("/resources/example.html")>
    <cfset filePath = expandPath("/output/writehtmltopdf.pdf")>
    <cfset pdfUtil.writeHTMLToPDF(html = html, filePath = filePath)>

    <cfoutput>
        <h1>CFML OpenHTMLToPDF Examples</h1>
        <h3>File generated in: #filePath#</h3>
        <h4><a href="/">Go Back to Example List</a></h4>
    </cfoutput>
    <cfcatch>
        <cfdump var="#cfcatch#">
    </cfcatch>
</cftry>