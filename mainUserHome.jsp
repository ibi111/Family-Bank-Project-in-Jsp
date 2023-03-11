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
 

        .main {
            /* border: 2px solid black; */
            display: flex;
            flex-direction: column;
            /* flex-wrap: nowrap; */
            align-items: center;
             margin-top: 30px;
            
        }

        .main div {
            /* border: 1px solid red; */
            display: flex;
            flex-wrap: wrap;
            
            align-items: center;
       
        
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
        <h1>Main User Home Page </h1>
    </div>
    <div id="welcome">

    </div>

    <div class="main">
        <div id="btn1">

            <form action="addFamily.jsp" method="post">
                <input type="submit" value="Add Family Members" name="addFamilyMembers">
            </form>
        </div>
        <div id="btn1">

            <form action="paybills.jsp" method="post">
                <input type="submit" value="Pay Bills " name="payBills">

            </form>
        </div>
        <div id="btn1">

            <form action="dbVoucher.jsp" method="post">
                <input type="submit" value="Birthday Gift Voucher " name="birthdayGift">

            </form>
        </div>
        <div id="btn1">

            <form action="statement.jsp" method="post">
                <input type="submit" value="Statement" name="statement">

            </form>
        </div>
        <div id="btn1">

            <form action="addDebit.jsp" method="post">
                <input type="submit" value="Add Debit/bills" name="addDebit">

            </form>
        </div>
        <div id="btn1">

            <form action="chatbot.jsp" method="post">
                <input type="submit" value="ChatBot" name="chatbot">

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