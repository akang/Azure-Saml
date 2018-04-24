<%@ page import="java.util.Base64" %>
<%@ page import="java.util.zip.Deflater" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.zip.DeflaterOutputStream" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.TimeZone" %>
<html>
<body>
<h2>SAML Test</h2>

<%
    //entry point to the Service Provider application. This needs to be registered in Azure
    String startUrl = "https://www.beernblitz.com";

    //Azure SAML endpoint. You need to get this from Azure
    String azureSamlUrl = "https://login.microsoftonline.com/40b1872e-5bfe-43ff-ab73-47d4c808d794/saml2";

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    sdf.setTimeZone(TimeZone.getTimeZone("GMT"));

    StringBuilder samlRequest = new StringBuilder();
    samlRequest.append("<samlp:AuthnRequest ");
    samlRequest.append("xmlns=\"urn:oasis:names:tc:SAML:2.0:metadata\" ");
    samlRequest.append("ID=\"id" + java.util.UUID.randomUUID() + "\" ");
    samlRequest.append("Version=\"2.0\" IssueInstant=\"" + sdf.format(new java.util.Date()) + "\" ");
    samlRequest.append("xmlns:samlp=\"urn:oasis:names:tc:SAML:2.0:protocol\"> ");
    samlRequest.append("<Issuer xmlns=\"urn:oasis:names:tc:SAML:2.0:assertion\">" + startUrl + "</Issuer> ");
    samlRequest.append("</samlp:AuthnRequest>");

    ByteArrayOutputStream os = new ByteArrayOutputStream();
    Deflater deflater = new Deflater( Deflater.DEFAULT_COMPRESSION, true );
    DeflaterOutputStream deflaterOutputStream = new DeflaterOutputStream(os, deflater);
    deflaterOutputStream.write( samlRequest.toString().getBytes( "UTF-8" ) );
    deflaterOutputStream.close();
    os.close();
    String base64Request = Base64.getEncoder().encodeToString( os.toByteArray() );

%>

<form name="samlForm" method="get" action="<%=azureSamlUrl%>">
    <input type="hidden" name="SAMLRequest" value="<%=base64Request%>"/>
</form>

<script>
    document.samlForm.submit();
</script>
</body>
</html>