<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Core</title>
</head>
<body>
<h1>CORE TAGS</h1>


<p>--------------------------- Вывод в out ---------------------------</p>
<c:out value = "10 * 10 / 5 = "/><c:out value="${10 * 10 / 5}"/>
<br/><br/>


<p>----------------------- Условие if, remove -----------------------</p>
<c:set var="first" value="true" scope="page"/>
<c:if test="${ not empty first and first eq 'true' }">
    первое предложение
</c:if>
<c:remove var="first"/>
<c:if test="${empty first}">
    (второе предложение)
</c:if>
<br/><br/>


<p>--------------- Условие choose/when/otherwise ---------------</p>
<c:set var="number" value="10"/>
<c:choose>
    <c:when test="${ number > 0 }" >
        <c:out value="число ${ number } больше 0"/>
    </c:when>
    <c:when test="${ number == 0 }" >
        <c:out value="число ${ number } равно 0"/>
    </c:when>
    <c:otherwise>
        <c:out value="число ${ number } меньше 0"/>
    </c:otherwise>
</c:choose>
<br/><br/>


<p>----------------------- Исключения catch -----------------------</p>
<c:catch var="ArithmeticException">
    <% int num = 0 / 0; %>
</c:catch>
Caught exception: ${ArithmeticException}
<br/><br/>


<p>-------------------- Разделители forTokens --------------------</p>
<c:set var="str" value="a,.. b ;:- c :() d .., e ))" />
<c:forTokens var="token" items="${ str }" delims=".,-:);(">
    <c:out value="${ token }" />
</c:forTokens>
<br/><br/>

</body>
</html>