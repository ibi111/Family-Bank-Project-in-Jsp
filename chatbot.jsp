<%String pg=null; String lg=(String)session.getAttribute("log"); String typ=(String)session.getAttribute("type");
    RequestDispatcher ro; if(lg==null ){ pg="err.jsp?msg=You are not Autherized to Access this page" ; } else
    if(typ==null || typ.equals("false") ){ pg="err.jsp?msg=You are not Autherized to Access this page" ; } %>

    <% if(pg!=null) { ro=request.getRequestDispatcher(pg); ro.forward(request,response); } %>

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
                    display: flex;
                    align-items: center;
                    flex-direction: column;
                    justify-content: center;
                }

                .table {
                    border: 1px solid rgb(0, 0, 0);
                    width: 70%;
                    height: 400px;
                    margin: 10px 0px;

                }



                .chat {
                    margin-top: 2%;

                }

                #btn input {
                    width: 300px;

                  
                }

                .tak {
                    margin-top: 3%;
                    /* border:1px solid black; */
                    margin-bottom: 1%;
                    width: 400px;
                    height: 300px;
                    box-shadow: 1px 1px 15px rgb(17, 19, 19);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 10px;
                    color: rgb(9, 9, 9);
                    border-radius: 10px;
                    font-size: 1.5rem;
                }

                #bt {
                
                    width: 50px;
                    border-radius: 3px;
                    color: rgb(0, 0, 0);
                    background-color: rgb(255, 255, 255);

                }

                #bt:hover{
                    color: white;
                    background-color: black;
                    cursor: pointer;
                }
            </style>

            <script>
                function talk() {
                    var know = {
                        "Who are you": "Hello, ChatGpt here!",
                        "How are you": "Good :)",
                        "What I can do for you": "Search ChatGpt on Google>>Thank Me Later",
                        "Your Followers":
                            " After My lanch in November 30, 2022, I took the Internet by storm. Now i have 1 billion active followers/users",
                        "Ok": "Thank you so much!",
                        "Bye": "Yup! we will catch up later"
                    }

                    var input = document.getElementById("q").value;
                    document.getElementById("1").innerHTML = input + "<br>";
                    if (input in know) {
                        document.getElementById("1").innerHTML = know[input] + "<br>";
                    }
                    else {
                        document.getElementById("1").innerHTML = "Sorry, I did'nt understand. <br>";
                    }

                    return true;

                }
            </script>
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
                <h1>My ChatBot</h1>
            </div>

            <div class="main">
                <div class="chat">
                    <label for="query">Talk with Me:</label>
                    <input type="text" name="query" id="q">
                    <input id="bt" type="button" value="Ok" onclick="return talk()">
                </div>
                <div class="tak" id="1">
                </div>
                <form action="chat.jsp">
                    <div id="btn">
                        <input class="box" type="submit" value="Check Safe Margins" name="signup">
                        <span id="sucessBox"></span>
                    </div>

                </form>

            </div>


        </body>

        </html>