<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Sql</title>
</head>
<body>

<sql:setDataSource var = "contacts" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost:3306/laba10java"
                   user = "root"  password = "root"/>


<sql:query dataSource="${contacts}" var="myself" >
    SELECT * FROM users where login = ?
    <sql:param value="nikitayashny" />
</sql:query>

<sql:query dataSource="${contacts}" var="contacts">
    SELECT * FROM Users
</sql:query>

<h1>SQL TAGS</h1>

<table style="border: 1px solid black; width: 40%">
    <tr>
        <th>Login</th>
        <th>Password</th>
        <th>UserType</th>
    </tr>

    <c:forEach var = "row" items = "${contacts.rows}">
        <tr>
            <td> <c:out value = "${row.login}"/></td>
            <td> <c:out value = "${row.password}"/></td>
            <td> <c:out value = "${row.userType}"/></td>
        </tr>
    </c:forEach>
</table>



<br/><br/><br/>
<table style="border: 1px solid black; width: 25%">
    <tr>
        <th>Login</th>
        <th>Password</th>
        <th>UserType</th>
    </tr>

    <c:forEach var = "row" items = "${myself.rows}">
        <tr>
            <td> <c:out value = "${row.login}"/></td>
            <td> <c:out value = "${row.password}"/></td>
            <td> <c:out value = "${row.userType}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
