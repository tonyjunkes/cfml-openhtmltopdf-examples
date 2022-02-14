component displayname="Write HTML to PDF Example"
    output=false
{
    // Instantiate reusable Java classes
    variables.Jsoup = createObject("java", "org.jsoup.Jsoup");
    variables.W3CDom = createObject("java", "org.jsoup.helper.W3CDom");
    variables.PdfRendererBuilder = createObject("java", "com.openhtmltopdf.pdfboxout.PdfRendererBuilder");
    variables.FileOutputStream = createObject("java", "java.io.FileOutputStream");

    /**
     * @hint Constructor
     * @loggingEnabled.hint Enable logging for the OpenHTMLToPDF library
     */
    public WriteHTMLToPDF function init(boolean loggingEnabled = false) {
        // Turn on/off for parser debugging logs written to stdout
        var XRLog = createObject("java", "com.openhtmltopdf.util.XRLog");
        XRLog.setLoggingEnabled(arguments.loggingEnabled);

        return this;
    }

    /**
     * @hint Creates and writes a PDF from HTML via Java FileOutputStream.
     * @html.hint The HTML string to be converted.
     */
    public void function writeHTMLToPDF(
        required string html,
        required string filePath
    ) {
        try{
            // Clear file if it exists (otherwise we get an exception)
            fileDelete(arguments.filepath);

            // Resolve file generation path
            var fileLocation = arguments.filePath.listToArray("\/").slice(1, -1).toList("/");
            if (!directoryExists(fileLocation)) directoryCreate(fileLocation);

            // Set the URI path for external resources in the HTML
            var URI = getPageContext().getRequest().getScheme() & "://" & cgi.server_name;

            // Convert HTML5 document string to a W3CDocument object for parsing to PDF
            var jsoupDoc = variables.Jsoup.parse(arguments.html);
            var w3cDoc = variables.W3CDom.init().fromJsoup(jsoupDoc);

            // Stream W3CDocument to PDF format
            var pdfFileOutputStream = variables.FileOutputStream.init(arguments.filePath);
            var pdfBuilder = variables.PdfRendererBuilder
                .useFastMode()
                .withW3cDocument(w3cDoc, URI)
                .toStream(pdfFileOutputStream)
                .run();
        }
        catch(any e) {
            writeLog(e);
        }
        finally {
            // Ensure on succes OR error, all streams are closed!
            pdfFileOutputStream?.close();
        }
    }
}