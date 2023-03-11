<%@ page
  language="java"
  import = "java.sql.*"

%>

<%

String pag=null;
String signup = (String)session.getAttribute("signup");
RequestDispatcher r;


if(signup==null){
  if(pag==null)
  pag="err.jsp?msg=You are not Autherized to Access this page";

}

if(pag!=null)
{
  r = request.getRequestDispatcher(pag);
  r.forward(request,response);
}


String card=request.getParameter("cardNo");
int amount=Integer.parseInt(request.getParameter("amount"));
int salary=Integer.parseInt(request.getParameter("income"));

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url, "root", "root");

Statement st=con.createStatement(); 
PreparedStatement pst=con.prepareStatement("Select * from cardInfo where card=?");
pst.setString(1, card);
ResultSet rsp = pst.executeQuery();       

if(rsp.next())
{

r = request.getRequestDispatcher("err.jsp?msg=card already exists");
r.forward(request,response);
}
else{

String query = "INSERT INTO cardInfo(card,amount,salary)VALUES('"+card+ "','"+ amount +"', '"+salary+"')" ;
int rs = st.executeUpdate( query );

if(rs>=1)
{	r = request.getRequestDispatcher("sucessmsg.jsp");
r.forward(request,response); 		}
else
{	
r = request.getRequestDispatcher("err.jsp?msg=card addition failed");
r.forward(request,response);
        
}  

}
%>
