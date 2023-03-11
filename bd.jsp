<%@ page
import="java.sql.*,java.util.Date,java.util.*,java.time.*"


%>

 <%String pg=null;

String lg = (String)session.getAttribute("log");
String tp = (String)session.getAttribute("type");
RequestDispatcher rw;


if(lg == null ){

    pg="err.jsp?msg=You are not Autherized to Access this page";
}
else if(tp == null || tp.equals("false") ){
  
    pg="err.jsp?msg=You are not Autherized to Access this page";

}
%>

<%

if(pg!=null)
{
    rw = request.getRequestDispatcher(pg);

    rw.forward(request,response);
}

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url,"root","root");


Statement st=con.createStatement();  
PreparedStatement pst=con.prepareStatement("Select * from user");
ResultSet rsp = pst.executeQuery(); 




if(!rsp.next())
{
    out.println("<div style='display:flex;justify-content: center;color:red;margin:auto;'> <h3>No  Birthday approching in next 2 days</h3></div>");


}
else
{
    int sum=0;
    Date current = new Date();
   String d;
LocalDate localDate = current.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
LocalDate l;
int month = localDate.getMonthValue();
int day   = localDate.getDayOfMonth();
String mon="";
String dy="";

    while(rsp.next())
    {
        mon="";
         dy="";

        d=rsp.getString("dob"); 
        
         mon=mon+(d.charAt(5));
         mon=mon+(d.charAt(6));

         dy=dy+(d.charAt(8));
         dy=dy+(d.charAt(9));
       
        int di =Integer.parseInt(dy);
        int mo = Integer.parseInt(mon);


        if(di-day>=0 && di-day<3 && mo==month)
        {
            sum++;
            %>
            <tr>
                <td><%= rsp.getString("firstname")+" "+ rsp.getString("lastname") %></td>
                <td><%= d %></td>
             </tr><%
        }

      }

      if(sum==0)
      out.println("<td colspan='2'> <h3 style='color:red;'>No  Birthday approching in next 2 days </td>");
}





%> 