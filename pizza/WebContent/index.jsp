<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>피자전문점 판매관리 프로그램</title>
	<link rel="stylesheet" type="text/css" href="css/css.css">
</head>
<body>
	<%@ include file="common/header.jsp" %>
	<%@ include file="common/nav.jsp" %>
	
	<%
		String section = request.getParameter("section") != null ? request.getParameter("section") : "";
	
		switch(section) {
		case "sale_create": %> <%@ include file="section/sale_create.jsp" %> <%
			break;
		case "sale_list": %> <%@ include file="section/sale_list.jsp" %> <%
			break;
		case "sale_list_by_shop": %> <%@ include file="section/sale_list_by_shop.jsp" %> <%
			break;
		case "sale_list_by_pizza": %> <%@ include file="section/sale_list_by_pizza.jsp" %> <%
			break;
		default: %><h3>피자전문점 판매관리 프로그램</h3><%
			break;
		}	
	%>
	
	<%@ include file="common/footer.jsp" %>
</body>
</html>