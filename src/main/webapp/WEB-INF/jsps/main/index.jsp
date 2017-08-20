<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/resources/images/favicon.png" rel="shortcut icon" type="image/png" />
    <title>Email checker service</title>
    <link href="/resources/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2 style="margin-bottom: 10px;">Type email to validate it</h2>
    <Br />
    <form method="post" action="/">
        <input type="text" name="email" value="${email}" placeholder="email">
        <button>Check</button>
    </form>
    <br />
    <c:if test="${valid_text ne null}">
        <p class="result">Validation result: <b class="${valid_result}">${valid_text}</b></p>
    </c:if>
</div>

<pre>
    <h2>JS request example(jQuery)</h2>
    <code class="js">
        var emails = []; //you list of emails
        $.ajax({
            url: 'https://email-checker-service.herokuapp.com/api/email_check/list',
            type: 'POST',
            data: JSON.stringify({emails: emails}),
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.setRequestHeader('Accept', 'application/json');
            },
            success: function(result) {
                // array of objects - {email, exists}
            }
        });
    </code>
    <h2>Java request sample</h2>
    <code class="java">
        import org.apache.http.HttpEntity;
        import org.apache.http.HttpResponse;
        import org.apache.http.client.HttpClient;
        import org.apache.http.client.methods.HttpPost;
        import org.apache.http.client.utils.URIBuilder;
        import org.apache.http.entity.StringEntity;
        import org.apache.http.impl.client.HttpClients;
        import org.apache.http.util.EntityUtils;
        import org.json.JSONObject;

        import java.net.URI;
        import java.util.Arrays;
        import java.util.HashMap;
        import java.util.Map;

        ..

        HttpClient httpclient = HttpClients.createDefault();

        try {
            URIBuilder builder = new URIBuilder("http://email-checker-service.herokuapp.com/api/email_check/list");
            URI uri = builder.build();
            HttpPost request = new HttpPost(uri);
            request.setHeader("Content-Type", "application/json");

            Map&#60;String, Object> requestBodyMap = new HashMap&#60;String, Object>() {{
                put("emails", Arrays.asList());         // list of emails
            }};
            String requestBodyJson = new JSONObject(requestBodyMap).toString();

            StringEntity reqEntity = new StringEntity(requestBodyJson);
            request.setEntity(reqEntity);

            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                String s = EntityUtils.toString(entity);
                System.out.println(s);

                // convert in to List&#60;Map&#60;String, Object>>
                // or convert lo List&#60;MyEmailResponseObject> where MyEmailResponseObject contains the following fields: email[String] exists[String]
            }
        } catch (Exception e) {..}
    </code>
    <code class="xml">
        &#60;!-- using maven dependencies -->
        &#60;dependencies>
            &#60;dependency>
                &#60;groupId>org.apache.httpcomponents&#60;/groupId>
                &#60;artifactId>httpclient&#60;/artifactId>
                &#60;version>4.4.1&#60;/version>
            &#60;/dependency>
            &#60;dependency>
                &#60;groupId>org.json&#60;/groupId>
                &#60;artifactId>json&#60;/artifactId>
                &#60;version>20170516&#60;/version>
            &#60;/dependency>
        &#60;/dependencies>
    </code>
    <h2>Possible response</h2>
    <code>
        <b>NO_SMTP</b> - have no found such SMTP server. means that server is down or email is TOTALLY invalid
        <b>NO_USER</b> - SMTP server is found, but there is no such user
        <b>INVALID_EMAIL_ADDRESS</b> - you passed an invalid email address
        <b>CAN_NOT_CHECK</b> - SMTP server is found, but can not check if user exists
        <b>VALID</b> - SMPT server is found and user on that server found as well
    </code>
</pre>

<div class="center">
    Thanks to <a href="https://github.com/isagalaev" target="_blank">Ivan Sagalaev</a>&nbsp;
    for great code highlighter <a href="https://github.com/isagalaev/highlight.js" target="_blank">highlight.js</a>
</div>
<div class="right">
    © made by borsch
    <Br />
    <a href="mailto:oleh.kurpiak@gmail.com">Oleh Kurpiak</a>
</div>

<link rel="stylesheet" type="text/css" href="/resources/highlight/zenburn.css" />
<script src="/resources/highlight/highlight.pack.js"></script>
<script>
    hljs.highlightBlock(document.getElementsByTagName('pre')[0]);
</script>
</body>
</html>
