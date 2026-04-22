package com.seweb.servlet;

import com.seweb.model.Recipe;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RecipeDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id == null || id.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/recipes");
            return;
        }
        String xmlPath = getServletContext().getRealPath("/WEB-INF/data/recipes.xml");
        try {
            Recipe recipe = XMLUtil.queryRecipeById(xmlPath, id.trim());
            if (recipe == null) {
                req.setAttribute("error", "Recipe with ID " + id + " not found.");
                req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
                return;
            }
            req.setAttribute("recipe", recipe);
            req.getRequestDispatcher("/WEB-INF/jsp/recipeDetail.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Error loading recipe: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
        }
    }
}
