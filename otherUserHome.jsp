<%String pag=null;

String log = (String)session.getAttribute("log");
String type = (String)session.getAttribute("type");
RequestDispatcher r;


if(log == null ){

    pag="err.jsp?msg=You are not Autherized to Access this page";
}
else if(type == null || type.equals("true") ){
  
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
    <title>Other User Home</title>
    <link rel="stylesheet" href="index.css">
    <style>
 
 #heading {
            display: flex;
            justify-content: center;
            padding-top: 20px;
        }

        .main {
            /* border: 2px solid black; */
            display: flex;
            flex-direction: column;
            /* flex-wrap: nowrap; */
            align-items: center;
             margin-top: 70px;
            
        }

        .main div {
            /* border: 1px solid red; */
            display: flex;
            flex-wrap: wrap;
            
            align-items: center;
       
        
        }

        .main input,
        select {
            /* border: 1px solid black; */
            width: 150px;
        }

        .main label {
            width: 150px;
        }

   #btn1 input{

 
    width: 300px;
    height: 50px;
    font-size: 1.4rem;
    font-weight: bold;
    margin: auto;
    margin-top: 20px;
    border-radius: 10px;
    background-color: rgb(0, 0, 0);
    color: rgb(255, 255, 255);
    border: 1px solid  rgb(0, 0, 0);
}
#btn1 input:hover{
cursor: pointer;
background-color:  rgb(5, 72, 126);

border: 1px solid rgb(5, 72, 126);

  
}


    </style>
</head>

<body>
    <div id="back">
        <form action="login.jsp" method="post">
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
        <h1> User Home </h1>
    </div>
    <div id="welcome">

    </div>

    <div class="main">


        <!-- <div id="btn1">

            <form action="dbVoucher.jsp" method="post">
                <input type="submit" value="Birthday Gift Voucher " name="birthdayGift">

            </form>
        </div> -->
        <div id="btn1">

            <form action="statement1.jsp" method="post">
                <input type="submit" value="Statement" name="statement">

            </form>
        </div>


        <div class="box" id="btn">
            <form action="logout.jsp" method="post">
                <input type="submit" value="Log out" name="log out">
            </form>


        </div>


    </div>




</body>

</html>