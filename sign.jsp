<%@ page
  language="java"
  import="java.io.*,java.util.*,javax.servlet.http.*,javax.servlet.*,java.sql.*"
  session="true"

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


String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
String country=request.getParameter("country");
String dob=request.getParameter("dob");
String mobile=request.getParameter("phone");
String email=request.getParameter("email");
String type =  "true";


Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url, "root", "root");

Statement st=con.createStatement();     

PreparedStatement pst=con.prepareStatement("Select * from user where firstname=? and lastname=?");
pst.setString(1, firstname);
pst.setString(2, lastname);
ResultSet rsp = pst.executeQuery();   

if(rsp.next())
{
r = request.getRequestDispatcher("err.jsp?msg=user already exists");
    r.forward(request,response);
    
}
else{
    int id=1000;
   String que = "SELECT * FROM user ORDER BY id DESC LIMIT 0, 1";
   ResultSet rpst=st.executeQuery(que);
   if(rpst.next())
   {
    id =rpst.getInt("id"); 
    id+=1;
    session.setAttribute("id",id);
   }
   


String query = "INSERT INTO user(id , firstname,lastname,age,gender,nationality,dob,mobile,email,type)VALUES('"+id+ "','"+firstname+ "','"+lastname+ "','"+age+ "','"+gender+ "','" +country+ "','" +dob+ "','" +mobile+ "','" +email+ "','"+type+"')" ;

int rs = st.executeUpdate( query );

if(rs>=1)
{	r = request.getRequestDispatcher("addCard.jsp");
r.forward(request,response); 		}
else
{
r = request.getRequestDispatcher("err.jsp?msg=Sign up failed");
r.forward(request,response);   
}  
}

%>