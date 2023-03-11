<%@ page
  language="java"
  session="true"

%>

<%
String typ = (String)session.getAttribute("type");
String pag;
session.removeAttribute("signUp");
session.invalidate();

pag = "login.jsp";

response.sendRedirect(pag);




%>