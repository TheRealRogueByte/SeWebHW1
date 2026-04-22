package com.seweb.model;

public class Recipe {
    private String id;
    private String title;
    private String cuisineType1;
    private String cuisineType2;
    private String difficultyLevel;

    public Recipe() {}

    public Recipe(String id, String title, String cuisineType1, String cuisineType2, String difficultyLevel) {
        this.id = id;
        this.title = title;
        this.cuisineType1 = cuisineType1;
        this.cuisineType2 = cuisineType2;
        this.difficultyLevel = difficultyLevel;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getCuisineType1() { return cuisineType1; }
    public void setCuisineType1(String cuisineType1) { this.cuisineType1 = cuisineType1; }

    public String getCuisineType2() { return cuisineType2; }
    public void setCuisineType2(String cuisineType2) { this.cuisineType2 = cuisineType2; }

    public String getDifficultyLevel() { return difficultyLevel; }
    public void setDifficultyLevel(String difficultyLevel) { this.difficultyLevel = difficultyLevel; }

    @Override
    public String toString() {
        return "Recipe{id=" + id + ", title=" + title + ", cuisine1=" + cuisineType1
                + ", cuisine2=" + cuisineType2 + ", difficulty=" + difficultyLevel + "}";
    }
}
