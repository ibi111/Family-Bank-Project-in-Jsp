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


if(pag!=null)
{
    r = request.getRequestDispatcher(pag);

    r.forward(request,response);
}

int amount =0;
int sal=0;
int bill=0;
int loan =0;

PreparedStatement pst;

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://127.0.0.1/bank";
Connection con=DriverManager.getConnection(url, "root", "root");
Statement st=con.createStatement();  

String query = "select * from  cardInfo" ;
ResultSet rs = st.executeQuery( query );

if(rs.next())
{
    amount = rs.getInt("amount");
    sal = rs.getInt("salary");

    pst=con.prepareStatement("Select * from bills where type=?");
    pst.setString(1,"bill");

     rs = pst.executeQuery( );

    while(rs.next())
    {
        bill+=rs.getInt("amount");
    }

    // fro loan

    pst.setString(1,"debit");

    rs = pst.executeQuery( );

    while(rs.next())
    {
        loan+=rs.getInt("amount");
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Redressed&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stats</title>
    <link rel="stylesheet" href="index.css">
    <style>

        #customers {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td,
        #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #customers tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #customers tr:hover {
            background-color: #ddd;
        }

        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color:#000000;
            color: white;
            font-size: 1.3rem;
        }

        #customers td {
            font-size: 1.1rem;

        }

        .table{
            padding: 0px 15px;
        }

.sugest{
    display:flex;
    justify-content: center;
    color:red;
    font-size: 1.5rem;
    padding:10px 0px;

}
    </style>
</head>

<body>
    <div id="back">
        <form action="chatbot.jsp" method="post">
          <input type="submit" value="<">
        </form>
  </div>
    <div class="navigation">
        <div>
            <li>
                <h1 id="h">SOMA National Bank </h1>
            </li>
        </div>
        <div>
            <li><img src="logo.png" alt="logo"></li>
        </div>
    </div>
    <div id="heading">
        <h1>Bot Stats:</h1>


    </div>

    <div class="table">
    <table id="customers">
    <tr><th>Balance</th>
    <th>Salary</th>
    <th>Loan</th>
    <th>Bills</th>
    </tr>
    <tr>
        <td><%= amount %></td>
        <td><%= sal %></td>
        <td><%= loan %></td>
        <td><%= bill %></td>
    </tr>
</table>

</div>

<div class="sugest">
    Amount Safe to Spend (<%=amount-(loan+bill) %>) assuming that the total amount in the bank already includes the salary.

</div>
</body>

</html>

<%


}
else{

    r = request.getRequestDispatcher("err.jsp?msg=card doesnot exists");
    r.forward(request,response);
   
}







%> 