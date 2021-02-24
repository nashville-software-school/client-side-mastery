# Kandy Korner Inventory

## Product Types

Create several objects in your `database.json` file to represent types of candies that you want to sell at your locations. For example...

* Hard Candy
* Gum
* Chocolate
* Sodas

These objects should be in the `productTypes` resource array.

## Products

Now create as many products as you want to sell at your locations. Each product should have a foreign key to which category it belongs to. It should also have a product name, and a price.

Then create a directory for your product components and create a module for your product provider component, your list component, and your individual product component.

Then, after the list of locations in the UI, display all of your products. Make sure you display all properties, even the foreign key.