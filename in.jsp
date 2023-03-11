<%@ page
  language="java"
  import = "java.io.*,java.sql.*,java.util.*"

%>

<%
String msg = null;
RequestDispatcher rd =request.getRequestDispatcher("mainUserHome.jsp");

String id = request.getParameter("pin");
String type=request.getParameter("UserType");


Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url,"root","root");

Statement st=con.createStatement();  
PreparedStatement pst=con.prepareStatement("Select * from user where id=? and type=? ");

pst.setString(1, id);
pst.setString(2, type);
ResultSet rsp = pst.executeQuery(); 

if(rsp.next())
{
    String name=rsp.getString("firstname");
    name+=" ";
    name+=rsp.getString("lastname");

    if(type.equals("true"))
    {
        rd = request.getRequestDispatcher("mainUserHome.jsp");
        session.setAttribute("type",type);
        session.setAttribute("id",id);
        
        session.setAttribute("name",name);
        session.setAttribute("log","in");
    }
    else
    { 
       rd = request.getRequestDispatcher("otherUserHome.jsp");
       session.setAttribute("type",type);
       session.setAttribute("log","in");
       session.setAttribute("name",name);
       session.setAttribute("id",id);

    }
    rd.forward(request,response);
   

}
else
{
    RequestDispatcher r1 = request.getRequestDispatcher("err.jsp?msg=Login Failed!");
    r1.forward(request,response);


}

%>