<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>

    <h1>College Campus Management System</h1>

    <h2>Admin Login</h2>

    <form action="LoginServlet" method="post">

        <label>Username:</label>
        <input type="text" name="username" required>
        <br><br>

        <label>Password:</label>
        <input type="password" name="password" required>
        <br><br>

        <input type="submit" value="Login">

    </form>

</body>
</html>