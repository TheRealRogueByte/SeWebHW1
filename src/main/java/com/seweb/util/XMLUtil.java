package com.seweb.util;

import com.seweb.model.Recipe;
import com.seweb.model.User;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.xpath.*;
import java.io.*;
import java.util.*;

public class XMLUtil {

    // ─── Document helpers ────────────────────────────────────────────────────

    public static synchronized Document loadDocument(String xmlPath) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setValidating(false);
        factory.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
        DocumentBuilder builder = factory.newDocumentBuilder();
        return builder.parse(new File(xmlPath));
    }

    public static synchronized void saveDocument(Document doc, String xmlPath) throws Exception {
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
        DOMSource source = new DOMSource(doc);
        StreamResult result = new StreamResult(new File(xmlPath));
        transformer.transform(source, result);
    }

    private static String getChildText(Element parent, String tag) {
        NodeList nl = parent.getElementsByTagName(tag);
        if (nl.getLength() == 0) return "";
        return nl.item(0).getTextContent().trim();
    }

    // ─── Recipe operations ───────────────────────────────────────────────────

    public static List<Recipe> loadRecipes(String xmlPath) throws Exception {
        Document doc = loadDocument(xmlPath);
        return parseRecipeNodes(doc.getElementsByTagName("recipe"));
    }

    private static List<Recipe> parseRecipeNodes(NodeList nodes) {
        List<Recipe> recipes = new ArrayList<>();
        for (int i = 0; i < nodes.getLength(); i++) {
            if (nodes.item(i).getNodeType() != Node.ELEMENT_NODE) continue;
            Element el = (Element) nodes.item(i);
            Recipe r = new Recipe();
            r.setId(el.getAttribute("id"));
            r.setTitle(getChildText(el, "title"));
            r.setDifficultyLevel(getChildText(el, "difficultyLevel"));
            NodeList cuisines = el.getElementsByTagName("cuisineType");
            if (cuisines.getLength() > 0) r.setCuisineType1(cuisines.item(0).getTextContent().trim());
            if (cuisines.getLength() > 1) r.setCuisineType2(cuisines.item(1).getTextContent().trim());
            recipes.add(r);
        }
        return recipes;
    }

    public static List<Recipe> queryRecipesBySkillLevel(String xmlPath, String skillLevel) throws Exception {
        Document doc = loadDocument(xmlPath);
        XPath xpath = XPathFactory.newInstance().newXPath();
        String expr = "//recipe[difficultyLevel='" + skillLevel + "']";
        NodeList nodes = (NodeList) xpath.evaluate(expr, doc, XPathConstants.NODESET);
        return parseRecipeNodes(nodes);
    }

    public static List<Recipe> queryRecipesBySkillAndCuisine(String xmlPath, String skillLevel, String cuisine) throws Exception {
        Document doc = loadDocument(xmlPath);
        XPath xpath = XPathFactory.newInstance().newXPath();
        String expr = "//recipe[difficultyLevel='" + skillLevel
                + "' and cuisineTypes/cuisineType='" + cuisine + "']";
        NodeList nodes = (NodeList) xpath.evaluate(expr, doc, XPathConstants.NODESET);
        return parseRecipeNodes(nodes);
    }

    public static Recipe queryRecipeById(String xmlPath, String id) throws Exception {
        Document doc = loadDocument(xmlPath);
        XPath xpath = XPathFactory.newInstance().newXPath();
        String expr = "//recipe[@id='" + id + "']";
        Node node = (Node) xpath.evaluate(expr, doc, XPathConstants.NODE);
        if (node == null) return null;
        List<Recipe> list = parseRecipeNodes(new SingleNodeList(node));
        return list.isEmpty() ? null : list.get(0);
    }

    public static List<Recipe> queryRecipesByCuisine(String xmlPath, String cuisine) throws Exception {
        Document doc = loadDocument(xmlPath);
        XPath xpath = XPathFactory.newInstance().newXPath();
        String expr = "//recipe[cuisineTypes/cuisineType='" + cuisine + "']";
        NodeList nodes = (NodeList) xpath.evaluate(expr, doc, XPathConstants.NODESET);
        return parseRecipeNodes(nodes);
    }

    public static synchronized void addRecipe(String xmlPath, Recipe recipe) throws Exception {
        Document doc = loadDocument(xmlPath);
        Element root = doc.getDocumentElement();

        // determine next id
        NodeList existing = doc.getElementsByTagName("recipe");
        int maxId = 0;
        for (int i = 0; i < existing.getLength(); i++) {
            try {
                int id = Integer.parseInt(((Element) existing.item(i)).getAttribute("id"));
                if (id > maxId) maxId = id;
            } catch (NumberFormatException ignored) {}
        }
        recipe.setId(String.valueOf(maxId + 1));

        Element recipeEl = doc.createElement("recipe");
        recipeEl.setAttribute("id", recipe.getId());

        Element title = doc.createElement("title");
        title.setTextContent(recipe.getTitle());
        recipeEl.appendChild(title);

        Element cuisineTypes = doc.createElement("cuisineTypes");
        Element ct1 = doc.createElement("cuisineType");
        ct1.setTextContent(recipe.getCuisineType1());
        Element ct2 = doc.createElement("cuisineType");
        ct2.setTextContent(recipe.getCuisineType2());
        cuisineTypes.appendChild(ct1);
        cuisineTypes.appendChild(ct2);
        recipeEl.appendChild(cuisineTypes);

        Element diff = doc.createElement("difficultyLevel");
        diff.setTextContent(recipe.getDifficultyLevel());
        recipeEl.appendChild(diff);

        root.appendChild(recipeEl);
        saveDocument(doc, xmlPath);
    }

    // ─── User operations ─────────────────────────────────────────────────────

    public static List<User> loadUsers(String xmlPath) throws Exception {
        Document doc = loadDocument(xmlPath);
        NodeList nodes = doc.getElementsByTagName("user");
        List<User> users = new ArrayList<>();
        for (int i = 0; i < nodes.getLength(); i++) {
            if (nodes.item(i).getNodeType() != Node.ELEMENT_NODE) continue;
            Element el = (Element) nodes.item(i);
            User u = new User();
            u.setId(el.getAttribute("id"));
            u.setName(getChildText(el, "name"));
            u.setSurname(getChildText(el, "surname"));
            u.setCookingSkillLevel(getChildText(el, "cookingSkillLevel"));
            u.setPreferredCuisineType(getChildText(el, "preferredCuisineType"));
            users.add(u);
        }
        return users;
    }

    public static User getFirstUser(String xmlPath) throws Exception {
        List<User> users = loadUsers(xmlPath);
        return users.isEmpty() ? null : users.get(0);
    }

    public static User getUserById(String xmlPath, String id) throws Exception {
        List<User> users = loadUsers(xmlPath);
        return users.stream().filter(u -> u.getId().equals(id)).findFirst().orElse(null);
    }

    public static synchronized void addUser(String xmlPath, User user) throws Exception {
        Document doc = loadDocument(xmlPath);
        Element root = doc.getDocumentElement();

        NodeList existing = doc.getElementsByTagName("user");
        int maxId = 0;
        for (int i = 0; i < existing.getLength(); i++) {
            try {
                int id = Integer.parseInt(((Element) existing.item(i)).getAttribute("id"));
                if (id > maxId) maxId = id;
            } catch (NumberFormatException ignored) {}
        }
        user.setId(String.valueOf(maxId + 1));

        Element userEl = doc.createElement("user");
        userEl.setAttribute("id", user.getId());

        appendText(doc, userEl, "name", user.getName());
        appendText(doc, userEl, "surname", user.getSurname());
        appendText(doc, userEl, "cookingSkillLevel", user.getCookingSkillLevel());
        appendText(doc, userEl, "preferredCuisineType", user.getPreferredCuisineType());

        root.appendChild(userEl);
        saveDocument(doc, xmlPath);
    }

    private static void appendText(Document doc, Element parent, String tag, String value) {
        Element el = doc.createElement(tag);
        el.setTextContent(value);
        parent.appendChild(el);
    }

    // ─── XSL transformation ──────────────────────────────────────────────────

    public static String transformWithXSL(String xmlPath, String xslPath, String skillLevel, String userName) throws Exception {
        Document doc = loadDocument(xmlPath);
        Source xmlSource = new DOMSource(doc);
        Source xslSource = new StreamSource(new File(xslPath));

        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer(xslSource);
        transformer.setParameter("userSkillLevel", skillLevel);
        transformer.setParameter("userName", userName);

        StringWriter writer = new StringWriter();
        transformer.transform(xmlSource, new StreamResult(writer));
        return writer.toString();
    }

    // ─── Helper: single-node NodeList ────────────────────────────────────────

    private static class SingleNodeList implements NodeList {
        private final Node node;
        SingleNodeList(Node node) { this.node = node; }

        @Override public Node item(int index) { return index == 0 ? node : null; }
        @Override public int getLength() { return 1; }
    }
}
