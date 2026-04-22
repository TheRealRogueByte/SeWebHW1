package com.seweb.servlet;

import com.seweb.model.User;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class XSLDisplayServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String recipesPath = getServletContext().getRealPath("/WEB-INF/data/recipes.xml");
        String usersPath   = getServletContext().getRealPath("/WEB-INF/data/users.xml");
        String xslPath     = getServletContext().getRealPath("/WEB-INF/data/recipes.xsl");

        String selectedUserId = req.getParameter("userId");

        try {
            List<User> users = XMLUtil.loadUsers(usersPath);
            User selectedUser = null;

            if (selectedUserId != null && !selectedUserId.isEmpty()) {
                selectedUser = XMLUtil.getUserById(usersPath, selectedUserId);
            }
            if (selectedUser == null && !users.isEmpty()) {
                selectedUser = users.get(0);
            }

            if (selectedUser == null) {
                req.setAttribute("error", "No users found. Please add a user first.");
                req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
                return;
            }

            String tableHtml = XMLUtil.transformWithXSL(
                    recipesPath, xslPath,
                    selectedUser.getCookingSkillLevel(),
                    selectedUser.getFullName());

            req.setAttribute("tableHtml", tableHtml);
            req.setAttribute("users", users);
            req.setAttribute("selectedUser", selectedUser);
            req.getRequestDispatcher("/WEB-INF/jsp/xslDisplay.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "XSL transform failed: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
        }
    }
}
