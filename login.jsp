<!-- <%@ page language="java" %> -->


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
            display: flex;
            flex-direction: column;
            /* flex-wrap: nowrap; */
            align-items: center;
            padding-top: 60px;
        }

        .main div {
            /* border: 1px solid red; */
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            align-items: center;
            /* margin: auto; */
            padding: 16px 10px;
        }

        .bt {
            position: relative;
            top: -147px;
            left: 60px;
        }


        @media screen and (min-width: 430px) {
            .bo {
                margin-left: 100px;
            }


        }

        @media screen and (max-width: 430px) {
            .bo {
                margin-left: 70px;
            }

        
        }
    </style>
</head>

<body>
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
        <h1>Login</h1>
    </div>
    <div class="main">

        <form action="in.jsp" method="post" name="login">
            <div class="box">
                <label>Enter UserPin:</label>
                <input type="number" name="pin" id="" required min="1000" max="9999">
                <span id="err_pin" class="error"></span>
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

            <div class="btns">
                <div class="bo" id="btn">
                    <input type="submit" value="Login" name="login">
                    <span id="sucessBox"></span>
                </div>

            </div>

        </form>
        <div class="bt" id="btn">
            <form action="signUp.jsp" method="post">
                <input type="submit" value="sign up" name="signup">
            </form>
            <span id="sucessBox"></span>

        </div>
    </div>

</body>

</html>