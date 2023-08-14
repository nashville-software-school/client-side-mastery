# Kandy Korner Inventory

## Product Types

Create several objects in your `database.json` file to represent types of candies that you want to sell at your locations. For example...

* Hard Candy
* Gum
* Chocolate
* Sodas

These objects should be in the `productTypes` array.

## Products

Now create as many product objects in your API as you want to sell at your locations. Each product should have a foreign key to which category it belongs to. It should also have a product name, and a price.

---

**Given** that an employee wants to see a list of all products

**When** the employees clicks on a `Products` link in the navbar

**Then** a list of all products should be displayed, sorted by product name, with prices shown.

---

**Given** that an employee wants to see the most expensive products being sold

**When** the employee clicks on a button labeled "Top Priced"

**Then** only products that cost more than $2.00 per unit should be displayed
