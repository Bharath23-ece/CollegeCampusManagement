<%@ page import="com.college.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management</title>
</head>
<body>

<h1>Student Management</h1>

<h2>Add Student</h2>

<form action="StudentServlet" method="post">

    <input type="hidden" name="action" value="add">

    Name:
    <input type="text" name="name" required>
    <br><br>

    Email:
    <input type="email" name="email">
    <br><br>

    Phone:
    <input type="text" name="phone">
    <br><br>

    Department:
    <input type="text" name="department">
    <br><br>

    Year:
    <input type="number" name="year">
    <br><br>

    <input type="submit" value="Add Student">

</form>

<hr>

<h2>Student List</h2>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Department</th>
        <th>Year</th>
    </tr>

<%
    try {
        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM students";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
%>

    <tr>
        <td><%= rs.getInt("student_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("department") %></td>
        <td><%= rs.getInt("year") %></td>
    </tr>

<%
        }

        con.close();

    } catch (Exception e) {
        out.println("<p>Database error: " + e.getMessage() + "</p>");
    }
%>

</table>

</body>
</html>