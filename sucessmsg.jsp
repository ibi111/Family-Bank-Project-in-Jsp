<%String pag=null;
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
    <title>Success</title>
    <link rel="stylesheet" href="index.css">

    <style>
        .msg{
            font-size: 4em;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    flex-direction: column; font-size: 2em;
            display: flex;
padding-top: 10%;
        

        }

        .msg div{
            margin:auto;
            padding: 50px 20px;
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
<div class ="msg" id="btn">
    <div id="head">
        <% 
        int id = (int)session.getAttribute("id");
        out.println("<h2>Sign Up Successful! your user pin is : "+id+"</h2>"); 
        
        %>

    </div>
    <div id ="pass">

    </div>

    <div id = "btn">
 <form action="login.jsp" method="post">
    <input type="submit" value="Login">
 </form>
    </div>

</div>    
</body>

</html>