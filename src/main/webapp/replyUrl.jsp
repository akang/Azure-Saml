<%@ page import = "java.util.Map" %>
<%@ page import="java.util.zip.Inflater" %>
<%@ page import="java.util.Base64" %>
<html>
<body>
<h2>Replied</h2>
<%
    Map<String, String[]> parameters = request.getParameterMap();
    String samlResponse = "";
    for(String parameter : parameters.keySet()) {
        String[] values = parameters.get(parameter);
        samlResponse = values[0];

        // out.print(values[0]);
    }

    byte[] base64Decoded = Base64.getDecoder().decode(samlResponse);

    out.print(new String(base64Decoded));



%>

</body>
</html>