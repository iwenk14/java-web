<html>
    <head>
        <style>
            a{
                font: bold 13px Verdana;
                padding: 2px;
                padding-left: 4px;
                display: block;
                width: 100px;
                color: black;
                text-decoration: underline;
            }
            a:hover{

                color: black;
                text-decoration: none;
            }

        </style>

        <script type="text/javascript" >
            function validate()
            {
                if(document.frm.username.value=="")
                {
                    alert("Please enter username");
                    document.frm.username.focus();
                    return false;
                }
                if(document.frm.password.value=="")
                {
                    alert("Please enter username");
                    document.frm.password.focus();
                    return false;
                }
                return true;
            }
            function trim(stringToTrim) {
                return stringToTrim.replace(/^\s+|\s+$/g,"");
            }

        </script>

        <meta http-equiv="Content-Type" content="text/html; 
charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div id="wrap">
        <%

                    String errmsg = "";
                    if (request.getParameter("errmsg") != null 
&& request.getParameter("errmsg") != "") {
                        errmsg = "Invalid username and password";
                    }else{
                        errmsg=" ";
                        }
        %>


        <form name="frm" onSubmit="return validate();" 
action="checkLogin.jsp" method="post">
            <table border="0" width="400px" align="center" 
bgcolor="#75B03C">
<tr><td colspan=2 align="center" 
style="color:red;"><%=errmsg%></td></tr>
<tr><td colspan=2 
align="center"> </td></tr>
<tr><td colspan=2 align="center"><b>User 
Login</b></td></tr><br>
<tr><td>Username : </td><td><input 
type="text" name="txtUsername" id="username"></td></tr>
<tr><td>Password : </td><td><input 
type="password" name="txtPassword" 
id="password"></td></tr>
<tr><td colspan=2 align="center">
                        <!--
<tr><td colspan=2 align="center"><input type="button" 
name="submit" value="Submit" 
onclick="login();"></td></tr>
<a href="user_register.jsp">New User</a>-->
                        <br><input type="submit" name="sSubmit" 
value="Login" /><br>
                    </td><br/></tr><br>
</table>
</form>
</div>
</body>
</html>