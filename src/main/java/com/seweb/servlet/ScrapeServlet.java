package com.seweb.servlet;

import com.seweb.model.Recipe;
import com.seweb.util.ScraperUtil;
import com.seweb.util.XMLUtil;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ScrapeServlet extends HttpServlet {

    private static final String SCRAPE_URL =
            "https://www.bbcgoodfood.com/recipes/collection/budget-autumn";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/scrape.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String xmlPath = getServletContext().getRealPath("/WEB-INF/data/recipes.xml");
        try {
            List<Recipe> scraped = ScraperUtil.scrapeRecipes(SCRAPE_URL);
            if (scraped.isEmpty()) {
                req.setAttribute("error", "No recipes found. The website structure may have changed.");
                req.getRequestDispatcher("/WEB-INF/jsp/scrape.jsp").forward(req, resp);
                return;
            }
            for (Recipe r : scraped) {
                XMLUtil.addRecipe(xmlPath, r);
            }
            req.setAttribute("success", "Successfully scraped and added " + scraped.size() + " recipes!");
            req.setAttribute("scrapedRecipes", scraped);
            req.getRequestDispatcher("/WEB-INF/jsp/scrape.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Scraping failed: " + e.getMessage()
                    + ". Check your internet connection or the website may be unavailable.");
            req.getRequestDispatcher("/WEB-INF/jsp/scrape.jsp").forward(req, resp);
        }
    }
}
