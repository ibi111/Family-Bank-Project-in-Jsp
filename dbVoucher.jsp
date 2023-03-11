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
    <title>Birthday</title>
    <link rel="stylesheet" href="index.css">
    <style>
        #heading {
            display: flex;
            justify-content: center;
            padding-top: 20px;
        }

        .table {
            /* border: 1px solid black; */
            padding: 20px 0px;
            margin-top: 40px;
      
        }

        #d {
            /* border: 1px solid rgb(137, 67, 67); */
            margin: 10px 0px;
            display: flex;
            justify-content: center;
            color: rgb(203 18 18);
        }

        #customers {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 60%;
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
        }

        .table{
            padding: 0px 15px;
            display: flex;
    justify-content: center;
        }

        #customers td {
          
          font-size: 1.1rem;

      }
      #customers th {
          
          font-size: 1.3rem;

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
                <h1 id="h">SOMA National Bank </h1>
            </li>
        </div>
        <div>
            <li><img src="logo.png" alt="logo"></li>
        </div>
    </div>
    <div id="heading">
        <h1>Birthday Vouchers</h1>
    </div>

    <div class="table">
        <table id="customers">
            <tr>
                <th>Name</th>
                <th>Date of Birth</th>

            </tr>
            <jsp:directive.include file = "bd.jsp" />   
        </table>
    </div>

</body>

</html>
