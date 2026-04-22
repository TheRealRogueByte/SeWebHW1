package com.seweb.servlet;

import com.seweb.model.Recipe;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddRecipeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/addRecipe.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        String cuisineType1 = req.getParameter("cuisineType1");
        String cuisineType2 = req.getParameter("cuisineType2");
        String difficultyLevel = req.getParameter("difficultyLevel");

        // Server-side validation
        StringBuilder errors = new StringBuilder();
        if (title == null || title.trim().isEmpty())
            errors.append("Title is required. ");
        if (cuisineType1 == null || cuisineType1.trim().isEmpty())
            errors.append("Cuisine Type 1 is required. ");
        if (cuisineType2 == null || cuisineType2.trim().isEmpty())
            errors.append("Cuisine Type 2 is required. ");
        if (difficultyLevel == null || difficultyLevel.trim().isEmpty())
            errors.append("Difficulty Level is required. ");
        if (cuisineType1 != null && cuisineType1.equals(cuisineType2))
            errors.append("Cuisine types must be different. ");

        if (errors.length() > 0) {
            req.setAttribute("error", errors.toString());
            req.setAttribute("title", title);
            req.setAttribute("cuisineType1", cuisineType1);
            req.setAttribute("cuisineType2", cuisineType2);
            req.setAttribute("difficultyLevel", difficultyLevel);
            req.getRequestDispatcher("/WEB-INF/jsp/addRecipe.jsp").forward(req, resp);
            return;
        }

        String xmlPath = getServletContext().getRealPath("/WEB-INF/data/recipes.xml");
        try {
            Recipe recipe = new Recipe();
            recipe.setTitle(title.trim());
            recipe.setCuisineType1(cuisineType1.trim());
            recipe.setCuisineType2(cuisineType2.trim());
            recipe.setDifficultyLevel(difficultyLevel.trim());

            XMLUtil.addRecipe(xmlPath, recipe);
            req.setAttribute("success", "Recipe \"" + recipe.getTitle() + "\" added successfully!");
            req.getRequestDispatcher("/WEB-INF/jsp/addRecipe.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Failed to save recipe: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/addRecipe.jsp").forward(req, resp);
        }
    }
}
