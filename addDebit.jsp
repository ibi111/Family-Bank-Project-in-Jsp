<%String pag=null;
 String log=(String)session.getAttribute("log");
  String type=(String)session.getAttribute("type");
    RequestDispatcher r;
     if(log==null ){ pag="err.jsp?msg=You are not Autherized to Access this page" ; } 
     else if(type==null || type.equals("false") )
     { pag="err.jsp?msg=You are not Autherized to Access this page" ; }
     
%>

    <% if(pag!=null) { r=request.getRequestDispatcher(pag); r.forward(request,response); } %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Redressed&display=swap" rel="stylesheet">
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add Debit</title>
            <link rel="stylesheet" href="index.css">
            <style>
                .main {
                    /* border: 2px solid black; */
                    display: flex;
                    flex-direction: column;
                    /* flex-wrap: nowrap; */
                    align-items: center;
                    padding-top: 80px;
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
                <h1>Add bills/Debits</h1>
            </div>

            <div class="main">
                <form action="bill.jsp" method="post">
                    <div>
                        <label for="">Description:</label>
                        <input type="text" name="desc" id="" required maxlength="50">
                    </div>
                    <div>
                        <label for="">Amount:</label>
                        <input type="number" name="amount" id="" required min="0">
                    </div>
                    <div>
                        <label for="">Monthly?</label>
                        <select name="monthly" id="">
                            <option value="true">yes</option>
                            <option value="false">no</option>
                        </select>
                    </div>
                    <div>
                        <label for="">Bill/Debit:</label>
                        <select name="type" id="">
                            <option value="bill">bill</option>
                            <option value="debit">debit</option>
                        </select>
                    </div>
                    <div >
                        <label>Last Date to pay:</label>
                        <input type="date" name="lastDate" id="dob_" required>

                    </div>
                    <div class="bt" id="btn">

                        <input type="submit" value="Add" name="">



                    </div>
                </form>


            </div>

        </body>

        </html>