<%@ page
  language="java"
  isErrorPage="true"
  
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
    <title>Responsive website</title>
    <link rel="stylesheet" href="index.css">
    <style>
        .main_section div{
            color:red;
            margin-top: 100px;
            display:flex;
            justify-content: center;

        }
    </style>
</head>

<body>
    <div class="navigation">
        <div>
            <li><h1 id="h">SOMA National Bank </h1></li>
        </div>
        <div>
            <li><img src="logo.png" alt="logo"></li>
        </div>
    </div>
  <div class="container">
        <div class="main_section">
  <% 
  String message = (String)request.getParameter("msg");          

  out.println("<div><h1> "+message+" </h1></div>");
   %>
  </div>
    </div>
</body>
</html>