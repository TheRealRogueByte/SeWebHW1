package com.seweb.servlet;

import com.seweb.model.User;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/addUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String cookingSkillLevel = req.getParameter("cookingSkillLevel");
        String preferredCuisineType = req.getParameter("preferredCuisineType");

        // Server-side validation
        StringBuilder errors = new StringBuilder();
        if (name == null || name.trim().isEmpty()) errors.append("Name is required. ");
        if (surname == null || surname.trim().isEmpty()) errors.append("Surname is required. ");
        if (cookingSkillLevel == null || cookingSkillLevel.trim().isEmpty()) errors.append("Skill level is required. ");
        if (preferredCuisineType == null || preferredCuisineType.trim().isEmpty()) errors.append("Preferred cuisine is required. ");

        if (errors.length() > 0) {
            req.setAttribute("error", errors.toString());
            req.setAttribute("name", name);
            req.setAttribute("surname", surname);
            req.setAttribute("cookingSkillLevel", cookingSkillLevel);
            req.setAttribute("preferredCuisineType", preferredCuisineType);
            req.getRequestDispatcher("/WEB-INF/jsp/addUser.jsp").forward(req, resp);
            return;
        }

        String xmlPath = getServletContext().getRealPath("/WEB-INF/data/users.xml");
        try {
            User user = new User();
            user.setName(name.trim());
            user.setSurname(surname.trim());
            user.setCookingSkillLevel(cookingSkillLevel.trim());
            user.setPreferredCuisineType(preferredCuisineType.trim());

            XMLUtil.addUser(xmlPath, user);
            req.setAttribute("success", "User \"" + user.getName() + " " + user.getSurname() + "\" added successfully!");
            req.getRequestDispatcher("/WEB-INF/jsp/addUser.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Failed to save user: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/addUser.jsp").forward(req, resp);
        }
    }
}
