<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.query.*"%>
<%@ page import="com.helper.*"%>
<%@ page import="com.servelts.*"%>
<%@ page import="com.entities.*"%>
<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="all_jsp_css.jsp" %>
</head>
<body>
 	<div class="container">
   	<%@include file="navbar.jsp" %>
   	<br>
   	<h1 class="text-uppercase">All Notes:</h1>
   	<div class="row">
   	<div class="col-12">
   		<%
   	Session s=FactoryProvider.getFactory().openSession();
   	Query q=s.createSQLQuery("select * from notes");
   	List<Object[]> list=q.list();
   	for(Object[] note:list)
   	{
   		%>
   		<div class="card mt-3">
  <img class="card-img-top m-4 mx-auto" style="width:100px;" src="img/contract.png" alt="Card image cap">
  <div class="card-body px-5">
    <h5 class="card-title"><%= note[3] %></h5>
    <p class="card-text"><%= note[2] %></p>
    <div class="container text-center mt-2">
    <% int id1=((Integer)note[0]).intValue(); %>
    <a href="DeleteServlet?note_id=<%= id1 %>" class="btn btn-danger" >Delete</a>
    <a href="edit.jsp?note_id=<%= note[0] %>" class="btn btn-primary">Update</a>
    </div>
  </div>
</div>
   		
   		<% 
   		
   	}
   	
   	s.close();
   	
   	%>
   	
   	
   	</div>
   	</div>
   
   	 
   	
  	</div>
  	
</body>
</html>