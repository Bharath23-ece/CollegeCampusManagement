<%@ page import="com.college.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
    <title>Faculty Management</title>
</head>
<body>

<h1>Faculty Management</h1>

<h2>Add Faculty</h2>

<form action="FacultyServlet" method="post">

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

    Designation:
    <input type="text" name="designation">
    <br><br>

    <input type="submit" value="Add Faculty">

</form>

<hr>

<h2>Faculty List</h2>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Department</th>
        <th>Designation</th>
    </tr>

<%
    try {
        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM faculty";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
%>

    <tr>
        <td><%= rs.getInt("faculty_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("department") %></td>
        <td><%= rs.getString("designation") %></td>
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