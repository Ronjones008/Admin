<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<hr>
<center><h1>INVENTORY MANAGEMENT</h1></center>
<hr>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
    <form method="post">           
    User Name:
            <input type="text" name="UserName" maxlength="10" ><br><br>
            Password:
            <input type="password" name="passWord" maxlength="10" required><br><br>
            <input type="submit" value="SIGN IN"> <br><br>
            </center>
    </form>
    <center><a href="AddAdmin.jsp"><button>SIGN UP</button></a></center>
    <c:if test="${param.UserName != null && param.passWord != null}">
        <jsp:useBean id="admin" class="com.Infinite.inventoryproject.Admin"/>
        <jsp:setProperty property="*" name="admin"/>
        <jsp:useBean id="dao" class="com.Infinite.inventoryproject.AdminDAO"/>
        <c:out value="${dao.authenticate(param.UserName,param.passWord)}"/>


	
       <c:if test="${dao.authenticate(param.UserName, param.passWord) > 0 }">
       		<c:set var="userName" value="${param.UserName }" scope="session"></c:set>
            <jsp:forward page="AdminMenu.jsp"/>
        </c:if>
    </c:if>
    
    
    
    
    </body>
</html>