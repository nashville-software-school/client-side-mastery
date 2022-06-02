# Flowers for Weddings

The wedding business is booming. You decide to open up an online shop where wedding planners can come and purchase flowers from any of the retailers in your supply chain.

1. Add a register/login mechanism that saves consumer information in a `customers` resource in your database. Each customer must provide their name, the name of their business, their email address, and a password.
1. When a user authenticates, save their `id` in local storage.
1. When the user visits your site again, the login form should not appear if they authenticated previously.
1. Add a "Purchase" button next to each flower type in all of the Retailer HTML representations. Each time the wedding planner clicks on a button, 1 flower of that type needs to be saved to their shopping cart.
1. The cart representation in the database needs to store the following information.
    1. The customer's id
    1. The retailer's id
    1. The flower's id

## Sample Object Representation

```json
{
    "id": 1,
    "customerId": 5,
    "retailerId": 3,
    "flowerId": 11
}
```