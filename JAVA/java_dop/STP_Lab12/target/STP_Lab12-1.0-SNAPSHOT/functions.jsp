<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Functions</title>
</head>
<body>
<h1>FUNCTIONS TAGS</h1>
<c:set var="string" value="My name is Nikita"/>


<c:out value="Input string: "/><c:out value="${string}"/>
<br/><br/>


<c:if test="${fn:contains(string, 'Nikita')}">
    String contains 'Nikita'
</c:if>
<br/>


<c:if test = "${fn:containsIgnoreCase(string, 'h')}">
    String contains 'h'
</c:if>
<br/>


<c:if test = "${fn:endsWith(string, 'a')}">
    String ends with 'a'
</c:if>
<br/><br/>


<c:set var = "string1" value = "My surname is Yashny"/>
<c:set var = "string2" value = "I am studing programming"/>
Index of 'is': ${fn:indexOf(string1, "is")}<br/>
Index of 'am': ${fn:indexOf(string2, "am")}<br/>

<c:set var = "string1" value = "My name is Nikita"/>
<c:set var = "string2" value = "${fn:split(string1, ' ')}" />
<c:set var = "string3" value = "${fn:join(string2, '-')}" />
${string3}<br/><br/>

<c:set var = "string1" value = "My name is Nikita"/>
Length of this string: ${fn:length(string1)}<br/><br/>

<c:set var = "string1" value = "My name is Nikita"/>
<c:set var = "string2" value = "${fn:replace(string1, 'Nikita', 'nikita')}" />
${string2}<br>
</body>
</html>
