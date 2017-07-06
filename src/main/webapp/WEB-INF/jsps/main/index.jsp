<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/resources/images/favicon.png" rel="shortcut icon" type="image/png" />
    <title>Email checker service</title>
</head>
<body>

<form method="post" action="/">
    <label>Email</label>
    <input type="text" name="email" value="${email}">
    <br />
    <button>Check</button>
</form>
<br />
<c:if test="${valid ne null}">
    <p>validation result: <b>${valid}</b></p>
</c:if>

<br />
<pre id="js_sample">
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
    <h2>Possible response</h2>
    <b>NO_SMTP</b> - have no found such SMTP server. means that server is down or email is TOTALLY invalid
    <b>NO_USER</b> - SMTP server is found, but there is no such user
    <b>INVALID_EMAIL_ADDRESS</b> - you passed an invalid email address
    <b>CAN_NOT_CHECK</b> - SMTP server is found, but can not check if user exists
    <b>VALID</b> - SMPT server is found and user on that server found as well
</pre>

<link rel="stylesheet" type="text/css" href="/resources/highlight/zenburn.css" />
<script src="/resources/highlight/highlight.pack.js"></script>
<script>
    hljs.highlightBlock(document.getElementById('js_sample'));
</script>
</body>
</html>
