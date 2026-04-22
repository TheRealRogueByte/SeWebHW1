package com.seweb.servlet;

import com.seweb.model.Recipe;
import com.seweb.model.User;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class RecommendSkillCuisineServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String recipesPath = getServletContext().getRealPath("/WEB-INF/data/recipes.xml");
        String usersPath   = getServletContext().getRealPath("/WEB-INF/data/users.xml");
        try {
            User firstUser = XMLUtil.getFirstUser(usersPath);
            if (firstUser == null) {
                req.setAttribute("error", "No users found. Please add a user first.");
                req.getRequestDispatcher("/WEB-INF/jsp/recommend.jsp").forward(req, resp);
                return;
            }
            List<Recipe> recipes = XMLUtil.queryRecipesBySkillAndCuisine(
                    recipesPath,
                    firstUser.getCookingSkillLevel(),
                    firstUser.getPreferredCuisineType());
            req.setAttribute("recipes", recipes);
            req.setAttribute("user", firstUser);
            req.setAttribute("mode", "skill-cuisine");
            req.getRequestDispatcher("/WEB-INF/jsp/recommend.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Error: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
        }
    }
}
