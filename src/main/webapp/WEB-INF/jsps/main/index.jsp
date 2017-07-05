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
    valid: ${valid}
</c:if>

</body>
</html>
