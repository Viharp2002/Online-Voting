<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="Votercss.css">
    </head>
    <body>
        <div id="Heading">
            <h1>Welcome to Gujarat - Digital Voting System</h1>
            <hr>
        </div>
        <div id="details">
            <h2>Signup</h2>
            <form action="Validate" method="post">
                <input type="text" name="Username" placeholder="Enter Your Full Name: "><br><br>
                <input type="number" name="voterid" placeholder="Enter Your Voter Id"><br><br> 
                <input type="password" name="Upassword" placeholder="password"><br><br>
                <input type="password" name="cpassword" placeholder="confirm password"><br><br>
                <input type="text" name="Address" placeholder="Enter Address"><br><br>
                <select id="drop" name="rolevalue">
                    <option value="1">Voter</option>
                    <option value="2">Admin</option>
                </select><br> <br>
                <button style="color:wheat;">Signup</button><br><br>
                <div style="font-family: 'Courier New', Courier, monospace;">
                    Already Signup :<a href="Login.jsp">Login Here</a>
                </div>
            </form>
        </div>
    </body>
</html>