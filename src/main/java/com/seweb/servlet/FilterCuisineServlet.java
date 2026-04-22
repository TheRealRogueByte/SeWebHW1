package com.seweb.servlet;

import com.seweb.model.Recipe;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class FilterCuisineServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String cuisine = req.getParameter("cuisine");
        String xmlPath = getServletContext().getRealPath("/WEB-INF/data/recipes.xml");
        try {
            List<Recipe> recipes = null;
            if (cuisine != null && !cuisine.trim().isEmpty()) {
                recipes = XMLUtil.queryRecipesByCuisine(xmlPath, cuisine.trim());
                req.setAttribute("selectedCuisine", cuisine.trim());
            }
            req.setAttribute("recipes", recipes);
            req.getRequestDispatcher("/WEB-INF/jsp/filterCuisine.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Error filtering recipes: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
        }
    }
}
