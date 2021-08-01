# Kandy Korner Inventory

## Product Types

Create several objects in your `database.json` file to represent types of candies that you want to sell at your locations. For example...

* Hard Candy
* Gum
* Chocolate
* Sodas

These objects should be in the `productTypes` resource array.

## Products

Now create as many product objects in your API as you want to sell at your locations. Each product should have a foreign key to which category it belongs to. It should also have a product name, and a price.

1. Create a directory for your product components.
1. Create a module for your product list component.
1. Immediately below the list of locations in the UI, display all of your products. Make sure you display all properties, even the category foreign key.