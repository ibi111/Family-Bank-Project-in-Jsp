<%@ page
  language="java"

%>
 <%String pag=null;

String log = (String)session.getAttribute("log");
String type = (String)session.getAttribute("type");
RequestDispatcher r;


if(log == null ){

    pag="err.jsp?msg=You are not Autherized to Access this page";
}
else if(type == null  ){
  
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
    <title>statement</title>
    <link rel="stylesheet" href="index.css">
    <style>
        #heading {
            display: flex;
            justify-content: center;
            padding: 20px 20px;
        }

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
        }
        #customers td {
          
          font-size: 1.1rem;

      }
      #customers th {
          
          font-size: 1.5rem;

      }

        .table{
            padding: 0px 40px;
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
        <h1>Statement</h1>


    </div>

    <div class="table">
        <table id="customers">
            <tr>
                <th>Tid#</th>
                <th>Description</th>
                <th>Amount</th>
                <th>Done By</th>
                <th>Date</th>
            </tr>
 
    <jsp:directive.include file = "trans.jsp" />   
        </table>
    </div>
</body>

</html>