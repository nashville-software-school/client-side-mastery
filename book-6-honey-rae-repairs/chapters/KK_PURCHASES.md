# Ordering Candy

In this chapter, you need to allow the user to purchase candy. Add a "Purchase" button next to each item in your inventory list. When the user clicks on that button, you need to store a new object with the correct information in the **`purchases`** table in your database.

## Displaying Orders

Once you have the objects saving to the database, you need to put a new link in your **`NavBar`** component labeled "My Orders". When the user clicks on that order, a list of all candies that the user wants to purchase should be listed.

Display the candy name and the price of the candy.

Just get them all listed on the page first, knowing that there will be duplicates if the user clicked on a single candy multiple times.

To get the purchases for the current customer, you can specify that filtering in the URL when your query your API. For example, if the currently authenticated user's `id` is 97...

```html
http://localhost:8088/purchases?customerId=97
```
