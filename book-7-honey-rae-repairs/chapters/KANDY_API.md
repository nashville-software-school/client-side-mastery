# Kandy Korner

You are going to be building your own React application based off of what you have done with the code in Honey Rae's.

```sh
cd ~/workspace
npx create-react-app kandy-korner
cd kandy-korner
npm install --save react-router-dom
```

## Project Setup

We are giving you some boilerplate code that you will then customize as you build out Kandy Korner. Run the following command in your terminal.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nashville-software-school/client-side-mastery/master/book-7-honey-rae-repairs/chapters/scripts/kandy-setup.sh)"
```

# Kandy Korner Data

Before you start building your React application, you need a database to persist the data for it. Please follow these steps to get it set up.

```sh
cd ~/workspace
mkdir kandy-api
cd kandy-api
touch database.json
```

In your JSON file, create the following resources. Define the properties for each that you feel are appropriate. Make sure you reflect on the relationships and define all the foreign keys to establish those relationships.

| Resource | Description |
| -- | -- |
|**`users`** | Where basic user information for all users is stored _(name and email)_ |
|**`customers`** | The people who make candy purchases at your stores. Stores additional `loyaltyNumber` property which is a 5 digit number. Customers can make purchases from any store. |
|**`employees`** | Stores additional `startDate` and `payRate` properties in addition to what's in the users table. Employees can only be assigned to work at a single store. |
|**`locations`** | The physical location of your stores. Record the address and square footage of a location. |
|**`products`** | All of the different candies that you sell in your stores. A single product can be sold in multiple stores, depending on demand. Store the name of the product, its type, and its price per unit. |
|**`productTypes`** | All of your candies fall into categories _(e.g. hard candies, chocolates, gummies, etc...)_ |
|**`purchases`** | When a customer purchases candy at a store, a record of the transaction should be created. A purchase should record the customer that purchased it, which product was purchased, and how many of that product was purchased _(e.g. a customer can buy 5 Snickers bars in a single purchase)_. |

As always, if you want to run your ERD by someone on your instruction team for feedback, they are more than happy to do that with you.
