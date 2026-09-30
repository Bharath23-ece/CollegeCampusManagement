package com.college;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            String courseName = request.getParameter("course_name");
            String courseCode = request.getParameter("course_code");
            String department = request.getParameter("department");
            int credits = Integer.parseInt(request.getParameter("credits"));

            String sql = "INSERT INTO courses " +
                         "(course_name, course_code, department, credits) " +
                         "VALUES (?, ?, ?, ?)";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, courseName);
                ps.setString(2, courseCode);
                ps.setString(3, department);
                ps.setInt(4, credits);

                ps.executeUpdate();

                response.sendRedirect("course.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println(
                    "Database error: " + e.getMessage()
                );
            }
        }
    }
}