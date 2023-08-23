# Aggregating Order

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

## Option 1

You can use a basic `for..of` loop to do this. For this option, you can create a new `createLineItem()` function in your module. It will need to iterate the purchases for the current customer.

Perhaps start with a blank JavaScript `Map()`. Then, as you iterate the purchases for the current customer, check if the object has the current product's `id` as a key. If not, add a new key/value pair.

* The key will be an object with the product's `id` and `price` as properties.
* The value will be the quantity.

As you iterate the purchases, whenever you hit a product that is already in the Map(), increment the value by 1.

## Option 2

Do the same thing as option 1, but with the `.reduce()` array method directly in the JSX instead of having a separate function in your component module. This will require significant research on your part, failures, and likely some discussion with an instructor.