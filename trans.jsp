<%@ page
  language="java"
  import="java.sql.*,java.io.*"

%>
 <%String pg=null;

String lg = (String)session.getAttribute("log");
String typ = (String)session.getAttribute("type");
RequestDispatcher ri;


if(lg == null ){

    pg="err.jsp?msg=You are not Autherized to Access this page";
}
else if(typ == null  ){
  
    pg="err.jsp?msg=You are not Autherized to Access this page";

}
%>

<%

if(pg!=null)
{
    ri = request.getRequestDispatcher(pg);

    ri.forward(request,response);
}

String id = "";
    id = session.getAttribute("id").toString();


Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url,"root","root");

Statement st=con.createStatement();  
PreparedStatement pst;
if(type.equals("true"))
{
    pst=con.prepareStatement("Select * from transaction");
}
else{
    
    pst=con.prepareStatement("Select * from transaction where id=?");

    pst.setString(1,id);
}


ResultSet rs = pst.executeQuery(); 
int sum=0;

    while(rs.next()) 
    {
        sum++;
        String name = rs.getString("name");
        String date = rs.getString("date");
        String desc = rs.getString("des");
        int amount = rs.getInt("amount");
        int tno = rs.getInt("tno");
%>
       
    <tr>
       <td><%= tno %></td>
       <td><%= desc %></td>
       <td><%= amount %></td>
       <td><%= name %></td>
       <td><%= date %></td>
    </tr>
<%
    }

if(sum==0)
    out.println("<div style='display:flex;justify-content: center;color:red;margin:auto;'> <h3>No Transactions Found!"+id+"</h3></div>");








%> 