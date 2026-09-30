<%@ page import="com.college.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
    <title>Course Management</title>
</head>
<body>

<h1>Course Management</h1>

<h2>Add Course</h2>

<form action="CourseServlet" method="post">

    <input type="hidden" name="action" value="add">

    Course Name:
    <input type="text" name="course_name" required>
    <br><br>

    Course Code:
    <input type="text" name="course_code">
    <br><br>

    Department:
    <input type="text" name="department">
    <br><br>

    Credits:
    <input type="number" name="credits">
    <br><br>

    <input type="submit" value="Add Course">

</form>

<hr>

<h2>Course List</h2>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Course Name</th>
        <th>Course Code</th>
        <th>Department</th>
        <th>Credits</th>
    </tr>

<%
    try {
        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM courses";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
%>

    <tr>
        <td><%= rs.getInt("course_id") %></td>
        <td><%= rs.getString("course_name") %></td>
        <td><%= rs.getString("course_code") %></td>
        <td><%= rs.getString("department") %></td>
        <td><%= rs.getInt("credits") %></td>
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