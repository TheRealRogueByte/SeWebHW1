package com.seweb.servlet;

import com.seweb.model.User;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
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

            // Build user selector HTML snippet and embed into the XSL output
            String htmlOutput = XMLUtil.transformWithXSL(
                    recipesPath, xslPath,
                    selectedUser.getCookingSkillLevel(),
                    selectedUser.getFullName());

            // Inject user selector before closing </body>
            StringBuilder selector = new StringBuilder();
            selector.append("<div class='container mb-4'>");
            selector.append("<form method='get' action='/xsl-display' class='row g-2 align-items-center'>");
            selector.append("<div class='col-auto'><label class='col-form-label fw-semibold'>Switch User:</label></div>");
            selector.append("<div class='col-auto'><select name='userId' class='form-select' onchange='this.form.submit()'>");
            for (User u : users) {
                selector.append("<option value='").append(u.getId()).append("'");
                if (u.getId().equals(selectedUser.getId())) selector.append(" selected");
                selector.append(">").append(u.getFullName())
                        .append(" (").append(u.getCookingSkillLevel()).append(")</option>");
            }
            selector.append("</select></div></form></div>");

            htmlOutput = htmlOutput.replace("</body>", selector + "</body>");

            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            writer.write(htmlOutput);
        } catch (Exception e) {
            req.setAttribute("error", "XSL transform failed: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
        }
    }
}
