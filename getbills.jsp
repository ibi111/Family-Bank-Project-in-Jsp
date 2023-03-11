 
 <%@page
 import="java.sql.*"
 
 
 %>
 
 
 <%String pag=null;

String log = (String)session.getAttribute("log");
String type = (String)session.getAttribute("type");
RequestDispatcher r;


if(log == null ){

    pag="err.jsp?msg=You are not Autherized to Access this page";
}
else if(type == null || type.equals("false") ){
  
    pag="err.jsp?msg=You are not Autherized to Access this page";

}
%>

<%

if(pag!=null)
{
    r = request.getRequestDispatcher(pag);

    r.forward(request,response);
}

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url, "root", "root");

Statement st=con.createStatement();     

PreparedStatement pst=con.prepareStatement("Select * from bills order by date");
ResultSet rs = pst.executeQuery();   
int sum=0;
while(rs.next()) 
{
    sum++;
    String desc = rs.getString("des");
    String date = rs.getString("date");
    String typ = rs.getString("type");
    String monthly = rs.getString("monthly");
    int amount = rs.getInt("amount");
    int id = rs.getInt("id");

    if(monthly.equals("true"))monthly="yes";
    else monthly="No";


%>
<tr>
   <td><%= desc %></td>
   <td><%= amount %></td>
   <td><%= typ %></td>
   <td><%= monthly %></td>
   <td><%= date %></td>
   <td>
   
        <form action="processBill.jsp" method="post" >
            <input style=" width:100%;height:100%;background: rgb(7, 7, 7);color: rgb(10, 10, 10);cursor:pointer;border-radius: 5px;" type="submit" name="id" placeholder="Pay" value=<%= '"' %><%= id  %><%= '"' %> >
            <span style="z-index: 100; color: white; font-weight: bold; position:relative;top: -26px;left:27px;cursor: pointer;">Pay</span>
        </form>
    
   </td>
</tr>
<%   
}

if(sum==0)
out.println("<div style='display:flex;justify-content: center;color:red;margin:auto;'> <h3>No Transactions Found!</h3></div>");
    
    

    
       




%>