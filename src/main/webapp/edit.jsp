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
<title>Insert title here</title>
 <%@include file="all_jsp_css.jsp" %>
</head>
<body>
	 <div class="container">
   	<%@include file="navbar.jsp" %>
   
   <%
   int noteId=Integer.parseInt(request.getParameter("note_id").trim());
   Session s=FactoryProvider.getFactory().openSession();
	Note note=(Note)s.get(Note.class, noteId);
	s.close();
   %>
   <form action="UpdateServlet" method="post">
   <input value=<%= note.getId() %> name="noteId" type="hidden"/>
  <div class="form-group">
    <label for="title">Note Title</label>
    <input type="text" 
    class="form-control" 
    id="title" 
    aria-describedby="emailHelp"  
    placeholder="Enter here"
    name="title"
    required
    value="<%= note.getTitle() %>"
    >
     </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea 
    name="content"
    id="content" 
    placeholder="Enter your content here"
    class="form-control"
    style="height:300px"
    required
    ><%= note.getContent() %></textarea>
    </div>
  
  <div class="container text-center">
  
  <button type="submit" class="btn btn-success">Save Note</button>
  
  </div>
</form>
</div>
</body>
</html>