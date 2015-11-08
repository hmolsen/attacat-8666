<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page session="false" %>
<%
	if (request.getParameter("newlog") != null) {
		String file = application.getRealPath("/") + "log.txt";

		FileWriter filewriter = new FileWriter(file, false);
		filewriter.write("");
		filewriter.close();
	}
	if (!request.getParameterMap().entrySet().isEmpty()) {
		String file = application.getRealPath("/") + "log.txt";

		FileWriter filewriter = new FileWriter(file, true);
		filewriter.write(new Date().toString());
		filewriter.write(": ");
		for (java.util.Map.Entry entry : request.getParameterMap().entrySet()) {
		  filewriter.write("<b>" + entry.getKey() + "</b> = " + java.util.Arrays.asList((String[])entry.getValue()) + ", "); 
		}
		filewriter.write("<br />");
		filewriter.close();
	}
	if (request.getReader().ready()) {
		String file = application.getRealPath("/") + "log.txt";

		FileWriter filewriter = new FileWriter(file, true);
		filewriter.write(new Date().toString());
		filewriter.write(" - CSP Violation:<br/>");
		BufferedReader reader = request.getReader();
		while (reader.ready()) {
			filewriter.write(reader.readLine() + "<br />");
		}
		filewriter.write("<br />");
		filewriter.close();
	}
%>
<html>
<body>
	<jsp:include page="log.txt" flush="true"/>
</body>
</html>