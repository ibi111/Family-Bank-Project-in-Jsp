<%@ page
  language="java"

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
    <title>Add Card</title>
    <link rel="stylesheet" href="index.css">
    <style>
        #heading {
            display: flex;
            flex-direction: row;
            padding-right: 50px;
            padding-top: 50px;
            align-items: center;
            justify-content: center;
        }

        #heading h1 {
            padding-left: 20px;

        }

        .main {
            /* border: 2px solid black; */
            display: flex;
            flex-direction: column;
            /* flex-wrap: nowrap; */
            align-items: center;
            padding: 20px 50px;
        }
        .main label{
            width: 300px;            
        }

        .main div {
            /* border: 1px solid red; */
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            align-items: center;
            margin: auto;
            padding: 16px 10px;
        }
 </style>
</head>

<body>
    <div id="back">
        <form action="signUp.jsp" method="post">
          <input type="submit" value="<">
        </form>
  </div>
    <div class="navigation">
        <div>
            <li>
                <h1 id="h">SOMA National Bank </h1>
            </li>
        </div>
        <!-- <div>
            <li><img src="logo.png" alt="logo"></li>
        </div> -->
    </div>
    <div id="heading">
        <!-- <div>
            <img src="card.png" alt="logo">
        </div> -->
        <div>
            <h1>Add Card </h1>
        </div>


    </div>
    <div class="main">
        <form name="addCard" action="card.jsp" method="post" onsubmit="">

            <div class="box">
                <label>Enter Holder Name :</label>
                <input type="text" name="cardname" id="name_" required>

            </div>
            <div class="box">
                <label>Enter Credit Card No :</label>
                <input type="number" name="cardNo" id="name_" maxlength="5" required>
                <span id="err_card" class="error"></span>
            </div>

            <div class="box">
                <label>Enter Amount Available:</label>
                <input type="number" name="amount" id="amount_" min="0" required>
                <span id="err_number" class="error"></span></span>
            </div>
            <div class="box">
                <label>Enter Monthly Income:</label>
                <input type="number" name="income" id="income_" min="0" required>
                <span id="err_number" class="error"></span></span>
            </div>
            <div class="box" id="btn">
                <input type="submit" value="Add" name="addCard">
                <span id="sucessBox"></span>
            </div>

        </form>
    </div>

</body>

</html>