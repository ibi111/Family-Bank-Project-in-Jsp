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
    <title>Mian User Home</title>
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
            padding: 25px 40px;
            display: flex;
           
        }

        .cont{
            width:80px;
        }

    </style>
</head>

<body>
    <div id="back">
        <form action="mainUserHome.jsp" method="post">
          <input type="submit" value="<">
        </form>
  </div>
    <div class="navigation">
        <div>
            <li>
                <h1 id="h">Soma National Bank </h1>
            </li>
        </div>
        <div>
            <li><img src="logo.png" alt="logo"></li>
        </div>
    </div>
    <div id="heading">
        <h1>Pay Bills</h1>
        
    </div>

    <div class="table">
        <table id="customers">
            <tr>
                <th>Description</th>
                <th>Amount</th>
                <th>Debit/bill</th>
                <th>monthly</th>
                <th>Last Date</th>
                <th class="cont">Pay:</th>
            </tr>
            <jsp:include page="getbills.jsp"/>  
   
        </table>
    </div>
    
</body>

</html>