<%@page
import="java.sql.*,java.util.*,java.time.LocalDate"


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

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url, "root", "root");

int balance=0;

Statement st=con.createStatement(); 

String id = request.getParameter("id");
String id1 = session.getAttribute("id").toString();
String name = (String) session.getAttribute("name");

PreparedStatement pst=con.prepareStatement("Select * from bills where id=?");
pst.setString(1,id);

ResultSet rs = pst.executeQuery();

if(rs.next())
{

   int amount = rs.getInt("amount");
   String desc = rs.getString("des");
   String monthly=rs.getString("monthly");
   String typ =rs.getString("type");

   pst= con.prepareStatement("Select * from cardinfo");
   ResultSet rps = pst.executeQuery();

   if(rps.next())
   {
      balance=rps.getInt("amount");
      if(balance>=amount)
      {
       balance-=amount;   
	      pst=con.prepareStatement("update cardinfo set amount=? where card=?");
	      pst.setInt(1,balance);
	      pst.setString(2, "123");
         pst.executeUpdate();

         if(monthly.equals("true"))//delete bill if not monthly
         {
             pst=con.prepareStatement("update bills set date=? where id=?");
              LocalDate futureDate = LocalDate.now().plusMonths(1);
              pst.setString(1,futureDate.toString());
            pst.setString(2, id);
             pst.executeUpdate();
   
         } 
       else{
       String query= "DELETE  From bills where id="+id;
       st.executeUpdate(query);
         }
  
         int i=1;
         String que = "SELECT * FROM transaction ORDER BY tno DESC LIMIT 0, 1";
         ResultSet rpst=st.executeQuery(que);
         if(rpst.next())
         {
           i =rpst.getInt("tno"); 
          i+=1;
   
         }
         String query = "INSERT INTO transaction(tno,id, des,name,amount,date)VALUES('"+i+ "','"+id1+ "','"+desc+ "','"+name+ "','"+amount+ "','"+LocalDate.now().toString()+ "')" ;
         st.executeUpdate( query );
  
         RequestDispatcher r1 = request.getRequestDispatcher("suc.jsp");
         r1.forward(request,response);
     }
     else{
      RequestDispatcher r1 = request.getRequestDispatcher("err.jsp?msg=Low Balance!");
       r1.forward(request,response);
      }
   }
   else
      {
       RequestDispatcher r1 = request.getRequestDispatcher("err.jsp?msg=Bill Error!");
       r1.forward(request,response);
      
      }
}
else
{
    RequestDispatcher r1 = request.getRequestDispatcher("err.jsp?msg=Processing failed Please try again later!");
    r1.forward(request,response);
}








%>