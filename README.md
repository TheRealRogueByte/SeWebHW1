# Recipe Recommender — Semantic Web Big HW1

## Team Members
- **Robert Leonte**

---

## Project Description

A Java web application (Servlet + JSP) for recommending recipes to users based on their cooking skill level and preferred cuisine type. Data is stored and queried via **XML**, validated with **DTD/XSD**, displayed using **XSL/XSLT**, and queried with **XPath**.

---

## Features Implemented

| # | Feature | Points | Status |
|---|---------|--------|--------|
| 1 | 24 recipes in XML (manual input) + Web scraper for BBC Good Food | 1.5 | ✅ |
| 2 | DTD (`recipes.dtd`) and XSD (`recipes.xsd`) validation schemas | 0.5 | ✅ |
| 3 | Load recipes from XML into memory and display in UI | 0.5 | ✅ |
| 4 | Add recipe form with server-side validation, saves to XML | 0.5 | ✅ |
| 5 | Add user form with validation, saves to XML | 1.0 | ✅ |
| 6 | Recommend recipes by cooking skill level (XPath) | 1.0 | ✅ |
| 7 | Recommend by skill level AND preferred cuisine (XPath) | 1.0 | ✅ |
| 8 | XSL display — yellow for skill match, green for others; user selector | 1.0 | ✅ |
| 9 | Recipe detail view using XPath `//recipe[@id='X']` | 1.0 | ✅ |
| 10 | Filter by cuisine type using XPath | 1.0 | ✅ |
| 11 | Bootstrap 5 UI with navbar and card-based layout | 1.0 | ✅ |

---

## Tech Stack

- **Java 11** + **Jakarta Servlet API 4.0**
- **JSP** + **JSTL** for view layer
- **XML** (DOM parsing) for data storage
- **DTD** + **XSD** for schema validation
- **XSL/XSLT** for styled recipe display
- **XPath** (`javax.xml.xpath`) for querying
- **Jsoup** for web scraping
- **Bootstrap 5** for UI
- **Apache Tomcat 9** as application server
- **Maven** for build

---

## How to Run

### Prerequisites
- Java 11+
- Apache Maven 3.6+
- Apache Tomcat 9 (or use the Maven Tomcat plugin)

### Option 1: Maven Tomcat Plugin (Easiest)
```bash
mvn tomcat7:run
```
Open browser at: `http://localhost:8080`

### Option 2: Deploy WAR to Tomcat
```bash
mvn clean package
# Copy target/recipe-recommender.war to TOMCAT_HOME/webapps/ROOT.war
# Start Tomcat
```

---

## Project Structure

```
src/
├── main/
│   ├── java/com/seweb/
│   │   ├── model/          Recipe.java, User.java
│   │   ├── servlet/        10 servlet classes
│   │   └── util/           XMLUtil.java, ScraperUtil.java
│   └── webapp/
│       └── WEB-INF/
│           ├── data/       recipes.xml, users.xml, recipes.xsd, recipes.dtd, recipes.xsl
│           ├── jsp/        JSP view pages
│           └── web.xml
```

---

## URL Endpoints

| URL | Description |
|-----|-------------|
| `/` | Home page |
| `/recipes` | List all recipes (Exercise 3) |
| `/add-recipe` | Add recipe form (Exercise 4) |
| `/add-user` | Add user form (Exercise 5) |
| `/recommend-skill` | Recommend by skill level (Exercise 6) |
| `/recommend-skill-cuisine` | Recommend by skill + cuisine (Exercise 7) |
| `/xsl-display` | XSL styled view with user selector (Exercise 8) |
| `/recipe-detail?id=X` | Recipe detail (Exercise 9) |
| `/filter-cuisine` | Filter by cuisine type (Exercise 10) |
| `/scrape` | Scrape recipes from BBC Good Food (Exercise 1) |

---

## XML Structure

### recipes.xml
```xml
<recipes>
  <recipe id="1">
    <title>Spaghetti Carbonara</title>
    <cuisineTypes>
      <cuisineType>Italian</cuisineType>
      <cuisineType>Mediterranean</cuisineType>
    </cuisineTypes>
    <difficultyLevel>Intermediate</difficultyLevel>
  </recipe>
</recipes>
```

### users.xml
```xml
<users>
  <user id="1">
    <name>John</name>
    <surname>Doe</surname>
    <cookingSkillLevel>Intermediate</cookingSkillLevel>
    <preferredCuisineType>Italian</preferredCuisineType>
  </user>
</users>
```
