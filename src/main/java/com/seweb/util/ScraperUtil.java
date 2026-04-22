package com.seweb.util;

import com.seweb.model.Recipe;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.*;

public class ScraperUtil {

    private static final String[] CUISINE_TYPES = {
        "Italian", "Mediterranean", "Asian", "Japanese", "Chinese", "Thai",
        "Indian", "Mexican", "American", "French", "European", "Western",
        "Greek", "Spanish", "British", "Middle Eastern"
    };

    private static final String[] DIFFICULTY_LEVELS = {"Beginner", "Intermediate", "Advanced"};

    private static final Random RANDOM = new Random();

    public static List<Recipe> scrapeRecipes(String url) throws Exception {
        List<Recipe> recipes = new ArrayList<>();

        Document doc = Jsoup.connect(url)
                .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0 Safari/537.36")
                .timeout(15000)
                .get();

        // BBC Good Food recipe cards
        Elements cards = doc.select("h2.heading-4, h3.heading-4, .card__title, [data-testid='card-title']");
        if (cards.isEmpty()) {
            cards = doc.select("a[href*='/recipes/'] h2, a[href*='/recipes/'] h3");
        }
        if (cards.isEmpty()) {
            cards = doc.select(".card__title-link, .link-complex__target");
        }

        Set<String> seen = new LinkedHashSet<>();
        for (Element card : cards) {
            String title = card.text().trim();
            if (!title.isEmpty() && seen.add(title)) {
                Recipe r = new Recipe();
                r.setTitle(title);
                // assign two distinct random cuisine types
                int i1 = RANDOM.nextInt(CUISINE_TYPES.length);
                int i2;
                do { i2 = RANDOM.nextInt(CUISINE_TYPES.length); } while (i2 == i1);
                r.setCuisineType1(CUISINE_TYPES[i1]);
                r.setCuisineType2(CUISINE_TYPES[i2]);
                r.setDifficultyLevel(DIFFICULTY_LEVELS[RANDOM.nextInt(DIFFICULTY_LEVELS.length)]);
                recipes.add(r);
                if (recipes.size() >= 30) break;
            }
        }
        return recipes;
    }
}
