<%@ page
language="java"
import="java.io.*,java.util.*,javax.servlet.http.*,javax.servlet.*,java.sql.*"
session="true"

%>
 
 <%String pag=null;

String log = (String)session.getAttribute("log");
String typ = (String)session.getAttribute("type");
RequestDispatcher r;


if(log == null ){

    pag="err.jsp?msg=You are not Autherized to Access this page";
}
else if(typ == null || typ.equals("false") ){
  
    pag="err.jsp?msg=You are not Autherized to Access this page";

}
%>

<%

if(pag!=null)
{
    r = request.getRequestDispatcher(pag);

    r.forward(request,response);
}

String desc=request.getParameter("desc");
String amount=request.getParameter("amount");
String monthly=request.getParameter("monthly");
String type=request.getParameter("type");
String date=request.getParameter("lastDate");



Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url, "root", "root");

Statement st=con.createStatement();     

PreparedStatement pst=con.prepareStatement("Select * from bills where des=?");
pst.setString(1, desc);


ResultSet rsp = pst.executeQuery();   

if(rsp.next())
{
r = request.getRequestDispatcher("err.jsp?msg=Bill/debit already exists");
    r.forward(request,response);
    
}
else{
    int id=0;
   String que = "SELECT * FROM bills ORDER BY id DESC LIMIT 0, 1";
   ResultSet rpst=st.executeQuery(que);
   if(rpst.next())
   {
    id =rpst.getInt("id"); 
    id+=1;
    
   }
   


String query = "INSERT INTO bills(id, des,monthly,type,amount,date)VALUES('"+id+ "','"+desc+ "','"+monthly+ "','"+type+ "','"+amount+ "','"+date+ "')" ;

int rs = st.executeUpdate( query );

if(rs>=1)
{	r = request.getRequestDispatcher("addDebit.jsp");
r.forward(request,response); 		}
else
{
r = request.getRequestDispatcher("err.jsp?msg=Addition failed");
r.forward(request,response);   
}  

}
%>
