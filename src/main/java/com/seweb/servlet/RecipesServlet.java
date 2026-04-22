package com.seweb.servlet;

import com.seweb.model.Recipe;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class RecipesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String xmlPath = getServletContext().getRealPath("/WEB-INF/data/recipes.xml");
        try {
            List<Recipe> recipes = XMLUtil.loadRecipes(xmlPath);
            req.setAttribute("recipes", recipes);
            req.getRequestDispatcher("/WEB-INF/jsp/recipes.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Failed to load recipes: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
        }
    }
}
