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
    <title>Login</title>
    <link rel="stylesheet" href="index.css">
    <style>

        .main {
            /* border: 2px solid black; */
            margin-top: 25px;
            display: flex;
            flex-direction: column;
            /* flex-wrap: nowrap; */
            align-items: center;
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
        <h1>Add Family Member </h1>
    </div>
    <div class = "main">
        <form action="addMember.jsp" method="post">
            
            <div class="box">
                <label>Enter First Name:</label>
                <input type="text" name="firstname" id="name_" required>
                <span id="err_name" class="error"></span>
            </div>

            <div class="box">
                <label>Enter Last Name:</label>
                <input type="text" name="lastname" id="name_" required>
                <span id="err_lname" class="error"></span>
            </div>
            <div class="box">
                <label>Date of Birth</label>
                <input type="date" name="dob" id="dob_" required>
                <span id="err_dob" class="error"></span></span>
            </div>
            <div class="box">
                <label>Mobile NO:</label>
                <input type="number" id="phone" name="phone" minlength="12" maxlength="12" required>
                <span id="err_phone" class="error"></span></span>
            </div>
            
            <div class="box">
                <label>User Type:</label>
                <select name="UserType" id="">

                    <option value="true">Main</option>
                    <option value="false">Other</option>
                </select>
                <br>
                <span id="err_user" class="error"></span>
            </div>

            <div class="box" id="btn">
                <input type="submit" value="Add" name="signup">
                <span id="sucessBox"></span>
            </div>

        </form>
    </div>

</body>

</html>