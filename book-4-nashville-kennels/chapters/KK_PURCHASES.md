# Ordering Candy

In this chapter, you need to allow the user to purchase candy. Add a "Purchase" button next to each item in your inventory list. When the user clicks on that button, you need to store some information in your database that a specific customer wants to purchase a specific candy.

## Saving Candy Orders

* Customer can order multiple candies
* Each candy can be purchased by multiple customers

This feels like a new collection in your database. What properties are on these objects that store the relationship between customers and candies?

You need a new array in your `database.json`, and a new provider component in your application to interact with that new collection. Perhaps **`CustomerCandyProvider`**?

## Displaying Order

Once you have the objects saving to the database, you need to put a new link in your **`NavBar`** component labeled "My Order". When the user clicks on that order, a list of all candies that the user wants to purchase should be listed.

Display the candy name and the price of the candy.

Just get them all listed on the page first, knowing that there will be duplicates if the user clicked on a single candy multiple times.

## Challenge: Aggregating Order

You can accept this challenge if you like.

Instead of displaying each individual Customer <-> Candy relationship, you should aggregate the candies together. For example, if the user purchased 2 orange sodas, 8 chocolate bars, and 3 root beer barrels, you would currently see.

| Candy | Price |
| ----- | ----- |
| Orange Soda | 1.69 |
| Orange Soda | 1.69 |
| Chocolate Bar | 1.29 |
| Chocolate Bar | 1.29 |
| Chocolate Bar | 1.29 |
| Chocolate Bar | 1.29 |
| Chocolate Bar | 1.29 |
| Chocolate Bar | 1.29 |
| Chocolate Bar | 1.29 |
| Chocolate Bar | 1.29 |
| Root Beer Barrel | 0.24 |
| Root Beer Barrel | 0.24 |
| Root Beer Barrel | 0.24 |

Refactor the order view to display this instead.

| Candy | Quantity | Price/unit |
| ----- | ----- | ----- |
| Orange Soda | 2 |  1.69 |
| Chocolate Bar | 8 | 1.29 |
| Root Beer Barrel | 3 | 0.24 |

## Advanced Challenge: Total Cost

Refactor the order view to display the total line item cost instead of the price per unit.

| Candy | Quantity | Price/unit |
| ----- | ----- | ----- |
| Orange Soda | 2 |  3.38 |
| Chocolate Bar | 8 | 10.32 |
| Root Beer Barrel | 3 | 0.72 |
